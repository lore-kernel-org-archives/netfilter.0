From: "Brendan Grieve" <brendan_200201@grieve.com.au>
Subject: [Announcement]: IP Traffic Acocunting with NetFilter + ULOG
Date: Sun, 12 May 2002 09:11:58 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <000e01c1f952$03c9b5f0$641410ac@cat>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_000B_01C1F995.11DDB3B0"
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
To: netfilter@lists.samba.org

This is a multi-part message in MIME format.

------=_NextPart_000_000B_01C1F995.11DDB3B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[To Moderator if Any]: My apologies on last emails. They had a typo in =
the return address. Resent with correct address.

Hi All,

I've sat down and written up some Traffic Accounting Software for some =
of my
clients. I felt that it might be of some interest to those on this list.
Here is an exerpt from my README file: -

ulogd_ACCOUNT
--------------------

-------------------------------------------------------------------------=
--
1. What is it?
-------------------------------------------------------------------------=
--

As part of my UAS software suite (Users Arn't Stupid), I have a Traffic
Accounting module for use with Harald Welte's ulog netfilter target.
(http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog). I've been looking for
a decent 2.4 Kernel traffic accounting module for a while and gave up =
and
wrote my own.

This module has one fairly interesting feature. Most networks that I
administrate are generally quite dynamic. That is, all the workstations
on it are assigned their network details and IP Address via DHCP. As =
some
of my clients wished to have accounting down to the workstation detail,
I've made this particular module use a mixture of the IP and MAC. This
means that if a workstation gets a new IP, it will still have traffic
statistics applied correctly to it. If more than one IP has the same =
MAC,
as when they are behind a router, then accounting will still work, but
will only give totals for all addresses. This means I'm trusting the MAC
rather than the IP, and I am using two tables, one to store MAC's and =
one
to store IP's, with a relationship of one MAC to many IP's. NOTE: Both a
MAC and IP_can_ be forged, but this is a topic for another discussion.

A quick description of HOW this module achieves this is as follows: -

1. On each packet, determine if it is 'outgoing' or 'incoming'. (We're
   assuming that this is running on a router which the packets pass
   through). We can then determine whether to use the source IP (on
   outgoing packets) or destination IP (on incoming packets).

2. We then try to work out a MAC address, as follows: -
  a)  We check if we already have a cached entry that links the IP to a
      MAC, if so, we use it.
  b)  Else if traffic is outgoing, then we will also have the source MAC
      address given to us. We cache the MAC and link this IP to it.
  c)  Else If traffic is incoming then we store the traffic in a temp
      variable linked to the IP, and return. A future 'answer' will link
      this, and will also transfer the temp traffic counter to the MAC.

3. A few sanity checks are performed. ie: -
  a)  If traffic is outgoing, check that the currently linked MAC to the
      IP is correct. If not, fix up.

4. Traffic counters for the MAC are updated, and the cache times are
   touched to current time.


Some notes:
  * When a MAC cache expires, it is written to the log file, in the
    format:
           TIMESTAMP MACADDRESS TOTALTRAFFICFROM TOTALTRAFFICTO
  * When a SIGHUP is caught, all MAC stats are written to the log file
    and the tables cleared.
  * All memory allocation is cached so that performance is at optimum.
    Some sort of cleanup of the cached mallocs is probably useful to
    prevent Denial of Service.
  * Written for performance, so not much double-checking is done.
  * It would be fairly simple to write a web front-end that parses
    the file and links MAC to machine names.

-------------------------------------------------------------------------=
--
2. How do I Compile it?
-------------------------------------------------------------------------=
--

I've probably done things the wrong way, but I've copied the needed =
files
from ulogd and included them with this. A future change may to make a
configuration script that determines the directory of a ulogd source and
uses it.

To compile this, it should be as simple as doing the following: -

1. Uncompress archive to some directory.

2. Compile it. Should be as simple as going 'make' in the directory. The
   makefile will install it in /usr/lib/ulogd

3. Edit /etc/ulogd.conf. Theres an example in the example directory to
   get you started, but heres an example of a section: -

      # Where to write the logfile
      dumpfile /var/log/ipacc/ipaccount.log
      # What is the external interface? (IE, gateway Interface)
      extif eth0
      # Enable Plugin
      plugin /usr/lib/ulogd/ulogd_ACCOUNT.so

4. In your forward chain, just jump to ULOG. For example, I have: -
    iptables -A FORWARD -j ULOG --ulog-nlgroup 1 --ulog-cprange 20 \
             --ulog-qthreshold 50

