<html>
<body bgcolor="white" text="black" link="#0000FF" vlink="#840084" alink="#0000FF">
    <div class="navheader">
        <table align="center" width="100%" summary="Navigation header">
            <tr>
                <th colspan="3" align="center">Windows: Using Microsoft Visual Studio</th>
            </tr>
            <tr>
                <th width="60%" align="center">Setup and Build Instructions</th>
            </tr>
        </table>
        <hr>
    </div>
    <div class="section">
        <div class="titlepage">
            <div>
                <div>
                    <h2 class="title" style="clear: both">
                        <a name="ChSetupWindows"></a>Windows: Using Microsoft Visual Studio<a name="ChSetupWin32"></a>
                    </h2>
                </div>
            </div>
        </div>
        <p>A quick setup guide for Windows development with recommended configurations.</p>
        <div class="warning" style="">
            <table border="0" summary="Warning">
                <tr>
                    <th align="left">Warning:</th>
                </tr>
                <tr>
                    <td align="left" valign="top">
                        <p>
                            Unless you know exactly what you are doing, you
                            should strictly follow the recommendations below. They are known to work
                            and if the build breaks, please re-read this guide carefully.
                        </p>
                        <p>Known traps are:</p>
                        <div class="orderedlist">
                            <ol class="orderedlist" type="1">
                                <li class="listitem">
                                    Not using the correct (x64 or x86) version of the Visual Studio command prompt.
                                </li>
                                <li class="listitem">
                                    Not using a supported version of Windows. Please check
                                    <a class="ulink" href="https://support.microsoft.com/en-gb/help/13853/windows-lifecycle-fact-sheet" target="_top">here</a>
                                    that your installed version is supported and updated.
                                </li>
                            </ol>
                        </div>
                    </td>
                </tr>
            </table>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupChocolatey"></a>1. Recommended: Install Chocolatey</h3>
                    </div>
                </div>
            </div>
            <p>
                <a class="ulink" href="https://chocolatey.org/" target="_top">Chocolatey</a> is a native package manager for
                Windows. There are <a class="ulink" href="https://chocolatey.org/packages" target="_top">packages</a> for most of
                the software listed below. Along with traditional Windows packages it
                supports the Python Package Index.
            </p>
            <p>
                Chocolatey tends to install packages into its own path (%ChocolateyInstall%), although packages are free to use their own preferences.
                You can install Chocolatey packages using the command <code class="literal">choco install</code> (or its shorthand, <code class="literal">cinst</code>), e.g.
            </p>
            <pre class="programlisting">rem Flex is required.
