import subprocess
import shutil 
import os 

project_path = r"C:\Vs code\Opeartion A1\buildrunforpy" 
'''###
subprocess.run(
    ["cargo", "build", "--release"],
    check=True,
    cwd=project_path
)
'''
source = project_path + "\target\release\hello_world.d"
print(source)
des = "C:\Vs code\Opeartion A1\frontend"
shutil.copy(source,des)

full_path = os.path.join(base_path, folder_name)
os.makedirs(full_path, exist_ok=True)