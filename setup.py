
from setuptools import setup, find_packages

setup(
    name="csvstats",  # Package name
    version="0.1.0",  # Semantic versioning
    author="Pragya Khare",
    description="A CLI tool to analyze CSV columns and compute statistics",
    packages=find_packages(),  # Automatically find all packages in the directory
    install_requires=[
        "pandas"  # Dependency listed here
    ],
    entry_points={
        "console_scripts": [
            "csvstats-tool=csvstats.cli:main"  # CLI entry point
        ]
    }
)
