From: <Josh.Berry@compucom.com>
Subject: FW: connlimit / iplimit patch
Date: Fri, 3 Oct 2003 08:26:45 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <0C7C6E1720E8D74FB52EBEF93649730A0116BFA1@2k099exm01.compucom.local>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="--=_NextPart_ST_08_26_49_Friday_October_03_2003_291"
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
To: Brett.Mueller@csepp.net
Cc: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

----=_NextPart_ST_08_26_49_Friday_October_03_2003_291
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I figured out the issue after a lot of trial and error.  I had to edit
the Makefile under the extensions directory for the iptables source.  I
also had to go to the CVS and download the libipt_connlimit.c code and
stick it in the extensions directory.  In the Makefile, edit the
PF_EXT_SLIB: line (about the 8th down), where you see a list of the
other extensions (ah conntrack dscp ecn esp helper etc...).  Somewhere
in there add connlimit.

=20

At this point you should be able to compile iptables and use the
connlimit match if you have already patched the kernel and compiled it
properly.

=20

Hope this helps.

	-----Original Message-----=20
	From: Brett Mueller [mailto:Brett.Mueller@csepp.net]=20
	Sent: Thu 10/2/2003 6:20 PM=20
	To: Berry, Josh (jberry); Brett Mueller=20
	Cc:=20
	Subject: connlimit / iplimit patch

	-----BEGIN PGP SIGNED MESSAGE-----
	Hash: SHA1
=09
	Hi Josh,
=09
	I wonder if you ever solved this situation:
=09
	On August 11, 2003, you wrote:
	> I am trying to use the connlimit patch.  I added the patch,
compiled
	> and installed the kernel, compiled and installed iptables
v1.2.8,
	> used: insmod ipt_connlimit to load the module.
	>
	> When I try to use it with a match:
	> /usr/sbin/iptables -A FORWARD -p tcp --syn --dport 23 -m
connlimit
	> --connlimit-above 2 -j DROP
	>
	> I get the error:
	> Iptables v1.2.8: Couldn't load match
	> 'connlilmit':/usr/local/lib/iptables/libipt_connlimit.so:
cannot open
	> shared object library
	>
	> Then I noticed that there is nothing in the extensions
directory for
	> connlimit.  Where do I get the shared library?
=09
	I have the same problem.  I found that the Patch-O-Matic puts in
a
	kernel patch for connlimit, while iptables 1.2.8 still has the
old
	extensions for iplimit.  If I try using "-m iplimit
--iplimit-above" in
	a line similar to yours above, I get back "iptables: No
	chain/target/match by that name".  It almost looks to me like
the kernel
	wants one thing and iptables wants the other, but they won't
work
	together.  I've done a lot of searching and found no solutions.
[argh!]
	Any new ideas?
=09
	Thanks...
=09
	- --
	Brett E. Mueller (WA7V)    <><    System Administrator / Network
Analyst
	Umatilla County Emergency Management
http://www.csepp.net
	4700 NW Pioneer Place
541-966-3707
	Pendleton, OR 97801                                    FAX:
541-966-3760
=09
	-----BEGIN PGP SIGNATURE-----
	Version: GnuPG v1.0.7 (GNU/Linux)
	Comment: Using GnuPG with Netscape - http://enigmail.mozdev.org
=09
	iD8DBQE/fLK57K5JOxeDDkoRAvc6AJ47pmg8hX2Zl+RIXTnJZGYGNOv/qQCeKjEA
	kP823XeaZ3lldaeDpiH8GE8=3D
	=3D/OaZ
	-----END PGP SIGNATURE-----
=09
=09


----=_NextPart_ST_08_26_49_Friday_October_03_2003_291
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; charset=3Dus-ascii"=
>


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">
<title>connlimit / iplimit patch</title>

<style>
<!--
 /* Style Definitions */
 p.MsoNormal, li.MsoNormal, div.MsoNormal
	{margin:0in;
	margin-bottom:.0001pt;
	font-size:12.0pt;
	font-family:"Times New Roman";}
a:link, span.MsoHyperlink
	{color:blue;
	text-decoration:underline;}
a:visited, span.MsoHyperlinkFollowed
	{color:blue;
	text-decoration:underline;}
p
	{margin-right:0in;
	margin-left:0in;
	font-size:12.0pt;
	font-family:"Times New Roman";}
span.EmailStyle18
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue>

<div class=3DSection1>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>I figured out the issue after a lot of trial and error.&nbsp; I had=
 to
edit the Makefile under the extensions directory for the iptables source.&n=
bsp;
I also had to go to the CVS and download the libipt_connlimit.c code and st=
ick
it in the extensions directory.&nbsp; In the Makefile, edit the PF_EXT_SLIB=
:
line (about the 8th down), where you see a list of the other extensions (ah
conntrack dscp ecn esp helper etc...).&nbsp; Somewhere in there add connlim=
it.</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>At this point you should be able to compile iptables and use the
connlimit match if you have already patched the kernel and compiled it
properly.</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal><font size=3D3 face=3D"Times New Roman"><span style=3D=
'font-size:
12.0pt'>Hope this helps.</span></font></p>

