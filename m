From: "fred" <fred@timogen.com>
Subject: Re: help on VPN Gateway samba browsing
Date: Fri, 19 Apr 2002 15:47:31 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <022a01c1e7f4$317d0d40$7d05a8c0@fred>
References: <016101c1e7c1$3f204b70$7d05a8c0@fred> <003c01c21760$27974700$7c1e0a0a@mpintern>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_0227_01C1E7B9.84560340"
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: robert@ruegner.net
Cc: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_0227_01C1E7B9.84560340
Content-Type: text/plain;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

Hi robert,

Thanks,

I had used dhcp to get the winserver, see below.

I also can see the remote mahine (in another Lan) in my lan,
I can access it in windows by smbclients, but when I access it in =
windows,
I got the error messages:

        The semaphone timeout period has expired.

I donnot know why.


=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=

c>: ipconfig  /all


      Physical Address. . . . . . . . . : 00-E0-18-48-DA-49
      DHCP Enabled. . . . . . . . . . . : Yes
      Autoconfiguration Enabled . . . . : Yes
      IP Address. . . . . . . . . . . . : 192.168.5.125
      Subnet Mask . . . . . . . . . . . : 255.255.255.0
      Default Gateway . . . . . . . . . : 192.168.5.99
      DHCP Server . . . . . . . . . . . : 192.168.5.96
      DNS Servers . . . . . . . . . . . : 192.168.5.99
                                          202.96.209.5
                                          202.96.209.133
      Primary WINS Server . . . . . . . : 192.168.5.96
      Lease Obtained. . . . . . . . . . : 2002=C4=EA6=D4=C218=C8=D5 =
11:20:12
      Lease Expires . . . . . . . . . . : 2002=C4=EA6=D4=C218=C8=D5 =
17:20:12

  ----- Original Message -----=20
  From: robert@ruegner.net=20
  To: fred=20
  Sent: Wednesday, June 19, 2002 12:08 AM
  Subject: Re: help on VPN Gateway samba browsing


  your os level should be over 65 to be wins server this beats
  all other , by wins browsing,
  dont forget only one machine can be winsserver,
  use smbmount !
  read faqs fom samba packet
  regards
    ----- Original Message -----=20
    From: fred=20
    To: netfilter@lists.samba.org=20
    Sent: Friday, April 19, 2002 6:42 PM
    Subject: help on VPN Gateway samba browsing


    Hi,

        Hi, we are use VPN gateway to merge two Lan network to one.=20
        Now any host in one Lan can access the host in another Lan by =
telnet, ftp, http, ping etc.
        we want to let the host(win2k) in one Lan can browsing the hosts =
in another Lan in network neighbour.
        So we want to use samba as the wins for the two Lan.
       =20
        The problems is:
    =20
        I can access the remote host in linux machine by

             mount -t smbfs -o username=3Dtridge,password=3Dfoobar =
//fjall/test /data/test

       and the remote host can be browsing in the local network neighbor =
in win2K, but we can still not access it.
      =20
       the error messages is:

            The semaphone timeout period has expired.

      Could you give me some suggestions?





    =
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DRemote =
configuration of smb=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    [global]
       workgroup =3D WORKGROUP
       wins support =3D yes
       server string =3D Internal Docs, Downloads, and Web Pages
       os level =3D 1
       short preserve case =3D yes
       preserve case =3D yes
       domain logons =3D no
       local master =3D yes
       lock directory =3D /var/lock/samba
       locking =3D yes
       strict locking =3D yes
       share modes =3D yes
       security =3D user
       socket options =3D TCP_NODELAY
       log file =3D /var/log/samba
       ;max log size =3D 5000
       veto files =3D /Network Trash Folder/
       encrypt passwords =3D yes
       dead time =3D 5
       debug level =3D 0
       dns proxy =3D no
       domain master =3D yes
       guest account =3D guest
       local master =3D yes
       preferred master =3D yes
       alternate permissions =3D no
       case sensitive =3D no
       default case =3D upper
       delete readonly =3D yes
       follow symlinks =3D yes
       locking =3D yes
       mangle case =3D no
       map hidden =3D yes
       map system =3D yes
       oplocks =3D yes
       preserve case =3D yes
       short preserve case =3D yes
       strict locking =3D yes
       delete veto files =3D yes
       wide links =3D yes
     hosts allow =3D 192.168.100. 192.168.110. localhost 192.168.5.
     remote announce =3D 192.168.110.1 192.168.5.96
     remote browse sync =3D 192.168.110.1 192.168.5.96

    =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DLocal =
