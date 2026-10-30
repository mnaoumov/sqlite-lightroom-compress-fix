Based on https://community.adobe.com/t5/lightroom-classic-discussions/lightroom-sqlite-database-binary-xmp-format/m-p/11277989#M193377

---

This directory contains the sources and libraries necessary to build a version
of "sqlite3" on Windows and Mac that contains the sqlite3 extension functions
compress() and uncompress(), which Lightroom uses to read and write compressed
text fields in the catalog databases.

To build on Mac:

    sh make-sqlite.sh

To build on Windows;

    make-sqlite.bat

---------------------------

To update the Sqlite source, download the Sqlite amalgamation from here:

    https://sqlite.org/download.html

Unzip it and place the contents in this directory.

Modfy shell.c to have these lines:

```c
/* Register compress -- John R. Ellis 12/4/2019 */
extern void sqlite3_compress_init(void);
sqlite3_auto_extension(&sqlite3_compress_init);
```


right after these lines:

```c
#else
    /* All the sqlite3_config() calls have now been made. So it is safe
    ** to call sqlite3_initialize() and process any command line -vfs option. */
    sqlite3_initialize();
#endif
```

Copy `/opt/local/include/zconf.h` and `zlib.h` to here.

Download Windows zlib "Complete package":

    http://gnuwin32.sourceforge.net/packages/zlib.htm

Copy `zlib1.dll` and `zlib.lib` from `c:\Program Files (x86)\GnuWin32` to here.

## Filing an issue (for AI agents and humans)

Open issues through the [issue forms](https://github.com/mnaoumov/sqlite-lightroom-compress-fix/issues/new/choose), not as blank issues.

Filing from the CLI or the API (`gh issue create --body`, or an AI agent filing for you) skips the form, and `gh issue create --template` cannot load an issue form. In that case, open the matching form in [`.github/ISSUE_TEMPLATE/`](https://github.com/mnaoumov/sqlite-lightroom-compress-fix/tree/HEAD/.github/ISSUE_TEMPLATE), copy every field as a `### <label>` heading in the form's order, and fill in each one. Always state the version you used and your operating system.