</div>

<blockquote style=3D'margin-top:5.0pt;margin-right:0in;margin-bottom:5.0pt'=
>

<div>

<p class=3DMsoNormal style=3D'margin-bottom:12.0pt'><font size=3D2
face=3D"Times New Roman"><span style=3D'font-size:10.0pt'>-----Original
Message----- <br>
<b><span style=3D'font-weight:bold'>From:</span></b> Brett Mueller
[mailto:Brett.Mueller@csepp.net] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Thu </span></font><fon=
t size=3D2><span style=3D'font-size:10.0pt'>10/2/2003</span></font><font si=
ze=3D2><span
style=3D'font-size:10.0pt'> </span></font><font size=3D2><span style=3D'fon=
t-size:
 10.0pt'>6:20 PM</span></font><font size=3D2><span style=3D'font-size:10.0p=
t'> <br>
<b><span style=3D'font-weight:bold'>To:</span></b> </span></font><font size=
=3D2><span
  style=3D'font-size:10.0pt'>Berry</span></font><font size=3D2><span
style=3D'font-size:10.0pt'>, Josh (jberry); Brett Mueller <br>
<b><span style=3D'font-weight:bold'>Cc:</span></b> <br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> connlimit / iplimit=
 patch</span></font></p>

</div>

<p style=3D'margin-bottom:12.0pt'><font size=3D2 face=3D"Times New Roman"><=
span
style=3D'font-size:10.0pt'>-----BEGIN PGP SIGNED MESSAGE-----<br>
Hash: SHA1<br>
<br>
Hi Josh,<br>
<br>
I wonder if you ever solved this situation:<br>
<br>
On </span></font><font size=3D2><span style=3D'font-size:10.0pt'>August 11,=
 2003</span></font><font
size=3D2><span style=3D'font-size:10.0pt'>, you wrote:<br>
&gt; I am trying to use the connlimit patch.&nbsp; I added the patch, compi=
led<br>
&gt; and installed the kernel, compiled and installed iptables v1.2.8,<br>
&gt; used: insmod ipt_connlimit to load the module.<br>
&gt;<br>
&gt; When I try to use it with a match:<br>
&gt; /usr/sbin/iptables -A FORWARD -p tcp --syn --dport 23 -m connlimit<br>
&gt; --connlimit-above 2 -j DROP<br>
&gt;<br>
&gt; I get the error:<br>
&gt; Iptables v1.2.8: Couldn't load match<br>
&gt; 'connlilmit':/usr/local/lib/iptables/libipt_connlimit.so: cannot open<=
br>
&gt; shared object library<br>
&gt;<br>
&gt; Then I noticed that there is nothing in the extensions directory for<b=
r>
&gt; connlimit.&nbsp; Where do I get the shared library?<br>
<br>
I have the same problem.&nbsp; I found that the Patch-O-Matic puts in a<br>
kernel patch for connlimit, while iptables 1.2.8 still has the old<br>
extensions for iplimit.&nbsp; If I try using &quot;-m iplimit
--iplimit-above&quot; in<br>
a line similar to yours above, I get back &quot;iptables: No<br>
chain/target/match by that name&quot;.&nbsp; It almost looks to me like the
kernel<br>
wants one thing and iptables wants the other, but they won't work<br>
together.&nbsp; I've done a lot of searching and found no solutions.&nbsp;
[argh!]<br>
Any new ideas?<br>
<br>
Thanks...<br>
<br>
- --<br>
Brett E. Mueller (WA7V)&nbsp;&nbsp;&nbsp; &lt;&gt;&lt;&nbsp;&nbsp;&nbsp; Sy=
stem
Administrator / Network Analyst<br>
Umatilla County Emergency
Management&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;
<a href=3D"http://www.csepp.net">http://www.csepp.net</a><br>
4700 NW Pioneer
Place&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbs=
p;&nbsp;
541-966-3707<br>
Pendleton, OR 97801&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;
FAX: 541-966-3760<br>
<br>
-----BEGIN PGP SIGNATURE-----<br>
Version: GnuPG v1.0.7 (GNU/Linux)<br>
Comment: Using GnuPG with Netscape - <a href=3D"http://enigmail.mozdev.org"=
>http://enigmail.mozdev.org</a><br>
<br>
iD8DBQE/fLK57K5JOxeDDkoRAvc6AJ47pmg8hX2Zl+RIXTnJZGYGNOv/qQCeKjEA<br>
kP823XeaZ3lldaeDpiH8GE8=3D<br>
=3D/OaZ<br>
-----END PGP SIGNATURE-----<br>
<br>
</span></font></p>

</blockquote>

</div>

</body>

</html>
=00
----=_NextPart_ST_08_26_49_Friday_October_03_2003_291--


