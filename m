From: "Hildebrand, Brian" <BrianHildebrand@universalcomputersys.com>
Subject: RE: log interpreter , for report ...
Date: Tue, 13 Jan 2004 08:19:23 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <D8FBABA1EF6F2E4DBCC88903F60691F302856926@houxchsvr.ucscorp.ucs.pvt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Answer to 1:

IN and OUT  are the in and out physical interfaces
SRC and DST are source and destination IP (obviously)
SPT is source port
DPT is destination port (you have an RPC port mapper request there (port =
135))

The rest you can pretty safely ignore except for the flags. I've never =
needed to use any of them except for TTL on occasion.


-----Original Message-----
From: Rakotomandimby Mihamina [mailto:mrakotom@free.fr]
Sent: Tuesday, January 13, 2004 7:58
To: netfilter@lists.netfilter.org
Subject: log interpreter , for report ...=20


Hi again ,

1=B0) This is a line of iptables log
IN=3Dppp0 OUT=3D MAC=3D SRC=3D80.14.205.152 DST=3D80.15.220.67 LEN=3D48 =
TOS=3D0x00 PREC=3D0x00=20
TTL=3D121 ID=3D64444 DF PROTO=3DTCP SPT=3D4717 DPT=3D135 WINDOW=3D16384 =
RES=3D0x00 SYN=20
URGP=3D0

How to see what port have been attempted ?

2=B0) Is  fwlogwatch a tool that will help me to make the logs more =
readable ,=20
or a tool that will tell me that something is attempting to @#$=A3 my =
network ?

What i'm looking for is something like this :
http://www.gege.org/iptables/
but i dont want to install SQL nor Apache /PHP .

Does it exist ?
I just want a kind of report of what has been DROPped but in a readable=20
format ...=20

Anyway , the logging format can be read , but it needs training , and i =
have=20
no training .
--=20
Rakotomandimby Mihamina Andrianifaharana
Tel : +33 2 38 76 43 65
http://stko.dyndns.info/site_principal/Members/mihamina



----------------------------------------
The information transmitted in this message is intended only for the =
person or entity to whom it is addressed and may contain confidential =
and/or privileged material.  Any review, retransmission, dissemination =
or other use of, or taking of any action in reliance upon this =
information by persons or entities other than the intended recipient is =
prohibited.  If you received this in error, please contact the sender =
and destroy any copies of this document.

