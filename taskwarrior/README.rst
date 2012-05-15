Taskwarrior config files
========================

Taskwarrior is pretty neat -- somewhat similar to todo.txt but with a few more
features (like recurring tasks, projects with dependencies, etc).  I encourage
you to check it out. Taskwarrior is available for most platforms. Just check out their `Downloads
page`_

.. _Downloads page : http://taskwarrior.org/projects/taskwarrior/wiki/Download

Storing your data
-----------------

The ``.gitignore`` file is set up to ignore ``task.symlink`` so you can put
your own task data there without worry. (I symlink the file from my Dropbox).

Completions
-----------

There are completions stored in ``$ZSH/functions/_task``. I grabbed them from
the task warrior source code, so you may want to update them in the future.
The completions.zsh file here just prettifies taskwarrior's completions.

Find out more about taskwarrior
-------------------------------

* Website: http://taskwarrior.org
* Download: http://taskwarrior.org/projects/taskwarrior/wiki/Download
