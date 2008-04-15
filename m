From: =?ISO-8859-1?Q?F=E1bio_Souto?= <fsouto@lasige.di.fc.ul.pt>
Subject: Netfilter and IPSec
Date: Tue, 15 Apr 2008 04:41:01 +0100
Message-ID: <480423CD.3060707@lasige.di.fc.ul.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

=46irst place, let me congratulate all of this community, whose=20
contribution is of utmost importance.
Hopefully, I will integrate it with pride.

So, what brings me here...

I'm trying to find out some alternatives for a task I have been assigne=
d.
Basically, I want to sign IPSec packets on another machine. The idea is=
=20
when I receive an IPSec packet, I delegate the cryptographic signature=20
generation to another machine, and I receive the signed packet.
I'm currently studying several alternatives for doing this, and even=20
tried a socket-based approach, by changing some kernel modules, which=20
has failed. It would require a huge remake of kernel code; this task is=
=20
made even harder due to lack of documentation.

So I was wondering if anyone knew if with netfilter is possible to=20
achieve this. Any other suggestions/hints would be extremely valued.

Thanks in advance!

--=20
-----------------------------------------------------------------------=
-------------------
=46=E1bio Souto
LaSIGE , Navigators Group
Departamento de Inform=E1tica, FC/UL
Block C6, room 6.3.32, Campo Grande
1749-016 Lisboa, Portugal

