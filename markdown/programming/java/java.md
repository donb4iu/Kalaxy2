# Java

## References
- [The Software Development Kit Manager](https://sdkman.io/)
- [Java Version Management: The right way to manage Java versions](https://medium.com/javarevisited/java-version-management-the-right-way-to-manage-java-versions-3c3554dc2512)

- [All the 16 Lombok Annotations Explained in a 4-minute article](https://medium.com/javarevisited/all-the-16-lombok-annotations-explained-in-a-4-minute-article-926f71934ec6)

## Version Management

### #( 07/10/24@10:23AM )( donbuddenbaum@donbs-imac ):~
   curl -s "https://get.sdkman.io" | bash
```   

                                -+syyyyyyys:
                            `/yho:`       -yd.
                         `/yh/`             +m.
                       .oho.                 hy                          .`
                     .sh/`                   :N`                `-/o`  `+dyyo:.
                   .yh:`                     `M-          `-/osysoym  :hs` `-+sys:      hhyssssssssy+
                 .sh:`                       `N:          ms/-``  yy.yh-      -hy.    `.N-````````+N.
               `od/`                         `N-       -/oM-      ddd+`     `sd:     hNNm        -N:
              :do`                           .M.       dMMM-     `ms.      /d+`     `NMMs       `do
            .yy-                             :N`    ```mMMM.      -      -hy.       /MMM:       yh
          `+d+`           `:/oo/`       `-/osyh/ossssssdNMM`           .sh:         yMMN`      /m.
         -dh-           :ymNMMMMy  `-/shmNm-`:N/-.``   `.sN            /N-         `NMMy      .m/
       `oNs`          -hysosmMMMMydmNmds+-.:ohm           :             sd`        :MMM/      yy
      .hN+           /d:    -MMMmhs/-.`   .MMMh   .ss+-                 `yy`       sMMN`     :N.
     :mN/           `N/     `o/-`         :MMMo   +MMMN-         .`      `ds       mMMh      do
    /NN/            `N+....--:/+oooosooo+:sMMM:   hMMMM:        `my       .m+     -MMM+     :N.
   /NMo              -+ooooo+/:-....`...:+hNMN.  `NMMMd`        .MM/       -m:    oMMN.     hs
  -NMd`                                    :mm   -MMMm- .s/     -MMm.       /m-   mMMd     -N.
 `mMM/                                      .-   /MMh. -dMo     -MMMy        od. .MMMs..---yh
 +MMM.                                           sNo`.sNMM+     :MMMM/        sh`+MMMNmNm+++-
 mMMM-                                           /--ohmMMM+     :MMMMm.       `hyymmmdddo
 MMMMh.                  ````                  `-+yy/`yMMM/     :MMMMMy       -sm:.``..-:-.`
 dMMMMmo-.``````..-:/osyhddddho.           `+shdh+.   hMMM:     :MmMMMM/   ./yy/` `:sys+/+sh/
 .dMMMMMMmdddddmmNMMMNNNNNMMMMMs           sNdo-      dMMM-  `-/yd/MMMMm-:sy+.   :hs-      /N`
  `/ymNNNNNNNmmdys+/::----/dMMm:          +m-         mMMM+ohmo/.` sMMMMdo-    .om:       `sh
     `.-----+/.`       `.-+hh/`         `od.          NMMNmds/     `mmy:`     +mMy      `:yy.
           /moyso+//+ossso:.           .yy`          `dy+:`         ..       :MMMN+---/oys:
         /+m:  `.-:::-`               /d+                                    +MMMMMMMNh:`
        +MN/                        -yh.                                     `+hddhy+.
       /MM+                       .sh:
      :NMo                      -sh/
     -NMs                    `/yy:
    .NMy                  `:sh+.
   `mMm`               ./yds-
  `dMMMmyo:-.````.-:oymNy:`
  +NMMMMMMMMMMMMMMMMms:`
    -+shmNMMMNmdy+:`


                                                                 Now attempting installation...


Looking for a previous installation of SDKMAN...
Looking for unzip...
Looking for zip...
Looking for curl...
Looking for sed...
Installing SDKMAN scripts...
Create distribution directories...
Getting available candidates...
Prime platform file...
Prime the config file...
Installing script cli archive...
* Downloading...
######################################################################## 100.0%
* Checking archive integrity...
* Extracting archive...
* Copying archive contents...
* Cleaning up...

Installing script cli archive...
* Downloading...
######################################################################## 100.0%
* Checking archive integrity...
* Extracting archive...
* Copying archive contents...
* Cleaning up...

Set version to 5.18.2 ...
Set native version to 0.4.6 ...
Attempt update of login bash profile on OSX...
Added sdkman init snippet to /Users/donbuddenbaum/.bash_profile
Attempt update of zsh profile...
Updated existing /Users/donbuddenbaum/.zshrc



All done!


You are subscribed to the STABLE channel.

Please open a new terminal, or run the following in the existing one:

    source "/Users/donbuddenbaum/.sdkman/bin/sdkman-init.sh"

Then issue the following command:

    sdk help

Enjoy!!!
```

### #( 07/10/24@10:29AM )( donbuddenbaum@donbs-imac ):~
   source "/Users/donbuddenbaum/.sdkman/bin/sdkman-init.sh"

### #( 07/10/24@10:29AM )( donbuddenbaum@donbs-imac ):~
   sdk help


```
NAME
    sdk - The command line interface (CLI) for SDKMAN!

SYNOPSIS
    sdk <subcommand> [candidate] [version]

DESCRIPTION
    SDKMAN! is a tool for managing parallel versions of multiple JVM related
    Software Development Kits on most Unix based systems. It provides a
    convenient Command Line Interface (CLI) and API for installing, switching,
    removing and listing Candidates.

SUBCOMMANDS & QUALIFIERS
    help         [subcommand]
    install      <candidate> [version] [path]
    uninstall    <candidate> <version>
    list         [candidate]
    use          <candidate> <version>
    config       no qualifier
    default      <candidate> [version]
    home         <candidate> <version>
    env          [init|install|clear]
    current      [candidate]
    upgrade      [candidate]
    version      no qualifier
    offline      [enable|disable]
    selfupdate   [force]
    update       no qualifier
    flush        [tmp|metadata|version]

EXAMPLES
    sdk install java 17.0.0-tem
    sdk help install

```