configuration of smb=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D

    [global]
     workgroup =3D WORKGROUP
     netbios name =3D fileserver
     server string =3D SDC Engineering FileServer
     hosts allow =3D 192.168.5. 192.168.100. 127.
     log file =3D /var/log/samba/%m.log
     max log size =3D 3000
     security =3D user
     encrypt passwords =3D yes
     smb passwd file =3D /etc/samba/smbpasswd
     unix password sync =3D Yes
     passwd program =3D /usr/bin/passwd %u
     passwd chat =3D *New*password* %n\n *Retype*new*password* %n\n
    *passwd:*all*authentication*tokens*updated*successfully*
     username map =3D /etc/samba/smbusers
     socket options =3D TCP_NODELAY SO_RCVBUF=3D8192 SO_SNDBUF=3D8192
     remote announce =3D 192.168.100.8
     local master =3D yes
     os level =3D 64
     domain master =3D yes
     preferred master =3D yes
     domain logons =3D yes
     logon script =3D %U.bat
     wins support =3D yes
     dns proxy =3D no


------=_NextPart_000_0227_01C1E7B9.84560340
Content-Type: text/html;
	charset="gb2312"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; charset=3Dgb2312">
<META content=3D"MSHTML 6.00.2600.0" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>Hi robert,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>Thanks,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I had used dhcp to get the winserver, =
see=20
below.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I also can see the remote mahine (in =
another Lan)=20
in my lan,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I can access it in windows by =
smbclients, but when=20
I access it in windows,</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>I got the error messages:</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>
<DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The=20
semaphone timeout period has expired.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>I donnot know why.</FONT></DIV></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial=20
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D</FONT></DIV>
<DIV><FONT face=3DArial size=3D2>c&gt;: ipconfig&nbsp; /all</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Physical =
Address. .=20
. . . . . . . : 00-E0-18-48-DA-49<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DHCP =

Enabled. . . . . . . . . . . : Yes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Autoconfiguration Enabled . . . . : =
Yes<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP=20
Address. . . . . . . . . . . . : =
192.168.5.125<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
Subnet Mask . . . . . . . . . . . :=20
255.255.255.0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Default Gateway . . . . =
. . . .=20
. : 192.168.5.99<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DHCP Server . . . . . =
. . . .=20
. . : 192.168.5.96<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; DNS Servers . . . . =
. . . .=20
. . . :=20
192.168.5.99<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
202.96.209.5<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
202.96.209.133<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Primary WINS Server . . =
. . . .=20
. : 192.168.5.96<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lease Obtained. . . . =
. . . .=20
. . : 2002=C4=EA6=D4=C218=C8=D5 =
11:20:12<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Lease Expires . . .=20
. . . . . . . : 2002=C4=EA6=D4=C218=C8=D5 17:20:12</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<BLOCKQUOTE dir=3Dltr=20
style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
  <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
  <DIV=20
  style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
  <A title=3Drobert@ruegner.net=20
  href=3D"mailto:robert@ruegner.net">robert@ruegner.net</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A title=3Dfred@timogen.com =

  href=3D"mailto:fred@timogen.com">fred</A> </DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Wednesday, June 19, 2002 =
12:08=20
  AM</DIV>
  <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> Re: help on VPN =
Gateway samba=20
  browsing</DIV>
  <DIV><FONT face=3DArial size=3D2></FONT><BR></DIV>
  <DIV><FONT face=3DArial size=3D2>your os level should be over 65 to be =
wins server=20
  this beats</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>all other , by wins =