5. Start ulogd.

6. Set up a cronjob to send a HUP to ulogd every day or every hour. That
   way you can have fairly recent statistics.

NOTE: I use a /var/log/ipacc  directory so that the directory can be
given a group write permission. This way a statistics parsing engine
(ie: http://www.worldguard.com.au/projects/ipacc) can read and write
securly to the directory.

-------------------------------------------------------------------------=
--
3. TO DO
-------------------------------------------------------------------------=
--
Probably something, but I'm sure it can wait.


-------------------------------------------------------------------------=
--
4. Contact/Download Details
-------------------------------------------------------------------------=
--
My name is Brendan Grieve. I hope someone finds some use for this =
software
or can modify to their needs.

Official Download Location:
http://www.worldguard.com.au/projects/ulog_account
My Email:  brendan (@) worldguard.com.au.

Stay well. God Bless!

Brendan


------=_NextPart_000_000B_01C1F995.11DDB3B0
Content-Type: text/html;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<HTML><HEAD>
<META http-equiv=3DContent-Type content=3D"text/html; =
charset=3Diso-8859-1">
<META content=3D"MSHTML 6.00.2715.400" name=3DGENERATOR>
<STYLE></STYLE>
</HEAD>
<BODY bgColor=3D#ffffff>
<DIV><FONT face=3DArial size=3D2>[To Moderator if Any]: My apologies on =
last emails.=20
They had a typo in the return address. Resent with correct =
address.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV>
<DIV>Hi All,<BR><BR>I've sat down and written up some Traffic Accounting =

Software for some of my<BR>clients. I felt that it might be of some =
interest to=20
those on this list.<BR>Here is an exerpt from my README file:=20
-<BR><BR>ulogd_ACCOUNT<BR>--------------------<BR><BR>-------------------=
--------------------------------------------------------<BR>1.=20
What is=20
it?<BR>------------------------------------------------------------------=
---------<BR><BR>As=20
part of my UAS software suite (Users Arn't Stupid), I have a=20
Traffic<BR>Accounting module for use with Harald Welte's ulog netfilter=20
target.<BR>(<A=20
href=3D"http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog">http://www.gnumo=
nks.org/cgi-bin/cvsweb.cgi/ulog</A>).=20
I've been looking for<BR>a decent 2.4 Kernel traffic accounting module =
for a=20
while and gave up and<BR>wrote my own.<BR><BR>This module has one fairly =

interesting feature. Most networks that I<BR>administrate are generally =
quite=20
dynamic. That is, all the workstations<BR>on it are assigned their =
network=20
details and IP Address via DHCP. As some<BR>of my clients wished to have =

accounting down to the workstation detail,<BR>I've made this particular =
module=20
use a mixture of the IP and MAC. This<BR>means that if a workstation =
gets a new=20
IP, it will still have traffic<BR>statistics applied correctly to it. If =
more=20
than one IP has the same MAC,<BR>as when they are behind a router, then=20
accounting will still work, but<BR>will only give totals for all =
addresses. This=20
means I'm trusting the MAC<BR>rather than the IP, and I am using two =
tables, one=20
to store MAC's and one<BR>to store IP's, with a relationship of one MAC =
to many=20
IP's. NOTE: Both a<BR>MAC and IP_can_ be forged, but this is a topic for =
another=20
discussion.<BR><BR>A quick description of HOW this module achieves this =
is as=20
follows: -<BR><BR>1. On each packet, determine if it is 'outgoing' or=20
'incoming'. (We're<BR>&nbsp;&nbsp; assuming that this is running on a =
router=20
which the packets pass<BR>&nbsp;&nbsp; through). We can then determine =
whether=20
to use the source IP (on<BR>&nbsp;&nbsp; outgoing packets) or =
destination IP (on=20
incoming packets).<BR><BR>2. We then try to work out a MAC address, as =
follows:=20
-<BR>&nbsp; a)&nbsp; We check if we already have a cached entry that =
links the=20
IP to a<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; MAC, if so, we use =
it.<BR>&nbsp;=20
b)&nbsp; Else if traffic is outgoing, then we will also have the source=20
MAC<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; address given to us. We cache the =
MAC and=20
link this IP to it.<BR>&nbsp; c)&nbsp; Else If traffic is incoming then =
we store=20
the traffic in a temp<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; variable linked =
to the=20
IP, and return. A future 'answer' will =
link<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
this, and will also transfer the temp traffic counter to the =
MAC.<BR><BR>3. A=20
few sanity checks are performed. ie: -<BR>&nbsp; a)&nbsp; If traffic is=20
outgoing, check that the currently linked MAC to=20
the<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; IP is correct. If not, fix =
up.<BR><BR>4.=20
Traffic counters for the MAC are updated, and the cache times=20
are<BR>&nbsp;&nbsp; touched to current time.<BR><BR><BR>Some =
notes:<BR>&nbsp; *=20
When a MAC cache expires, it is written to the log file, in=20
the<BR>&nbsp;&nbsp;&nbsp;=20
format:<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
TIMESTAMP MACADDRESS TOTALTRAFFICFROM TOTALTRAFFICTO<BR>&nbsp; * When a =
SIGHUP=20
is caught, all MAC stats are written to the log =
file<BR>&nbsp;&nbsp;&nbsp; and=20
the tables cleared.<BR>&nbsp; * All memory allocation is cached so that=20
performance is at optimum.<BR>&nbsp;&nbsp;&nbsp; Some sort of cleanup of =
the=20
cached mallocs is probably useful to<BR>&nbsp;&nbsp;&nbsp; prevent =
Denial of=20
Service.<BR>&nbsp; * Written for performance, so not much =
double-checking is=20
done.<BR>&nbsp; * It would be fairly simple to write a web front-end =
that=20
parses<BR>&nbsp;&nbsp;&nbsp; the file and links MAC to machine=20
names.<BR><BR>-----------------------------------------------------------=
----------------<BR>2.=20
How do I Compile=20
it?<BR>------------------------------------------------------------------=
---------<BR><BR>I've=20
probably done things the wrong way, but I've copied the needed =
files<BR>from=20
ulogd and included them with this. A future change may to make=20
a<BR>configuration script that determines the directory of a ulogd =
source=20
and<BR>uses it.<BR><BR>To compile this, it should be as simple as doing =
the=20
following: -<BR><BR>1. Uncompress archive to some directory.<BR><BR>2. =
Compile=20
it. Should be as simple as going 'make' in the directory. =
The<BR>&nbsp;&nbsp;=20
makefile will install it in /usr/lib/ulogd<BR><BR>3. Edit =
/etc/ulogd.conf.=20
Theres an example in the example directory to<BR>&nbsp;&nbsp; get you =
started,=20
but heres an example of a section: =
-<BR><BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; #=20
Where to write the logfile<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; dumpfile=20
/var/log/ipacc/ipaccount.log<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # What is =
the=20
external interface? (IE, gateway =
Interface)<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
extif eth0<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Enable=20
Plugin<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; plugin=20
/usr/lib/ulogd/ulogd_ACCOUNT.so<BR><BR>4. In your forward chain, just =
jump to=20
ULOG. For example, I have: -<BR>&nbsp;&nbsp;&nbsp; iptables -A FORWARD =
-j ULOG=20
--ulog-nlgroup 1 --ulog-cprange 20=20
\<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;=20
--ulog-qthreshold 50<BR><BR>5. Start ulogd.<BR><BR>6. Set up a cronjob =
to send a=20
HUP to ulogd every day or every hour. That<BR>&nbsp;&nbsp; way you can =
have=20
fairly recent statistics.<BR><BR>NOTE: I use a /var/log/ipacc&nbsp; =
directory so=20
that the directory can be<BR>given a group write permission. This way a=20
statistics parsing engine<BR>(ie: <A=20
href=3D"http://www.worldguard.com.au/projects/ipacc">http://www.worldguar=
d.com.au/projects/ipacc</A>)=20
can read and write<BR>securly to the=20
directory.<BR><BR>-------------------------------------------------------=
--------------------<BR>3.=20
TO=20
DO<BR>-------------------------------------------------------------------=
--------<BR>Probably=20
something, but I'm sure it can=20
wait.<BR><BR><BR>--------------------------------------------------------=
-------------------<BR>4.=20
Contact/Download=20
Details<BR>--------------------------------------------------------------=
-------------<BR>My=20
name is Brendan Grieve. I hope someone finds some use for this =
software<BR>or=20
can modify to their needs.<BR><BR>Official Download Location:<BR><A=20
href=3D"http://www.worldguard.com.au/projects/ulog_account">http://www.wo=
rldguard.com.au/projects/ulog_account</A><BR>My=20
Email:&nbsp; brendan (@) worldguard.com.au.<BR><BR>Stay well. God=20
Bless!<BR><BR>Brendan<BR></DIV></BODY></HTML>

------=_NextPart_000_000B_01C1F995.11DDB3B0--


