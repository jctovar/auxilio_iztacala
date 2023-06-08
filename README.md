# alerta

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)

For help getting started with Flutter development, view the
[online documentation](https://docs.flutter.dev/), which offers tutorials,
samples, guidance on mobile development, and a full API reference.


## Error on apache server with icons forlder
I found the answer! I couldn't figure out what was different about the icons/ directory so I did a search inside of all of the files in the /etc/apache2 directory for icons, and what do you know, a bunch of files I didn't recognize come up. I Googled "Apache icons directory" and found this article that describes how the icons directory is aliased to /usr/share/apache2/icons/ and can't be overwritten.

copy icons from icons to usr/share/apache2/icons/