browsing,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>dont forget only one machine can be=20
  winsserver,</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>use smbmount !</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>read faqs fom samba =
packet</FONT></DIV>
  <DIV><FONT face=3DArial size=3D2>regards</FONT></DIV>
  <BLOCKQUOTE dir=3Dltr=20
  style=3D"PADDING-RIGHT: 0px; PADDING-LEFT: 5px; MARGIN-LEFT: 5px; =
BORDER-LEFT: #000000 2px solid; MARGIN-RIGHT: 0px">
    <DIV style=3D"FONT: 10pt arial">----- Original Message ----- </DIV>
    <DIV=20
    style=3D"BACKGROUND: #e4e4e4; FONT: 10pt arial; font-color: =
black"><B>From:</B>=20
    <A title=3Dfred@timogen.com =
href=3D"mailto:fred@timogen.com">fred</A> </DIV>
    <DIV style=3D"FONT: 10pt arial"><B>To:</B> <A =
title=3Dnetfilter@lists.samba.org=20
    =
href=3D"mailto:netfilter@lists.samba.org">netfilter@lists.samba.org</A> =
</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Sent:</B> Friday, April 19, 2002 =
6:42=20
    PM</DIV>
    <DIV style=3D"FONT: 10pt arial"><B>Subject:</B> help on VPN Gateway =
samba=20
    browsing</DIV>
    <DIV><FONT face=3DArial size=3D2></FONT><BR></DIV>
    <DIV><FONT face=3DArial size=3D2>Hi,</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp;&nbsp; Hi, we are use =
VPN gateway=20
    to merge two Lan network to one.&nbsp;<BR>&nbsp;&nbsp;&nbsp; Now any =
host in=20
    one Lan can access the host in another Lan by telnet, ftp, http, =
ping=20
    etc.<BR>&nbsp;&nbsp;&nbsp; we want to let the host(win2k) in one Lan =
can=20
    browsing the hosts in another Lan in network=20
    neighbour.<BR>&nbsp;&nbsp;&nbsp; So we want to use samba as the wins =
for the=20
    two Lan.<BR>&nbsp;&nbsp;&nbsp; <BR>&nbsp;&nbsp;&nbsp; The problems=20
    is:<BR>&nbsp;<BR>&nbsp;&nbsp;&nbsp; I can access the remote host in =
linux=20
    machine by</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial=20
    size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; mount -t =
smbfs -o=20
    username=3Dtridge,password=3Dfoobar //fjall/test =
/data/test</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp;&nbsp; and the remote host =
can be=20
    browsing in the local network neighbor in win2K, but we can still =
not access=20
    it.<BR>&nbsp;&nbsp; <BR>&nbsp;&nbsp; the error messages =
is:</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial =
size=3D2>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; The=20
    semaphone timeout period has expired.</FONT></DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>&nbsp; Could you give me some=20
    suggestions?</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial =
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DR=
emote configuration of=20
    smb=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>[global]<BR>&nbsp;&nbsp; workgroup =
=3D=20
    WORKGROUP<BR>&nbsp;&nbsp; wins support =3D yes<BR>&nbsp;&nbsp; =
server string =3D=20
    Internal Docs, Downloads, and Web Pages<BR>&nbsp;&nbsp; os level =3D =

    1<BR>&nbsp;&nbsp; short preserve case =3D yes<BR>&nbsp;&nbsp; =
preserve case =3D=20
    yes<BR>&nbsp;&nbsp; domain logons =3D no<BR>&nbsp;&nbsp; local =
master =3D=20
    yes<BR>&nbsp;&nbsp; lock directory =3D =
/var/lock/samba<BR>&nbsp;&nbsp; locking=20
    =3D yes<BR>&nbsp;&nbsp; strict locking =3D yes<BR>&nbsp;&nbsp; share =
modes =3D=20
    yes<BR>&nbsp;&nbsp; security =3D user<BR>&nbsp;&nbsp; socket options =
=3D=20
    TCP_NODELAY<BR>&nbsp;&nbsp; log file =3D =
