import pathlib
import shutil
from subprocess import STDOUT, check_call

VERSION = "2.0.17"

path = pathlib.Path(__file__).parent.absolute()
dvc = path / "dvc"

try:
    shutil.rmtree(dvc)
except FileNotFoundError:
    pass

check_call(["git", "clone", "https://github.com/iterative/dvc"], stderr=STDOUT)
check_call(["git", "checkout", VERSION], stderr=STDOUT, cwd=dvc)
