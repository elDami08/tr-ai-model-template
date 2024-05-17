import os


def put_gitkeep(path):
    os.makedirs(path, exist_ok=True)
    open(os.path.join(path, '.gitkeep'), 'a').close()

def create_project_structure():
    project_dir = os.path.dirname(os.path.abspath(__file__))
    initiatives = ['named-initiative']
    cientists = ['Albert Rudolph','Camila Aguirre','Luis Alvarez']
    base_folders = [
        "src/main/queries",
        "src/main/dml",
        "src/main/ddl",
        "src/main/composer",
        "src/main/gcp_connections",
        "src/main/models",
    ]
    sub_folders = [
        "data-in",
        "data-out",
        "logs",
        "exe",
        "tmp"
    ]

    normalized_cientists = [cientist.lower().replace(' ', '.') for cientist in cientists]

    # Create the folder structure, for base folders and initiatives folders
    for folder in base_folders:
        path = os.path.join(project_dir, folder)
        put_gitkeep(path)

    # Create the initiatives folder structure
    for initiative in initiatives:
        for cientist in normalized_cientists:
            for sub_folder in sub_folders:
                path = os.path.join(project_dir, f"notebooks/{initiative}/{cientist}/{sub_folder}")
                put_gitkeep(path)

def main():
    create_project_structure()

if __name__ == "__main__":
    main()