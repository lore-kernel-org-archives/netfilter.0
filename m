From: Mahmood Naderan <nt_mahmood@yahoo.com>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 03:50:31 -0700 (PDT)
Message-ID: <993639.25943.qm@web111704.mail.gq1.yahoo.com>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr>
Reply-To: Mahmood Naderan <nt_mahmood@yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yahoo.com; s=s1024; t=1304074231; bh=BIa+th/lw3p+UCGtSqDw+76PPR2EBcAX1A4TKP/BcM8=; h=Message-ID:X-YMail-OSG:Received:X-Mailer:References:Date:From:Reply-To:Subject:To:Cc:In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding; b=sqtZac2jdXLnWCdPFRf8NvCyNssiMFn5JFITgjGkwyIo7l4UeJyyUnS+vY8enZLFJ+oGNBY1WVI4VIVxudE86Cdol+Fjsj7bjGtqsGYK+u3r/uQWofALMr/6wwm2bOvE4oas8XH/OBWezLfS2nyEQfsdE/ikwm84U+uKUZ6CauQ=
In-Reply-To: <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Thanks for your quick reply. Since the client has invalid IP, it can no=
t access to the internet.
So from the server I "chroot" the folder where the image exists and ins=
talled iptables.
=A0
root@server:/# apt-get install iptables
Reading package lists... Done
Building dependency tree
Reading state information... Done
The following NEW packages will be installed:
=A0 iptables
0 upgraded, 1 newly installed, 0 to remove and 54 not upgraded.
Need to get 460kB of archives.
After this operation, 1819kB of additional disk space will be used.
Get:1 http://us.archive.ubuntu.com/ubuntu/ lucid/main iptables 1.4.4-2u=
buntu2 [460kB]
=46etched 460kB in 22s (20.2kB/s)
perl: warning: Setting locale failed.
perl: warning: Please check that your locale settings:
=A0=A0=A0=A0=A0=A0=A0 LANGUAGE =3D (unset),
=A0=A0=A0=A0=A0=A0=A0 LC_ALL =3D (unset),
=A0=A0=A0=A0=A0=A0=A0 LANG =3D "en_US.UTF-8"
=A0=A0=A0 are supported and installed on your system.
perl: warning: Falling back to the standard locale ("C").
locale: Cannot set LC_CTYPE to default locale: No such file or director=
y
locale: Cannot set LC_MESSAGES to default locale: No such file or direc=
tory
locale: Cannot set LC_ALL to default locale: No such file or directory
Can not write log, openpty() failed (/dev/pts not mounted?)
Selecting previously deselected package iptables.
(Reading database ... 12121 files and directories currently installed.)
Unpacking iptables (from .../iptables_1.4.4-2ubuntu2_amd64.deb) ...
Can not write log, openpty() failed (/dev/pts not mounted?)
Setting up iptables (1.4.4-2ubuntu2) ...
Processing triggers for libc-bin ...
ldconfig deferred processing now taking place

Is there any problem with that?

// Naderan *Mahmood;


----- Original Message -----
=46rom: Jan Engelhardt <jengelh@medozas.de>
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>
Sent: Friday, April 29, 2011 3:17 PM
Subject: Re: can't initialize iptables table `filter'

On Friday 2011-04-29 12:45, Mahmood Naderan wrote:

>Hi,
>I have setup a diskless cluster where there is a head node (server) an=
d a computing node (client).=20
>While settingup, I installed an image of linux using debootstrap. Ther=
e is no problem with that and=20
>the node can boot and I can login to that.
>=A0
>The problem is when I want to open a port in the client using iptables=
, I get some errors and have no
>idea about them.
>=A0
>root@client:/home/mahmood# iptables -A INPUT -p tcp -d 0/0 -s 0/0 --dp=
ort 4949=A0 -j ACCEPT
>
>FATAL: Could not load /lib/modules/2.6.32-24-server/modules.dep: No su=
ch file or directory
>iptables v1.4.4: can't initialize iptables table `filter': iptables wh=
o? (do you need to insmod?)
>Perhaps iptables or your kernel needs to be upgraded.
>
>Any suggestion is welcomed.

Make sure you kernel is configured with these enabled, and don't forget=
=20
to actually provide the modules, if not already built-in, because it=20
does have the looks of a crippled installation, judging from the missin=
g=20
modules.dep.

