From: Youseok Yang <ileixe@gmail.com>
Subject: Re: Does anybody experience kernel crush when 'ebtable -t nat -L'
Date: Thu, 13 Feb 2020 17:25:20 +0900
Message-ID: <CAFAx9abEdG6j2eGMX9VxYJGdqXnHhCcBvD4uH3FRjEbRxMqomA@mail.gmail.com>
References: <CAFAx9aaiv4dK6Om0kkaGfzxiOY9CDGbzXtube5LLVBiA3pbMxw@mail.gmail.com>
 <alpine.DEB.2.20.2002111201530.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9aZd6vA0Se_6eEsRCr4AkRgGj3Eb=7SDXrRZPSpxMCN2vg@mail.gmail.com>
 <alpine.DEB.2.20.2002111243370.6759@tornado.local.jubileegroup.co.uk>
 <CAFAx9abww8D7y59DU+JrHjswGGMVW1cUEVLgPPu2-gN8M_2Tjw@mail.gmail.com>
 <alpine.DEB.2.20.2002111414330.6759@tornado.local.jubileegroup.co.uk> <CAFAx9aZ7awXivUDp9-czFkKNA=p0HMKAPOmV5Dt8izzncmrK2g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=tCoLh96rEJK9SHGCoyDOXk9ec+f047cWEfTQGmFRe3M=;
        b=DcTgHizWBaBYDKixu/Mx050lA9yS1IHjzr3nn1EhDv0aE/EYV1ffApbRYXA6/c5atP
         2W5VEnFVBw96K/IReaR6TnMTeafYaU42YeffGtG51HDbn4x92POpTz04xTDpSG98TfYl
         iu2j+tZH9DTpxihjBYhH+B/aNMUtOka8c2r0neGRANic/4+C/NOow4fd6xeFzThKKORX
         /delTLgm5ntElWH2lY8OAUJ0EuVXk2Tftbws8B1RPLBRUGdUrWS5tD8F6i8Sp5LEBkAb
         niu1kwMnBy8yqmwt9jmUz4nbbL6HLKl3aPL0nZCdHOETWdcos6INYPLlwcNGWWu8tVlE
         DMlA==
In-Reply-To: <CAFAx9aZ7awXivUDp9-czFkKNA=p0HMKAPOmV5Dt8izzncmrK2g@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "G.W. Haywood" <ged@jubileegroup.co.uk>
Cc: netfilter@vger.kernel.org

We got strace log