/var/log/samba<BR>&nbsp;&nbsp; ;max=20
    log size =3D 5000<BR>&nbsp;&nbsp; veto files =3D /Network Trash=20
    Folder/<BR>&nbsp;&nbsp; encrypt passwords =3D yes<BR>&nbsp;&nbsp; =
dead time =3D=20
    5<BR>&nbsp;&nbsp; debug level =3D 0<BR>&nbsp;&nbsp; dns proxy =3D=20
    no<BR>&nbsp;&nbsp; domain master =3D yes<BR>&nbsp;&nbsp; guest =
account =3D=20
    guest<BR>&nbsp;&nbsp; local master =3D yes<BR>&nbsp;&nbsp; preferred =
master =3D=20
    yes<BR>&nbsp;&nbsp; alternate permissions =3D no<BR>&nbsp;&nbsp; =
case=20
    sensitive =3D no<BR>&nbsp;&nbsp; default case =3D =
upper<BR>&nbsp;&nbsp; delete=20
    readonly =3D yes<BR>&nbsp;&nbsp; follow symlinks =3D =
yes<BR>&nbsp;&nbsp; locking=20
    =3D yes<BR>&nbsp;&nbsp; mangle case =3D no<BR>&nbsp;&nbsp; map =
hidden =3D=20
    yes<BR>&nbsp;&nbsp; map system =3D yes<BR>&nbsp;&nbsp; oplocks =3D=20
    yes<BR>&nbsp;&nbsp; preserve case =3D yes<BR>&nbsp;&nbsp; short =
preserve case=20
    =3D yes<BR>&nbsp;&nbsp; strict locking =3D yes<BR>&nbsp;&nbsp; =
delete veto files=20
    =3D yes<BR>&nbsp;&nbsp; wide links =3D yes<BR>&nbsp;hosts allow =3D =
192.168.100.=20
    192.168.110. localhost 192.168.5.<BR>&nbsp;remote announce =3D =
192.168.110.1=20
    192.168.5.96<BR>&nbsp;remote browse sync =3D 192.168.110.1=20
    192.168.5.96</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial =
size=3D2>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3DL=
ocal configuration of=20
    smb=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D</FONT></DIV>
    <DIV>&nbsp;</DIV>
    <DIV><FONT face=3DArial size=3D2>[global]<BR>&nbsp;workgroup =3D=20
    WORKGROUP<BR>&nbsp;netbios name =3D fileserver<BR>&nbsp;server =
string =3D SDC=20
    Engineering FileServer<BR>&nbsp;hosts allow =3D 192.168.5. =
192.168.100.=20
    127.<BR>&nbsp;log file =3D /var/log/samba/%m.log<BR>&nbsp;max log =
size =3D=20
    3000<BR>&nbsp;security =3D user<BR>&nbsp;encrypt passwords =3D =
yes<BR>&nbsp;smb=20
    passwd file =3D /etc/samba/smbpasswd<BR>&nbsp;unix password sync =3D =

    Yes<BR>&nbsp;passwd program =3D /usr/bin/passwd %u<BR>&nbsp;passwd =
chat =3D=20
    *New*password* %n\n *Retype*new*password*=20
    =
%n\n<BR>*passwd:*all*authentication*tokens*updated*successfully*<BR>&nbsp=
;username=20
    map =3D /etc/samba/smbusers<BR>&nbsp;socket options =3D TCP_NODELAY=20
    SO_RCVBUF=3D8192 SO_SNDBUF=3D8192<BR>&nbsp;remote announce =3D=20
    192.168.100.8<BR>&nbsp;local master =3D yes<BR>&nbsp;os level =3D=20
    64<BR>&nbsp;domain master =3D yes<BR>&nbsp;preferred master =3D=20
    yes<BR>&nbsp;domain logons =3D yes<BR>&nbsp;logon script =3D=20
    %U.bat<BR>&nbsp;wins support =3D yes<BR>&nbsp;dns proxy =3D=20
  no<BR></FONT></DIV></BLOCKQUOTE></BLOCKQUOTE></BODY></HTML>

------=_NextPart_000_0227_01C1E7B9.84560340--