choco install -y winflexbison3
rem Git, CMake, Python, etc are also required, but can be installed
rem via their respective installation packages.
choco install -y git cmake python3</pre>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupMSVC"></a>2. Install Microsoft Visual Studio</h3>
                    </div>
                </div>
            </div>
            <p>
                Download and install <a class="ulink" href="https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&amp;rel=17" target="_top">“Microsoft Visual Studio 2022 Community Edition”</a>.
                If you prefer you can instead download and install <a class="ulink" href="https://visualstudio.microsoft.com/thank-you-downloading-visual-studio/?sku=Community&amp;rel=16" target="_top">“Microsoft Visual Studio 2019 Community Edition”</a>.
                The examples below are for Visual Studio 2022 but can be adapted for Visual Studio 2019.
                These are small utilities that download all the other required parts (which are quite large).
            </p>
            <p>
                Check the checkbox for “Desktop development with C++” and then uncheck
                all the optional components other than
            </p>
            <div class="itemizedlist">
                <ul class="itemizedlist" style="list-style-type: disc; ">
                    <li class="listitem">
                        “MSVC …​ VS 2022 C++” item with the “…​ build tools (Latest)”
                    </li>
                    <li class="listitem">
                        “Windows 11 SDK”
                    </li>
                    <li class="listitem">
                        “C++ CMake tools for Windows"
                    </li>
                </ul>
            </div>
            <p>(unless you want to use them for purposes other than Wireshark).</p>
            <p>
                You can alternatively use Chocolatey to install Visual Studio, using the Visual Studio Community and Native Desktop workload packages.
                Note that this includes Visual Studio’s CMake component.
            </p>
            <pre class="screen">choco install -y visualstudio2022community visualstudio2022-workload-nativedesktop</pre>
            <p>
                You can use other Microsoft C compiler variants, but VS2022 is used to
                build the development releases and is the preferred option. It’s
                possible to compile Wireshark with a wide range of Microsoft C compiler
                variants. For details see <a class="xref" href="ChToolsMSChain.html" title="4.5. Microsoft compiler toolchain (Windows native)">Section 4.5, “Microsoft compiler toolchain (Windows native)”</a>.
            </p>
            <p>You may have to do this as Administrator.</p>
            <p>
                Compiling with gcc or Clang is not recommended and will
                certainly not work (at least not without a lot of advanced
                tweaking). For further details on this topic, see
                <a class="xref" href="ChToolsGNUChain.html" title="4.4. GNU Compiler Toolchain (UNIX And UNIX-like Platforms)">Section 4.4, “GNU Compiler Toolchain (UNIX And UNIX-like Platforms)”</a>. This may change in future as releases
                of Visual Studio add more cross-platform support.
            </p>
            <p>
                Why is this recommended?
                While this is a huge download, the Community Editions of Visual Studio are free (as in beer) and include the Visual Studio integrated debugger.
                Visual Studio 2022 is also used to create official Wireshark builds, so it will likely have fewer development-related problems.
            </p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupQt"></a>3. Install Qt</h3>
                    </div>
                </div>
            </div>
            <p>
                The main Wireshark application uses the Qt windowing toolkit. To install
                Qt, go to the <a class="ulink" href="https://www.qt.io/download" target="_top">“Download Qt” page</a>, select
                "Download open source", then "Download Qt Online Installer", and download
                "<span class="strong"><strong>Qt Online Installer for Windows</strong></span>". When executing it, sign up or log in,
                and use Next button to proceed. When asked, select "<span class="strong"><strong>Custom installation</strong></span>".
            </p>
            <p>
                In the "Select Components" page, select your desired Qt version. We recommend
                the latest LTS version, and the stable Windows installers currently ship with Qt 6.5.3.
                Select the following components:
            </p>
            <div class="itemizedlist">
                <ul class="itemizedlist" style="list-style-type: disc; ">
                    <li class="listitem">
                        MSVC 2019 64-bit
                    </li>
                    <li class="listitem">
                        Qt 5 Compatibility Module
                    </li>
                    <li class="listitem">
                        Qt Debug Information Files (contains PDB files which can be used for debugging)
                    </li>
                    <li class="listitem">
                        Under "Additional Libraries" select "Qt Multimedia" to support advanced
                        controls for playing back streams in the RTP Player dialog
                    </li>
                    <li class="listitem">
                        You can deselect all of the other the components
                        such as “Qt Charts” or “Android xxxx” as they aren’t required.
                    </li>
                </ul>
            </div>
            <p>
                The CMake variable CMAKE_PREFIX_PATH (see <code class="literal"><a class="ulink" href="https://doc.qt.io/qt-6/cmake-get-started.html" target="_top">https://doc.qt.io/qt-6/cmake-get-started.html</a></code>) should be set as appropriate for your environment and should point to the Qt installation directory, e.g. <span class="emphasis"><em>C:\Qt\6.5.3\msvc2019_64</em></span>
                Alternatively you can also use the environment variable WIRESHARK_QT6_PREFIX_PATH.
            </p>
            <p>
                Qt 6 is the default option for building Wireshark, but Wireshark has support for Qt 5.12 and later. To enable Wireshark to build with Qt 5 pass <code class="literal">-DUSE_qt6=OFF</code>
                to cmake.
            </p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupPython"></a>4. Install Python</h3>
                    </div>
                </div>
            </div>
            <p>
                Get a Python 3 installer from <a class="ulink" href="https://python.org/download/" target="_top">https://python.org/download/</a> and install Python.
                Its installation location varies depending on the options selected in the installer and on the version of Python that you are installing.
                At the time of this writing the latest version of Python is 3.10, and common installation directories are
                <span class="emphasis"><em>C:\Users\<span class="strong"><strong>username</strong></span>\AppData\Local\Programs\Python\Python310</em></span>, <span class="emphasis"><em>C:\Program Files\Python310</em></span>, and <span class="emphasis"><em>C:\Python310</em></span>.
            </p>
            <p>Alternatively you can install Python using Chocolatey:</p>
            <pre class="screen">choco install -y python3</pre>
            <p>Chocolatey will likely install Python in one of the locations above, or possibly in <span class="emphasis"><em>C:\Tools\Python3</em></span>.</p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupGit"></a>5. Install Git</h3>
                    </div>
                </div>
            </div>
            <p>
                Please note that the following is not required to build Wireshark but can be
                quite helpful when working with the sources.
            </p>
            <p>
                Working with the Git source repositories is highly recommended, as described in
                <a class="xref" href="ChSrcObtain.html" title="3.4. Obtaining The Wireshark Sources">Section 3.4, “Obtaining The Wireshark Sources”</a>. It is much easier to update a personal source tree (local repository) with Git
                rather than downloading a zip file and merging new sources into a personal
                source tree by hand. It also makes first-time setup easy and enables the
                Wireshark build process to determine your current source code revision.
            </p>
            <p>
                There are several ways in which Git can be installed. Most packages are
                available at the URLs below or via <a class="ulink" href="https://chocolatey.org/" target="_top">Chocolatey</a>.
                Note that many of the GUI interfaces depend on the command line version.
            </p>
            <p>
                If installing the Windows version of git select the
                <span class="emphasis"><em>Use Git from the Windows Command Prompt</em></span> (in chocolatey the <span class="emphasis"><em>/GitOnlyOnPath</em></span>
                option). Do <span class="strong"><strong>not</strong></span> select the <span class="emphasis"><em>Use Git and optional Unix tools from the Windows Command Prompt</em></span>
                option (in chocolatey the <span class="emphasis"><em>/GitAndUnixToolsOnPath</em></span> option).
            </p>
            <div class="section">
                <p>The command line client can be installed (and updated) using Chocolatey:</p>
                <pre>choco install -y git</pre>
            </div>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupCMake"></a>6. Install CMake</h3>
                    </div>
                </div>
            </div>
            <p>
                While CMake is required to build Wireshark, it might have been installed as a component of either Visual Studio or Qt.
                If that’s the case you can skip this step.
                If you do want or need to install CMake, you can get it from <a class="ulink" href="https://cmake.org/download/" target="_top">https://cmake.org/download/</a>.
                Installing CMake into the default location is recommended.
                Ensure the directory containing cmake.exe is added to your path.
            </p>
            <p>Alternatively you can install it using Chocolatey:</p>
            <pre class="screen">choco install -y cmake</pre>
            <p>Chocolatey ensures cmake.exe is on your path.</p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupAsciidoctor"></a>7. Install Asciidoctor, Xsltproc, And DocBook</h3>
                    </div>
                </div>
            </div>
            <p>
                <a class="ulink" href="https://asciidoctor.org/" target="_top">Asciidoctor</a> can be run directly as a Ruby script or via a Java wrapper (AsciidoctorJ).
                The JavaScript flavor (Asciidoctor.js) isn’t yet supported.
                It is used in conjunction with Xsltproc and DocBook to generate the documentation you’re reading and the User’s Guide.
            </p>
            <p>
                You can install AsciidoctorJ, Xsltproc, and DocBook using Chocolatey.
                AsciidoctorJ requires a Java runtime and there are <a class="ulink" href="https://en.wikipedia.org/wiki/List_of_Java_virtual_machines" target="_top">many to choose from</a>.
                Chocolatey doesn’t support alternative package dependencies at the present time, including dependencies on Java.
                As a result, installing the asciidoctorj package won’t automatically install a Java runtime — you must install one separately.
            </p>
            <pre class="screen">choco install -y &lt;your favorite Java runtime&gt;
choco install -y asciidoctorj xsltproc docbook-bundle</pre>
            <p>
                Chocolatey ensures that asciidoctorj.exe and xsltproc.exe is on your
                path and that xsltproc uses the DocBook catalog.
            </p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="_install_winflexbison"></a>8. Install winflexbison</h3>
                    </div>
                </div>
            </div>
            <p>
                Get the winFlexBison installer from
                <a class="ulink" href="https://sourceforge.net/projects/winflexbison/" target="_top">https://sourceforge.net/projects/winflexbison/</a>
                and install into the default location.
                Ensure the directory containing win_flex.exe is on your path.
            </p>
            <p>Alternatively you can install Winflexbison using Chocolatey:</p>
            <pre class="screen">choco install -y winflexbison3</pre>
            <p>Chocolatey ensures win_flex.exe is on your path.</p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="_optional_install_perl"></a>9. Optional: Install Perl</h3>
                    </div>
                </div>
            </div>
            <p>
                If needed you can get a Perl installer from
                <a class="ulink" href="http://strawberryperl.com/" target="_top">http://strawberryperl.com/</a>
                or
                <a class="ulink" href="https://www.activestate.com/" target="_top">https://www.activestate.com/</a>
                and install Perl into the default location.
            </p>
            <p>Alternatively you can install Perl using Chocolatey:</p>
            <pre class="screen">choco install -y strawberryperl
# ...or...
choco install -y activeperl</pre>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="_install_and_prepare_sources"></a>10. Install and Prepare Sources</h3>
                    </div>
                </div>
            </div>
            <div class="tip" style="margin-right: 0.5in;">
                <table border="0" summary="Tip: Make sure everything works">
                    <tr>
                        <th align="left">Tip: Make sure everything works</th>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <p>
                                It’s a good idea to make sure Wireshark compiles and runs at least once before
                                you start hacking the Wireshark sources for your own project. This example uses
                                Git Extensions but any other Git client should work as well.
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            <p>
                <span class="strong"><strong>Download sources</strong></span> Download Wireshark sources into
                <span class="emphasis"><em>C:\Development\wireshark</em></span> using either the command line or Git Extensions:
            </p>
            <p>Using the command line:</p>
            <pre class="screen">cd C:\Development
git clone https://gitlab.com/wireshark/wireshark.git</pre>
            <p>Using Git extensions:</p>
            <div class="orderedlist">
                <ol class="orderedlist" type="1">
                    <li class="listitem">
                        Open the Git Extensions application. By default Git Extensions
                        will show a validation checklist at startup. If anything needs to
                        be fixed do so now. You can bring up the checklist at any time
                        via <span class="guimenu">Tools</span> → <span class="guimenuitem">Settings</span>.
                    </li>
                    <li class="listitem">
                        <p class="simpara">In the main screen select <span class="emphasis"><em>Clone repository</em></span>. Fill in the following:</p>
                        <p class="simpara">Repository to clone: <span class="strong"><strong><code class="literal"><a class="ulink" href="https://gitlab.com/wireshark/wireshark.git" target="_top">https://gitlab.com/wireshark/wireshark.git</a></code></strong></span></p>
                        <p class="simpara">Destination: Your top-level development directory, e.g. <span class="emphasis"><em>C:\Development</em></span>.</p>
                        <p class="simpara">Subdirectory to create: Anything you’d like. Usually <span class="emphasis"><em>wireshark</em></span>.</p>
                        <div class="tip" style="margin-right: 0.5in;">
                            <table border="0" summary="Tip: Check your paths">
                                <tr>
                                    <th align="left">Tip: Check your paths</th>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <p>Make sure your repository path doesn’t contain spaces.</p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </li>
                    <li class="listitem">
                        Click the <span class="guibutton">Clone</span> button. Git Extensions should start cloning the
                        Wireshark repository.
                    </li>
                </ol>
            </div>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChSetupPrepareCommandCom"></a>11. Open a Visual Studio Command Prompt</h3>
                    </div>
                </div>
            </div>
            <p>
                From the Start Menu (or Start Screen), navigate to the “Visual Studio 2022” folder and choose the <a class="ulink" href="https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#developer_command_prompt_shortcuts" target="_top">Command Prompt</a> appropriate for the build you wish to make, e.g. “x64 Native Tools Command Prompt for VS 2022” for a 64-bit version.
                Depending on your version of Windows the Command Prompt list might be directly under “Visual Studio 2022” or you might have to dig for it under multiple folders, e.g. <span class="guimenu">Visual Studio 2022</span> → <span class="guisubmenu">Visual Studio Tools</span> → <span class="guimenuitem">Windows Desktop Command Prompts</span>.
            </p>
            <p>
                You can set up a build environment in your own command prompt by running the appropriate <code class="literal">vcvars<span class="emphasis"><em>ARCHITECTURE</em></span>.bat</code> command.
                See <a class="ulink" href="https://docs.microsoft.com/en-us/cpp/build/building-on-the-command-line?view=msvc-170#use-the-developer-tools-in-an-existing-command-window" target="_top">Use the Microsoft C++ toolset from the command line</a> for details.
            </p>
            <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">
                <table border="0" summary="Tip: Pin the items to the Task Bar">
                    <tr>
                        <th align="left">Tip: Pin the items to the Task Bar</th>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <p>Pin the Command Prompt you use to the Task Bar for easy access.</p>
                        </td>
                    </tr>
                </table>
            </div>
            <p>All subsequent operations take place in this Command Prompt window.</p>
            <div class="orderedlist">
                <ol class="orderedlist" type="1">
                    <li class="listitem">
                        <p class="simpara">Set environment variables to control the build.</p>
                        <p class="simpara">Set the following environment variables, using paths and values suitable for your installation:</p>
                        <pre class="screen">rem Let CMake determine the library download directory name under
rem WIRESHARK_BASE_DIR or set it explicitly by using WIRESHARK_LIB_DIR.
rem Set *one* of these.
set WIRESHARK_BASE_DIR=C:\Development
rem set WIRESHARK_LIB_DIR=c:\wireshark-x64-libs
rem Set the Qt installation directory
set WIRESHARK_QT6_PREFIX_PATH=C:\Qt\6.5.3\msvc2019_64
rem Append a custom string to the package version. Optional.
set WIRESHARK_VERSION_EXTRA=-YourExtraVersionInfo</pre>
                        <p class="simpara">
                            Setting these variables could be added to a batch file to be run after you open
                            the Visual Studio Tools Command Prompt.
                        </p>
                        <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">
                            <table border="0" summary="Tip: Use of Qt’s LTS branch">
                                <tr>
                                    <th align="left">Tip: Use of Qt’s LTS branch</th>
                                </tr>
                                <tr>
                                    <td align="left" valign="top">
                                        <p>
                                            It is generally recommended to use a LTS ("long term support") version for Qt. The current LTS version for Qt 6 is
                                            6.5.3.
                                        </p>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </li>
                    <li class="listitem">
                        <p class="simpara">
                            Create and change to the correct build directory.
                            CMake is best used in an out-of-tree build configuration where the build is done in a separate directory from the source tree, leaving the source tree in a pristine state.
                            64 and 32 bit builds require a separate build directory.
                            Create (if required) and change to the appropriate build directory.
                        </p>
                        <pre class="screen">mkdir C:\Development\wsbuild64
cd C:\Development\wsbuild64</pre>
                        <p class="simpara">to create and jump into the build directory.</p>
                        <p class="simpara">The build directory can be deleted at any time and the build files regenerated as detailed in <a class="xref" href="ChSetupWindows.html#ChWindowsGenerate" title="12. Generate the build files">Section 12, “Generate the build files”</a>.</p>
                    </li>
                </ol>
            </div>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChWindowsGenerate"></a>12. Generate the build files</h3>
                    </div>
                </div>
            </div>
            <p>
                CMake is used to process the CMakeLists.txt files in the source tree and produce build files appropriate
                for your system.
            </p>
            <p>
                You can generate Visual Studio solution files to build either from within Visual Studio, or from the command
                line with MSBuild. CMake can also generate other build types but they aren’t supported.
            </p>
            <p>
                The initial generation step is only required the first time a build directory is created. Subsequent
                builds will regenerate the build files as required.
            </p>
            <p>If you’ve closed the Visual Studio Command Prompt <a class="link" href="ChSetupWindows.html#ChSetupPrepareCommandCom" title="11. Open a Visual Studio Command Prompt">prepare</a> it again.</p>
            <p>To generate the build files enter the following at the Visual Studio command prompt:</p>
            <pre class="screen">cmake -G "Visual Studio 17 2022" -A x64 ..\wireshark</pre>
            <p>
                Adjusting the path to the Wireshark source tree as required.
                To use a different generator modify the <code class="literal">-G</code> parameter.
                <code class="literal">cmake -G</code> lists all the CMake supported generators, but only Visual Studio is supported for Wireshark builds.
                32-bit builds are no longer supported.
            </p>
            <p>
                The CMake generation process will download the required 3rd party libraries (apart from Qt)
                as required, then test each library for usability before generating the build files.
            </p>
            <p>At the end of the CMake generation process the following should be displayed:</p>
            <pre class="screen">-- Configuring done
-- Generating done
-- Build files have been written to: C:/Development/wsbuild64</pre>
            <p>
                If you get any other output, there is an issue in your environment that must be rectified before building.
                Check the parameters passed to CMake, especially the <code class="literal">-G</code> option and the path to the Wireshark sources and
                the environment variables <code class="literal">WIRESHARK_BASE_DIR</code> and <code class="literal">CMAKE_PREFIX_PATH</code>.
            </p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="ChWindowsBuild"></a>13. Build Wireshark</h3>
                    </div>
                </div>
            </div>
            <p>Now it’s time to build Wireshark!</p>
            <div class="orderedlist">
                <ol class="orderedlist" type="1">
                    <li class="listitem">
                        If you’ve closed the Visual Studio Command Prompt <a class="link" href="ChSetupWindows.html#ChSetupPrepareCommandCom" title="11. Open a Visual Studio Command Prompt">prepare</a> it again.
                    </li>
                    <li class="listitem">
                        <p class="simpara">Run</p>
                        <pre class="screen">msbuild /m /p:Configuration=RelWithDebInfo Wireshark.sln</pre>
                        <p class="simpara">to build Wireshark.</p>
                    </li>
                    <li class="listitem">
                        Wait for Wireshark to compile. This will take a while, and there will be a lot of text output in the command prompt window
                    </li>
                    <li class="listitem">
                        Run <span class="emphasis"><em>C:\Development\wsbuild64\run\RelWithDebInfo\Wireshark.exe</em></span> and make sure it starts.
                    </li>
                    <li class="listitem">
                        Open <span class="guimenu">Help</span> → <span class="guimenuitem">About</span>. If it shows your "private" program
                        version, e.g.: Version 4.3.0-myprotocol123
                        congratulations! You have compiled your own version of Wireshark!
                    </li>
                </ol>
            </div>
            <p>You may also open the Wireshark solution file (<span class="emphasis"><em>Wireshark.sln</em></span>) in the Visual Studio IDE and build there.</p>
            <div class="tip" style="margin-left: 0.5in; margin-right: 0.5in;">
                <table border="0" summary="Tip">
                    <tr>
                        <th align="left">Tip:</th>
                    </tr>
                    <tr>
                        <td align="left" valign="top">
                            <p>
                                If compilation fails for suspicious reasons after you changed some source
                                files try to clean the build files by running 
                                <pre>msbuild /m /p:Configuration=RelWithDebInfo Wireshark.sln /t:Clean</pre>
                                and then building the solution again.
                            </p>
                        </td>
                    </tr>
                </table>
            </div>
            <p>The build files produced by CMake will regenerate themselves if required by changes in the source tree.</p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="_debug_environment_setup"></a>14. Debug Environment Setup</h3>
                    </div>
                </div>
            </div>
            <p>
                You can debug using the Visual Studio Debugger or WinDbg. See the section
                on using the <a class="link" href="ChToolsDebugger.html" title="4.7. Debugger">Debugger Tools</a>.
            </p>
        </div>
        <div class="section">
            <div class="titlepage">
                <div>
                    <div>
                        <h3 class="title"><a name="_optional_create_users_and_developers_guide_2"></a>15. Optional: Create User’s and Developer’s Guide</h3>
                    </div>
                </div>
            </div>
            <p>
                To build the Wireshark User’s Guide and the Wireshark Developer’s Guide,
                build the <code class="literal">all_guides</code> target, e.g.  <code class="literal">msbuild all_guides.vcxproj</code>.
                Detailed information to build these guides can be found in the file
                <span class="emphasis"><em>docbook\README.adoc</em></span> in the Wireshark sources.
            </p>
        </div>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
</body>
</html>