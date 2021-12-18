from setuptools import setup

setup(
    name='kintro-web',
    version='0.0.1',
    description='Thin web client for kintro cli tool',
    author='merc1031',
    url=(
        'https://github.com/merc1031/kintro-web'
    ),
    packages=['kintro-web'],
    keywords=['kodi', 'plex', 'intro'],
    classifiers=[],
    install_requires=[
        'click',
        'flask',
        'kintro @ git+https://github.com/neckbeard-io/kintro@main#egg=kintro',
    ]
)
