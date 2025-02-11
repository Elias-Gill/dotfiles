from ranger.api.commands import Command

class paste_as_root(Command):
	def execute(self):
		if self.fm.do_cut:
			self.fm.execute_console('shell sudo mv %c .')
		else:
			self.fm.execute_console('shell sudo cp -r %c .')

class fzf_select(Command):
    """
    :fzf_select

    Find a file using fzf.

    With a prefix argument select only directories.

    See: https://github.com/junegunn/fzf
    """
    def execute(self):
        import subprocess
        import os.path
        if self.quantifier:
            # match only directories
            command="find -L . ( -path '*/.*' -o -fstype 'dev' -o -fstype 'proc' -o -path '*/node_modules' -o -path '*/go' -o -path '*/Escritorio' ) -prune \
            -o -type d -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to file'"
        else:
            # match files and directories
            command="find -L . ( -path '*/.*' -o -fstype 'dev' -o -fstype 'proc' -o -path '*/node_modules' -o -path '*/go' -o -path '*/Escritorio' ) -prune \
            -o -print 2> /dev/null | sed 1d | cut -b3- | fzf +m --reverse --header='Jump to filemap <C-f> fzf_select'"
        fzf = self.fm.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
        stdout, stderr = fzf.communicate()
        if fzf.returncode == 0:
            fzf_file = os.path.abspath(stdout.rstrip('\n'))
            if os.path.isdir(fzf_file):
                self.fm.cd(fzf_file)
            else:
                self.fm.select_file(fzf_file)

# -------- CUSTOM IMAGE PREVIEW -----------
from ranger.ext.img_display import ImageDisplayer, register_image_displayer
@register_image_displayer("chafa")
class MyImageDisplayer(ImageDisplayer):
    def draw(self, path, start_x, start_y, width, height):
        import subprocess
        import os.path
        command="f'chafa {path} --size={width}x{height}'"
        self.execute_command(command, universal_newlines=True, stdout=subprocess.PIPE)