root@krane-ay1prod-com0280:~# strace -fv ebtables -t nat --concurrent -L
execve("/sbin/ebtables", ["ebtables", "-t", "nat", "--concurrent",
"-L"], ["PYENV_ROOT=3D/opt/pyenv", "SHELL=3D/bin/bash",
"TERM=3Dxterm-256color", "HISTSIZE=3D1000", "SSH_TTY=3D/dev/pts/11",
"LC_ALL=3Den_US.UTF-8", "USER=3Droot",
"LS_COLORS=3Drs=3D0:di=3D01;34:ln=3D01;36"..., "SUDO_USER=3Ddeploy",
"SUDO_UID=3D1000", "TMOUT=3D7200", "USERNAME=3Droot",
"LIBVIRT_DEFAULT_URI=3Dqemu:///syst"..., "SSH_CLI=3D10.60.39.222",
"MAIL=3D/var/mail/root", "PATH=3D/opt/pyenv/shims:/opt/pyenv"...,
"PWD=3D/root", "LANG=3Den_US.UTF-8", "PYENV_SHELL=3Dbash", "SHLVL=3D1",
"SUDO_COMMAND=3D/bin/bash", "HOME=3D/root",
"ADDITIONAL_NO_PROXY=3D.krane.iwila"..., "LANGUAGE=3Den_US:",
"LC_TERMINAL_VERSION=3D3.3.7", "LOGNAME=3Droot", "LC_CTYPE=3DUTF-8",
"LESSOPEN=3D| /usr/bin/lesspipe %s", "PROMPT_COMMAND=3DEXIT_CODE=3D$? &&
d"..., "SUDO_GID=3D1000", "LC_TERMINAL=3DiTerm2",
"LESSCLOSE=3D/usr/bin/lesspipe %s %"..., "HISTTIMEFORMAT=3D%F %T ",
"SSH_ID=3DRSA-SHA256:Ap2X89VM+tClGr"..., "_=3D/usr/bin/strace"]) =3D 0
brk(NULL)                               =3D 0x1f98000
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
access("/etc/ld.so.preload", R_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/ebtables/tls/x86_64/libebt_802_3.so", O_RDONLY|O_CLOEXEC) =3D
-1 ENOENT (No such file or directory)
stat("/lib/ebtables/tls/x86_64", 0x7ffe0d016c20) =3D -1 ENOENT (No such
file or directory)
open("/lib/ebtables/tls/libebt_802_3.so", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
stat("/lib/ebtables/tls", 0x7ffe0d016c20) =3D -1 ENOENT (No such file or
directory)
open("/lib/ebtables/x86_64/libebt_802_3.so", O_RDONLY|O_CLOEXEC) =3D -1
ENOENT (No such file or directory)
stat("/lib/ebtables/x86_64", 0x7ffe0d016c20) =3D -1 ENOENT (No such file
or directory)
open("/lib/ebtables/libebt_802_3.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0@\7\0\0\0\0\0\0"...,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819095,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10032, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fcc000
mmap(NULL, 2105664, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff859ba5000
mprotect(0x7ff859ba6000, 2097152, PROT_NONE) =3D 0
mmap(0x7ff859da6000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff859da6000
close(3)                                =3D 0
open("/lib/ebtables/libebt_nat.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\t\0\0\0\0\0\0"..=
.,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819085,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10456, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2106024, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff8599a2000
mprotect(0x7ff8599a4000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff859ba3000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff859ba3000
close(3)                                =3D 0
open("/lib/ebtables/libebt_arp.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\f\0\0\0\0\0\0"..=
.,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819109,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D32, st_size=3D14496, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2110048, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85979e000
mprotect(0x7ff8597a0000, 2097152, PROT_NONE) =3D 0
mmap(0x7ff8599a0000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7ff8599a0000
close(3)                                =3D 0
open("/lib/ebtables/libebt_arpreply.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\10\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819097,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10136, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fcb000
mmap(NULL, 2105704, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85959b000
mprotect(0x7ff85959d000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85979c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff85979c000
close(3)                                =3D 0
open("/lib/ebtables/libebt_ip.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300\n\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819079,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10384, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2106016, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff859398000
mprotect(0x7ff85939a000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff859599000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff859599000
close(3)                                =3D 0
open("/lib/ebtables/libebt_ip6.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\300\16\0\0\0\0\0\0"=
...,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819103,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D40, st_size=3D18304, st_atime=3D2020/02/13-14:54:35.335391990,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2113856, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff859193000
mprotect(0x7ff859196000, 2097152, PROT_NONE) =3D 0
mmap(0x7ff859396000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x3000) =3D 0x7ff859396000
close(3)                                =3D 0
open("/lib/ebtables/libebt_standard.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\240\5\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819073,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5808, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fca000
mmap(NULL, 2101472, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858f91000
mprotect(0x7ff858f92000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff859191000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff859191000
close(3)                                =3D 0
open("/lib/ebtables/libebt_log.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\t\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819087,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10272, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2105824, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858d8e000
mprotect(0x7ff858d90000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff858f8f000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff858f8f000
close(3)                                =3D 0
open("/lib/ebtables/libebt_redirect.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\20\7\0\0\0\0\0\0"..=
.,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819071,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5904, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2101536, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858b8c000
mprotect(0x7ff858b8d000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff858d8c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff858d8c000
close(3)                                =3D 0
open("/lib/ebtables/libebt_vlan.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0000\10\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819107,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10168, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fc9000
mmap(NULL, 2105736, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858989000
mprotect(0x7ff85898b000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff858b8a000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff858b8a000
close(3)                                =3D 0
open("/lib/ebtables/libebt_mark_m.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
\7\0\0\0\0\0\0"..., 832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819099,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5904, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2101536, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858787000
mprotect(0x7ff858788000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff858987000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff858987000
close(3)                                =3D 0
open("/lib/ebtables/libebt_mark.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\7\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819111,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10232, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2105800, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858584000
mprotect(0x7ff858586000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff858785000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff858785000
close(3)                                =3D 0
open("/lib/ebtables/libebt_pkttype.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0p\10\0\0\0\0\0\0"...=
,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819093,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10064, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fc8000
mmap(NULL, 2105696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff858381000
mprotect(0x7ff858382000, 2097152, PROT_NONE) =3D 0
mmap(0x7ff858582000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff858582000
close(3)                                =3D 0
open("/lib/ebtables/libebt_stp.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\n\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819113,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D32, st_size=3D14512, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2110144, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85817d000
mprotect(0x7ff858180000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85837f000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7ff85837f000
close(3)                                =3D 0
open("/lib/ebtables/libebt_among.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\320\v\0\0\0\0\0\0".=
..,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819075,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D32, st_size=3D14392, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2109960, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff857f79000
mprotect(0x7ff857f7c000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85817b000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x2000) =3D 0x7ff85817b000
close(3)                                =3D 0
open("/lib/ebtables/libebt_limit.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\200\10\0\0\0\0\0\0"=
...,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819105,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10144, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fc7000
mmap(NULL, 2105696, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff857d76000
mprotect(0x7ff857d78000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff857f77000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff857f77000
close(3)                                =3D 0
open("/lib/ebtables/libebt_ulog.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\10\0\0\0\0\0\0"...=
,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819083,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10160, st_atime=3D2020/02/13-14:54:35.339392028,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2105792, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff857b73000
mprotect(0x7ff857b75000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff857d74000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff857d74000
close(3)                                =3D 0
open("/lib/ebtables/libebt_nflog.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0`\10\0\0\0\0\0\0"...=
,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819081,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D24, st_size=3D10160, st_atime=3D2020/02/13-14:54:35.343392065,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2105792, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff857970000
mprotect(0x7ff857972000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff857b71000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1000) =3D 0x7ff857b71000
close(3)                                =3D 0
open("/lib/ebtables/libebtable_filter.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\5\0\0\0\0\0\0"...=
,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819091,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5672, st_atime=3D2020/02/13-14:54:35.343392065,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fc6000
mmap(NULL, 2101368, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85776e000
mprotect(0x7ff85776f000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85796e000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff85796e000
close(3)                                =3D 0
open("/lib/ebtables/libebtable_nat.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0\0\5\0\0\0\0\0\0"...=
,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819101,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5672, st_atime=3D2020/02/13-14:54:35.343392065,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2101368, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85756c000
mprotect(0x7ff85756d000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85776c000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff85776c000
close(3)                                =3D 0
open("/lib/ebtables/libebtable_broute.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\4\0\0\0\0\0\0"...,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819077,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D16, st_size=3D5672, st_atime=3D2020/02/13-14:54:35.343392065,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 2101368, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff85736a000
mprotect(0x7ff85736b000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff85756a000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0) =3D 0x7ff85756a000
close(3)                                =3D 0
open("/lib/ebtables/libebtc.so", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\0\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0
0\0\0\0\0\0\0"..., 832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87819089,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D136, st_size=3D69536, st_atime=3D2020/02/13-14:54:35.343392065,
st_mtime=3D2018/06/29-03:17:40, st_ctime=3D2019/10/11-17:14:44.944338761})
=3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fc5000
mmap(NULL, 2173680, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff857157000
mprotect(0x7ff857167000, 2093056, PROT_NONE) =3D 0
mmap(0x7ff857366000, 8192, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0xf000) =3D 0x7ff857366000
mmap(0x7ff857368000, 6896, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7ff857368000
close(3)                                =3D 0
open("/lib/ebtables/libc.so.6", O_RDONLY|O_CLOEXEC) =3D -1 ENOENT (No
such file or directory)
open("/etc/ld.so.cache", O_RDONLY|O_CLOEXEC) =3D 3
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D18352138,
st_mode=3DS_IFREG|0644, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D88, st_size=3D42101, st_atime=3D2020/02/13-14:39:47.058940019,
st_mtime=3D2020/02/13-14:39:47.054939981,
st_ctime=3D2020/02/13-14:39:47.054939981}) =3D 0
mmap(NULL, 42101, PROT_READ, MAP_PRIVATE, 3, 0) =3D 0x7ff859fba000
close(3)                                =3D 0
access("/etc/ld.so.nohwcap", F_OK)      =3D -1 ENOENT (No such file or dire=
ctory)
open("/lib/x86_64-linux-gnu/libc.so.6", O_RDONLY|O_CLOEXEC) =3D 3
read(3, "\177ELF\2\1\1\3\0\0\0\0\0\0\0\0\3\0>\0\1\0\0\0P\t\2\0\0\0\0\0"...,
832) =3D 832
fstat(3, {st_dev=3Dmakedev(259, 4), st_ino=3D87818433,
st_mode=3DS_IFREG|0755, st_nlink=3D1, st_uid=3D0, st_gid=3D0, st_blksize=3D=
4096,
st_blocks=3D3656, st_size=3D1868984,
st_atime=3D2020/02/12-15:53:36.963494808, st_mtime=3D2019/02/06-05:11:22,
st_ctime=3D2019/10/10-15:50:21.797152380}) =3D 0
mmap(NULL, 3971488, PROT_READ|PROT_EXEC, MAP_PRIVATE|MAP_DENYWRITE, 3,
0) =3D 0x7ff856d8d000
mprotect(0x7ff856f4d000, 2097152, PROT_NONE) =3D 0
mmap(0x7ff85714d000, 24576, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_DENYWRITE, 3, 0x1c0000) =3D 0x7ff85714d000
mmap(0x7ff857153000, 14752, PROT_READ|PROT_WRITE,
MAP_PRIVATE|MAP_FIXED|MAP_ANONYMOUS, -1, 0) =3D 0x7ff857153000
close(3)                                =3D 0
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fb9000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fb8000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fb7000
mmap(NULL, 4096, PROT_READ|PROT_WRITE, MAP_PRIVATE|MAP_ANONYMOUS, -1,
0) =3D 0x7ff859fb6000
arch_prctl(ARCH_SET_FS, 0x7ff859fb7700) =3D 0
mprotect(0x7ff85714d000, 16384, PROT_READ) =3D 0
mprotect(0x7ff857366000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85756a000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85776c000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85796e000, 4096, PROT_READ) =3D 0
mprotect(0x7ff857b71000, 4096, PROT_READ) =3D 0
mprotect(0x7ff857d74000, 4096, PROT_READ) =3D 0
mprotect(0x7ff857f77000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85817b000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85837f000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858582000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858785000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858987000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858b8a000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858d8c000, 4096, PROT_READ) =3D 0
mprotect(0x7ff858f8f000, 4096, PROT_READ) =3D 0
mprotect(0x7ff859191000, 4096, PROT_READ) =3D 0
mprotect(0x7ff859396000, 4096, PROT_READ) =3D 0
mprotect(0x7ff859599000, 4096, PROT_READ) =3D 0
mprotect(0x7ff85979c000, 4096, PROT_READ) =3D 0
mprotect(0x7ff8599a0000, 4096, PROT_READ) =3D 0
mprotect(0x7ff859ba3000, 4096, PROT_READ) =3D 0
mprotect(0x7ff859da6000, 4096, PROT_READ) =3D 0
mprotect(0x600000, 4096, PROT_READ)     =3D 0
mprotect(0x7ff859fcd000, 4096, PROT_READ) =3D 0
munmap(0x7ff859fba000, 42101)           =3D 0
brk(NULL)                               =3D 0x1f98000
brk(0x1fb9000)                          =3D 0x1fb9000
rt_sigaction(SIGINT, {0x7ff85715f8d0, [INT], SA_RESTORER|SA_RESTART,
0x7ff856dc24b0}, {SIG_DFL, [], 0}, 8) =3D 0
rt_sigaction(SIGTERM, {0x7ff85715f8d0, [TERM], SA_RESTORER|SA_RESTART,
0x7ff856dc24b0}, {SIG_DFL, [], 0}, 8) =3D 0
open("/run/ebtables.lock", O_WRONLY|O_CREAT, 0600) =3D 3
fcntl(3, F_SETLK, {l_type=3DF_WRLCK, l_whence=3DSEEK_SET, l_start=3D0, l_le=
n=3D0}) =3D 0
socket(PF_INET, SOCK_RAW, IPPROTO_IGMP) =3D 4
getsockopt(4, SOL_IP, EBT_SO_GET_INFO, packet_write_wait: Connection
to 10.91.13.28 port 22: Broken pipe



And bug found which likely to affect this case. (ebtables: fix race
condition in frame_filter_net_init():
https://lore.kernel.org/patchwork/patch/834743/). I checked our kernel
(4.13.0-41-generic) is running without the patch and I suspect the bug
makes kernel crush.

But I cannot replay the bug with some script (while test 1; do rmmod
ebtable_nat; rmmod ebtable_filter; ebtables -t nat -L; done)

Does anybody let me know how to reproduce the bug?

2020=EB=85=84 2=EC=9B=94 12=EC=9D=BC (=EC=88=98) =EC=98=A4=EC=A0=84 11:37, =
=EC=96=91=EC=9C=A0=EC=84=9D <ileixe@gmail.com>=EB=8B=98=EC=9D=B4 =EC=9E=91=
=EC=84=B1:
>
> I wish I can check rsyslog first. It do have the last command (etables
> --concurrent -t nat -L). But unfortunately, there is no more command.
> I will try to use netconsole which seems to log for kernel.
>
> 2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 11:15=
, G.W. Haywood <ged@jubileegroup.co.uk>=EB=8B=98=EC=9D=B4 =EC=9E=91=EC=84=
=B1:
> >
> > Hi there,
> >
> > On Tue, 11 Feb 2020, =EC=96=91=EC=9C=A0=EC=84=9D wrote:
> >
> > > 2020=EB=85=84 2=EC=9B=94 11=EC=9D=BC (=ED=99=94) =EC=98=A4=ED=9B=84 9=
:47, G.W. Haywood ...
> > >> ... Mr. Millar's suggestion is good too.
> > >
> > > ... where is Mr.Millar's suggestion? ...
> >
> > https://marc.info/?l=3Dnetfilter&m=3D158142378531784&w=3D2
> >
> > --
> >
> > 73,
> > Ged.
