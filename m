From: "Brendan Grieve" <brendan_200201@grieve.com.au>
Subject: [Announcement]: Web Statistics Frontend for ulacc
Date: Sun, 12 May 2002 09:12:50 +0800
Sender: netfilter-admin@lists.samba.org
Message-ID: <001d01c1f952$22a57db0$641410ac@cat>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----=_NextPart_000_001A_01C1F995.30BC88B0"
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

------=_NextPart_000_001A_01C1F995.30BC88B0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

[To Moderator if Any]: My apologies on last emails. They had a typo in =
the return address. Resent with correct address.

Hi All,

I've sat down and written up some Traffic Accounting Software for some =
of my
clients. This part of it is the Web Front End that they see. I thought =
this
would be
of interest to some of you.

If you prefer to see a working (sane chrooted) example, click through =
to:
http://www.worldguard.com.au/cgi-bin/ipacc

Here is an except from my README file: -

ipacc
-----

-------------------------------------------------------------------------=
--
1. What is it?
-------------------------------------------------------------------------=
--

This piece of software has been designed to run with my Traffic Account
Module written for ULOGd. Therefore I shall start off by giving a quote
from its documentation: -

  As part of my UAS software suite (Users Aren't Stupid), I have a =
Traffic
  Accounting module for use with Harald Welte's ulog netfilter target.
  (http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog). I've been looking =
for
  a decent 2.4 Kernel traffic accounting module for a while and gave up =
and
  wrote my own.

  This module has one fairly interesting feature. Most networks that I
  administrate are generally quite dynamic. That is, all the =
workstations
  on it are assigned their network details and IP Address via DHCP. As =
some
  of my clients wished to have accounting down to the workstation =
detail,
  I've made this particular module use a mixture of the IP and MAC. This
  means that if a workstation gets a new IP, it will still have traffic
  statistics applied correctly to it. If more than one IP has the same =
MAC,
  as when they are behind a router, then accounting will still work, but
  will only give totals for all addresses. This means I'm trusting the =
MAC
  rather than the IP, and I am using two tables, one to store MAC's and =
one
  to store IP's, with a relationship of one MAC to many IP's. NOTE: Both =
a
  MAC and IP_can_ be forged, but this is a topic for another discussion.

------8< Snip of Documentation on how it does this ---- 8< -----------

    * It would be fairly simple to write a web front-end that parses
      the file and links MAC to machine names.

ipacc is essentially the 'web front-end' that parses in the logfile and
gives a user friendly report. There's not terribly much more to comment
on it, apart from the fact that its taken hours of work and I'm very
pleased to FINALLY finish it.


-------------------------------------------------------------------------=
--
2. How do I Compile it?
-------------------------------------------------------------------------=
--

Hopefully this is fairly simple. I'll just give some step-by-step
instructions: -

1. Uncompressed archive to some directory.

2. Copy examples/ipacc.conf to /etc, and modify it.

3. Ensure ipaccount.log exists. Touch it if not. Did I mention that you
   should also have already set up my ulogd_ACCOUNT module?

4. Create a new group 'ipacc' and add the user the webserver runs under
   to it. On my system I added the following entry to my /etc/group
        ipacc:x:22:httpd

5. Set relevant modes on the config file and logfile dir. On mine I =
went: -
        chown root.root /etc/ipacc.conf && chmod u=3Drw,g=3Dr,o=3Dr
/etc/ipacc.conf
        chown root.ipacc /var/log/ipacc && chmod u=3Drwx,g=3Drx,o=3D
/var/log/ipacc
        chown root.root /var/log/ipacc/* && chmod 644 /var/log/ipacc/*

6. Compile it. Should be as simple as going 'make' in the directory.

7. Copy the binary 'ipacc' to your cgi-bin directory. On my system it
   was /usr/shared/httpd/cgi-bin, and make sure the webserver has perms
   to run it. ie: -
        install -o root -g ipacc -m 750 ipacc /usr/shared/httpd/cgi-bin

8. Copy the icons directory to your webserver icons directory, or set up
your
   web server such that http://localhost/icons/ipacc/blah.jpg will read
   the picture. Make sure permissions are correctly set.

Done!

-------------------------------------------------------------------------=
--
3. ipacc.conf
-------------------------------------------------------------------------=
--

The config file is fairly simple (I hope). It is based around having =
groups
of options. For instance, if a company has 20 computers, and those 20
computers belong to 3 departments, it would make sense to create three
groups, and stick the relevant computers into their relevant group. That
way each department can pay for their internet usage.

There is also one 'special' group called 'GLOBAL'. This simply holds a =
few
global variables for use in configuring the software. It can also hold
'default' values for some variables.

A typical options file will look like: -

    group GLOBAL {
        # Comment - Global Options set here
    }

    group R&D {
        # Custom group called R&D
        host 00:43:21:59:22:0d "Hawk Eye"
        host 00:43:21:59:0d:16 "Eagle Eye"
    }

    group OTHER {
        # I like to put unknowns in their own group
        accept_unknown 1
    }

A list of all the current variables are as follows. A [G] means it can =
be
set in the GLOBAL group. A [C] means it can be set in a custom group.

accept_unknown [C]
Someone brings in their notebook from home and plugs in. They will
register as an unknown MAC address. Who should account for this
traffic? This option sets a group to 'accept' unknown MAC address
traffic.
Values can be 0 or 1

cost_per_meg [C][G]
When enabling cost estimation, this option specifies how much each
meg over and beyond 'initial_traffic' costs.
Value is a float/real.

cosT_per_month [C][G]
When enabling cost estimation, this option specifies how much per
month you have to pay minimum.
Value is a float/real

estimate_cost [G]
Use this option to enable cost estimation. The software will try to
work out how much you are paying for bandwith. It uses the highest
of upload or download.
Value can be 0 or 1

host [C]
This gives a MAC address a name. Whenever the MAC address is seen in
the logs, it will now be assigned to this group, and given a more
friendly name.
Value is of the form:     MACADDRESS FRIENDLYNAME

ipaccountlog [G]
Where can the ipaccount log be found.
Value is a string

initial_traffic [C][G]
When cost estimation is enabled, what initial traffic do you get
before you have to start paying per megabyte.

keepstats_days [G]
NOT USED YET - This field will specify how long to keep statistics in
the 'watermark' files. This way you can rotate and delete the larger
uLOG file without losing history.

keepstats_size [G]
NOT USED YET - This field will specify the maxium size the 'watermark'
file can be. This was you can rotate and delete the larger ULOG file
without losing history.

percent_total [G]
When enabled, certain columns will appear on some reports showing the
percentage bandwith used of the TOTAL bandwith for that month by
a group(s)/computer. This way, if it says 'R&D' is using 35% of the
bandwith, they can pay for 35% of the total cost. Use this rather than
relying on Cost Estimation to be totally accurate.


-------------------------------------------------------------------------=
--
4. What is 'Automatic'
-------------------------------------------------------------------------=
--
Before I forget I'll just explain Automatic (Found on the report).
I've actually written an IP account report before for clients of mine.
It was based on ipchains and used the 'counter' for a chain. It was a =
huge
big ugly hack but it worked, and I loathed every character of it.

When I updated to my much nicer cleaner interface, I found that my new
interface just didn't feel as inuitive. Sometimes I want to sort by
Computer, and sometime by date. So I created an 'Automatic' sort that
emulates my old interface's method of sorting. It uses the following =
rules:

 - No Month or Group Selected
    - Show by Date
 - A month selected, but no Group/Computer
    - Show by Group (for that month)
 - No month selected, but a group/computer selected
    - Show by date (for that group/computer)
 - Both a month and group selected
    - Show by Group (A list of Computers in the group, for that Month)

This was a nice clean hack :-)

-------------------------------------------------------------------------=
--
5. TO DO
-------------------------------------------------------------------------=
--
Not much really. I would like to implement a 'watermark' file that =
stores
the 'parsed' ULOG file. This way the Ulog file can be safely deleted, =
and
a date/size can be set on how long to keep old history.


-------------------------------------------------------------------------=
--
6. Contact/Download Details
-------------------------------------------------------------------------=
--
My name is Brendan Grieve. I hope someone finds some use for this =
software
or can modify to their needs.

Official Download Location: http://www.worldguard.com.au/projects/ipacc
My Email:  brendan (@) worldguard.com.au

Stay well. God Bless!




------=_NextPart_000_001A_01C1F995.30BC88B0
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
<DIV>
<DIV><FONT face=3DArial size=3D2>[To Moderator if Any]: My apologies on =
last emails.=20
They had a typo in the return address. Resent with correct =
address.</FONT></DIV>
<DIV><FONT face=3DArial size=3D2></FONT>&nbsp;</DIV></DIV>
<DIV>Hi All,<BR><BR>I've sat down and written up some Traffic Accounting =

Software for some of my<BR>clients. This part of it is the Web Front End =
that=20
they see. I thought this<BR>would be<BR>of interest to some of =
you.<BR><BR>If=20
you prefer to see a working (sane chrooted) example, click through =
to:<BR><A=20
href=3D"http://www.worldguard.com.au/cgi-bin/ipacc">http://www.worldguard=
.com.au/cgi-bin/ipacc</A><BR><BR>Here=20
is an except from my README file:=20
-<BR><BR>ipacc<BR>-----<BR><BR>------------------------------------------=
---------------------------------<BR>1.=20
What is=20
it?<BR>------------------------------------------------------------------=
---------<BR><BR>This=20
piece of software has been designed to run with my Traffic =
Account<BR>Module=20
written for ULOGd. Therefore I shall start off by giving a quote<BR>from =
its=20
documentation: -<BR><BR>&nbsp; As part of my UAS software suite (Users =
Aren't=20
Stupid), I have a Traffic<BR>&nbsp; Accounting module for use with =
Harald=20
Welte's ulog netfilter target.<BR>&nbsp; (<A=20
href=3D"http://www.gnumonks.org/cgi-bin/cvsweb.cgi/ulog">http://www.gnumo=
nks.org/cgi-bin/cvsweb.cgi/ulog</A>).=20
I've been looking for<BR>&nbsp; a decent 2.4 Kernel traffic accounting =
module=20
for a while and gave up and<BR>&nbsp; wrote my own.<BR><BR>&nbsp; This =
module=20
has one fairly interesting feature. Most networks that I<BR>&nbsp; =
administrate=20
are generally quite dynamic. That is, all the workstations<BR>&nbsp; on =
it are=20
assigned their network details and IP Address via DHCP. As =
some<BR>&nbsp; of my=20
clients wished to have accounting down to the workstation =
detail,<BR>&nbsp; I've=20
made this particular module use a mixture of the IP and MAC. =
This<BR>&nbsp;=20
means that if a workstation gets a new IP, it will still have =
traffic<BR>&nbsp;=20
statistics applied correctly to it. If more than one IP has the same=20
MAC,<BR>&nbsp; as when they are behind a router, then accounting will =
still=20
work, but<BR>&nbsp; will only give totals for all addresses. This means =
I'm=20
trusting the MAC<BR>&nbsp; rather than the IP, and I am using two =
tables, one to=20
store MAC's and one<BR>&nbsp; to store IP's, with a relationship of one =
MAC to=20
many IP's. NOTE: Both a<BR>&nbsp; MAC and IP_can_ be forged, but this is =
a topic=20
for another discussion.<BR><BR>------8&lt; Snip of Documentation on how =
it does=20
this ---- 8&lt; -----------<BR><BR>&nbsp;&nbsp;&nbsp; * It would be =
fairly=20
simple to write a web front-end that =
parses<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
the file and links MAC to machine names.<BR><BR>ipacc is essentially the =
'web=20
front-end' that parses in the logfile and<BR>gives a user friendly =
report.=20
There's not terribly much more to comment<BR>on it, apart from the fact =
that its=20
taken hours of work and I'm very<BR>pleased to FINALLY finish=20
it.<BR><BR><BR>----------------------------------------------------------=
-----------------<BR>2.=20
How do I Compile=20
it?<BR>------------------------------------------------------------------=
---------<BR><BR>Hopefully=20
this is fairly simple. I'll just give some step-by-step<BR>instructions: =

-<BR><BR>1. Uncompressed archive to some directory.<BR><BR>2. Copy=20
examples/ipacc.conf to /etc, and modify it.<BR><BR>3. Ensure =
ipaccount.log=20
exists. Touch it if not. Did I mention that you<BR>&nbsp;&nbsp; should =
also have=20
already set up my ulogd_ACCOUNT module?<BR><BR>4. Create a new group =
'ipacc' and=20
add the user the webserver runs under<BR>&nbsp;&nbsp; to it. On my =
system I=20
added the following entry to my=20
/etc/group<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;=20
ipacc:x:22:httpd<BR><BR>5. Set relevant modes on the config file and =
logfile=20
dir. On mine I went: -<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
chown=20
root.root /etc/ipacc.conf &amp;&amp; chmod=20
u=3Drw,g=3Dr,o=3Dr<BR>/etc/ipacc.conf<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=20
chown root.ipacc /var/log/ipacc &amp;&amp; chmod=20
u=3Drwx,g=3Drx,o=3D<BR>/var/log/ipacc<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;=20
chown root.root /var/log/ipacc/* &amp;&amp; chmod 644 =
/var/log/ipacc/*<BR><BR>6.=20
Compile it. Should be as simple as going 'make' in the =
directory.<BR><BR>7. Copy=20
the binary 'ipacc' to your cgi-bin directory. On my system =
it<BR>&nbsp;&nbsp;=20
was /usr/shared/httpd/cgi-bin, and make sure the webserver has=20
perms<BR>&nbsp;&nbsp; to run it. ie:=20
-<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; install -o root -g ipacc =
-m 750=20
ipacc /usr/shared/httpd/cgi-bin<BR><BR>8. Copy the icons directory to =
your=20
webserver icons directory, or set up<BR>your<BR>&nbsp;&nbsp; web server =
such=20
that <A=20
href=3D"http://localhost/icons/ipacc/blah.jpg">http://localhost/icons/ipa=
cc/blah.jpg</A>=20
will read<BR>&nbsp;&nbsp; the picture. Make sure permissions are =
correctly=20
set.<BR><BR>Done!<BR><BR>------------------------------------------------=
---------------------------<BR>3.=20
ipacc.conf<BR>-----------------------------------------------------------=
----------------<BR><BR>The=20
config file is fairly simple (I hope). It is based around having =
groups<BR>of=20
options. For instance, if a company has 20 computers, and those =
20<BR>computers=20
belong to 3 departments, it would make sense to create three<BR>groups, =
and=20
stick the relevant computers into their relevant group. That<BR>way each =

department can pay for their internet usage.<BR><BR>There is also one =
'special'=20
group called 'GLOBAL'. This simply holds a few<BR>global variables for =
use in=20
configuring the software. It can also hold<BR>'default' values for some=20
variables.<BR><BR>A typical options file will look like:=20
-<BR><BR>&nbsp;&nbsp;&nbsp; group GLOBAL=20
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Comment - Global =
Options set=20
here<BR>&nbsp;&nbsp;&nbsp; }<BR><BR>&nbsp;&nbsp;&nbsp; group R&amp;D=20
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # Custom group called=20
R&amp;D<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; host =
00:43:21:59:22:0d=20
"Hawk Eye"<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; host =
00:43:21:59:0d:16=20
"Eagle Eye"<BR>&nbsp;&nbsp;&nbsp; }<BR><BR>&nbsp;&nbsp;&nbsp; group =
OTHER=20
{<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # I like to put unknowns =
in=20
their own group<BR>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; =
accept_unknown=20
1<BR>&nbsp;&nbsp;&nbsp; }<BR><BR>A list of all the current variables are =
as=20
follows. A [G] means it can be<BR>set in the GLOBAL group. A [C] means =
it can be=20
set in a custom group.<BR><BR>accept_unknown [C]<BR>Someone brings in =
their=20
notebook from home and plugs in. They will<BR>register as an unknown MAC =

address. Who should account for this<BR>traffic? This option sets a =
group to=20
'accept' unknown MAC address<BR>traffic.<BR>Values can be 0 or=20
1<BR><BR>cost_per_meg [C][G]<BR>When enabling cost estimation, this =
option=20
specifies how much each<BR>meg over and beyond 'initial_traffic' =
costs.<BR>Value=20
is a float/real.<BR><BR>cosT_per_month [C][G]<BR>When enabling cost =
estimation,=20
this option specifies how much per<BR>month you have to pay =
minimum.<BR>Value is=20
a float/real<BR><BR>estimate_cost [G]<BR>Use this option to enable cost=20
estimation. The software will try to<BR>work out how much you are paying =
for=20
bandwith. It uses the highest<BR>of upload or download.<BR>Value can be =
0 or=20
1<BR><BR>host [C]<BR>This gives a MAC address a name. Whenever the MAC =
address=20
is seen in<BR>the logs, it will now be assigned to this group, and given =
a=20
more<BR>friendly name.<BR>Value is of the form:&nbsp;&nbsp;&nbsp;&nbsp;=20
MACADDRESS FRIENDLYNAME<BR><BR>ipaccountlog [G]<BR>Where can the =
ipaccount log=20
be found.<BR>Value is a string<BR><BR>initial_traffic [C][G]<BR>When =
cost=20
estimation is enabled, what initial traffic do you get<BR>before you =
have to=20
start paying per megabyte.<BR><BR>keepstats_days [G]<BR>NOT USED YET - =
This=20
field will specify how long to keep statistics in<BR>the 'watermark' =
files. This=20
way you can rotate and delete the larger<BR>uLOG file without losing=20
history.<BR><BR>keepstats_size [G]<BR>NOT USED YET - This field will =
specify the=20
maxium size the 'watermark'<BR>file can be. This was you can rotate and =
delete=20
the larger ULOG file<BR>without losing history.<BR><BR>percent_total =
[G]<BR>When=20
enabled, certain columns will appear on some reports showing =
the<BR>percentage=20
bandwith used of the TOTAL bandwith for that month by<BR>a =
group(s)/computer.=20
This way, if it says 'R&amp;D' is using 35% of the<BR>bandwith, they can =
pay for=20
35% of the total cost. Use this rather than<BR>relying on Cost =
Estimation to be=20
totally=20
accurate.<BR><BR><BR>----------------------------------------------------=
-----------------------<BR>4.=20
What is=20
'Automatic'<BR>----------------------------------------------------------=
-----------------<BR>Before=20
I forget I'll just explain Automatic (Found on the report).<BR>I've =
actually=20
written an IP account report before for clients of mine.<BR>It was based =
on=20
ipchains and used the 'counter' for a chain. It was a huge<BR>big ugly =
hack but=20
it worked, and I loathed every character of it.<BR><BR>When I updated to =
my much=20
nicer cleaner interface, I found that my new<BR>interface just didn't =
feel as=20
inuitive. Sometimes I want to sort by<BR>Computer, and sometime by date. =
So I=20
created an 'Automatic' sort that<BR>emulates my old interface's method =
of=20
sorting. It uses the following rules:<BR><BR>&nbsp;- No Month or Group=20
Selected<BR>&nbsp;&nbsp;&nbsp; - Show by Date<BR>&nbsp;- A month =
selected, but=20
no Group/Computer<BR>&nbsp;&nbsp;&nbsp; - Show by Group (for that=20
month)<BR>&nbsp;- No month selected, but a group/computer=20
selected<BR>&nbsp;&nbsp;&nbsp; - Show by date (for that=20
group/computer)<BR>&nbsp;- Both a month and group =
selected<BR>&nbsp;&nbsp;&nbsp;=20
- Show by Group (A list of Computers in the group, for that =
Month)<BR><BR>This=20
was a nice clean hack=20
:-)<BR><BR>--------------------------------------------------------------=
-------------<BR>5.=20
TO=20
DO<BR>-------------------------------------------------------------------=
--------<BR>Not=20
much really. I would like to implement a 'watermark' file that =
stores<BR>the=20
'parsed' ULOG file. This way the Ulog file can be safely deleted, =
and<BR>a=20
date/size can be set on how long to keep old=20
history.<BR><BR><BR>-----------------------------------------------------=
----------------------<BR>6.=20
Contact/Download=20
Details<BR>--------------------------------------------------------------=
-------------<BR>My=20
name is Brendan Grieve. I hope someone finds some use for this =
software<BR>or=20
can modify to their needs.<BR><BR>Official Download Location: <A=20
href=3D"http://www.worldguard.com.au/projects/ipacc">http://www.worldguar=
d.com.au/projects/ipacc</A><BR>My=20
Email:&nbsp; brendan (@) worldguard.com.au<BR><BR>Stay well. God=20
Bless!<BR><BR><BR></DIV></BODY></HTML>

------=_NextPart_000_001A_01C1F995.30BC88B0--


