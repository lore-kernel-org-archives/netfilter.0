From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Compiling iptables for Ipaq
Date: Wed, 4 Jun 2003 09:30:36 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF52E34A3@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C32AB6.A0A25016"
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
To: Tahmid Quazi <quazit@nu.ac.za>, netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C32AB6.A0A25016
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

My most obvious suggestion would be:

=20

- clean out the object files with a make distclean

- Hard code CC as arm-linux-gcc or gcc if you aren't cross compiling

- Make sure you `make config` on the kernel set to the arm platform you
are going to run it on. Not sure if this makes a difference, but I can
see that it might.

=20

=20

Ack, it has been so long since doing this stuff! Maybe after I wrangle
that free PDA out of the evil empire's hands, I will `Linify` it!

=20

=20

=20

-----Original Message-----
From: Tahmid Quazi [mailto:quazit@nu.ac.za]=20
Sent: Wednesday, June 04, 2003 3:11 AM
To: netfilter@lists.netfilter.org
Subject: Compiling iptables for Ipaq

=20

hi

=20

I am trying to compile the user-space program "iptables" for
linux-2.4.18-rmk3-hh6.

I have downloaded the latest iptables file and : iptables-1.28.tar.bz2
<http://www.netfilter.org/files/iptables-1.2.8.tar.bz2> =20

And the patch: Patch against 1.2.7a
<http://www.netfilter.org/files/patch-iptables-1.2.7a-1.2.8.bz2>=20

I have also tried the patch-o-matic patch-o-matic-20030107.tar.bz2
<http://www.netfilter.org/files/patch-o-matic-20030107.tar.bz2>=20

When i tried to "make" on both the patches, the prompt returned with
"nothing to be done"

=20

When i run a genral make i get the following error:

=20

[root@manet iptables-1.2.8]# make
Extensions found:
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o
ld: extensions/libipt_ah_sh.o: Relocations in generic ELF (EM: 40)
extensions/libipt_ah_sh.o: could not read symbols: File in wrong format
make: *** [extensions/libipt_ah.so] Error 1
[root@manet iptables-1.2.8]#

=20

I seem to be following the instructions so i dont know where i am going
wrong. (My KERNEL_DIR is the source code directory for the kernel i am
using)

Both 'gcc' and 'arm-linux-gcc' (for the iPaq) give me the same error.

=20

Please could someone help me.

Many thanks in advance for your kind response.

=20

-- tahmid


------_=_NextPart_001_01C32AB6.A0A25016
Content-Type: text/html;
	charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<html>

<head>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3Dus-ascii">


<meta name=3DGenerator content=3D"Microsoft Word 10 (filtered)">

<style>
<!--
 /* Font Definitions */
 @font-face
	{font-family:PMingLiU;
	panose-1:2 2 3 0 0 0 0 0 0 0;}
@font-face
	{font-family:Tahoma;
	panose-1:2 11 6 4 3 5 4 4 2 4;}
@font-face
	{font-family:"\@PMingLiU";
	panose-1:2 2 3 0 0 0 0 0 0 0;}
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
span.EmailStyle17
	{font-family:Arial;
	color:navy;}
@page Section1
	{size:8.5in 11.0in;
	margin:1.0in 1.25in 1.0in 1.25in;}
div.Section1
	{page:Section1;}
-->
</style>

<style>
p.MsoNormal
	{margin-left:1.5pt;}
</style>
</head>

<body lang=3DEN-US link=3Dblue vlink=3Dblue =
style=3D'margin-left:1.5pt;margin-top:1.5pt'>

<div class=3DSection1>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>My most obvious suggestion would =
be:</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>- clean out the object files with a =
<i><span
style=3D'font-style:italic'>make distclean</span></i></span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>- Hard code CC as arm-linux-gcc or =
gcc if
you aren&#8217;t cross compiling</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>- Make sure you `make config` on =
the
kernel set to the arm platform you are going to run it on. Not sure if =
this
makes a difference, but I can see that it might.</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>Ack, it has been so long since =
doing this
stuff! Maybe after I wrangle that free PDA out of the evil =
empire&#8217;s
hands, I will `Linify` it!</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal><font size=3D2 color=3Dnavy face=3DArial><span =
style=3D'font-size:
10.0pt;font-family:Arial;color:navy'>&nbsp;</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>-----Original =
Message-----<br>
<b><span style=3D'font-weight:bold'>From:</span></b> Tahmid Quazi
[mailto:quazit@nu.ac.za] <br>
<b><span style=3D'font-weight:bold'>Sent:</span></b> Wednesday, June 04, =
2003
3:11 AM<br>
<b><span style=3D'font-weight:bold'>To:</span></b> =
netfilter@lists.netfilter.org<br>
<b><span style=3D'font-weight:bold'>Subject:</span></b> Compiling =
iptables for
Ipaq</span></font></p>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D3 =
face=3D"Times New Roman"><span
style=3D'font-size:12.0pt'>&nbsp;</span></font></p>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>hi</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D2 =
face=3DTahoma><span
style=3D'font-size:10.0pt;font-family:Tahoma'>I am trying to compile the
user-space program &quot;iptables&quot; for =
linux-2.4.18-rmk3-hh6.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>I have downloaded the =
latest
iptables file and : <a
href=3D"http://www.netfilter.org/files/iptables-1.2.8.tar.bz2">iptables-1=
.28.tar.bz2</a>
</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>And the patch: <a
href=3D"http://www.netfilter.org/files/patch-iptables-1.2.7a-1.2.8.bz2">P=
atch
against 1.2.7a</a></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>I have also tried the =
patch-o-matic <a
href=3D"http://www.netfilter.org/files/patch-o-matic-20030107.tar.bz2">pa=
tch-o-matic-20030107.tar.bz2</a></span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>When i tried to =
&quot;make&quot; on
both the patches, the prompt returned with &quot;nothing to be =
done&quot;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>When i run a genral make i =
get the
following error:</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>[root@manet =
iptables-1.2.8]# make<br>
Extensions found:<br>
ld -shared -o extensions/libipt_ah.so extensions/libipt_ah_sh.o<br>
ld: extensions/libipt_ah_sh.o: Relocations in generic ELF (EM: 40)<br>
extensions/libipt_ah_sh.o: could not read symbols: File in wrong =
format<br>
make: *** [extensions/libipt_ah.so] Error 1<br>
[root@manet iptables-1.2.8]#</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>I seem to be following the
instructions so i dont know where i am going wrong. (My KERNEL_DIR is =
the
source code directory for the kernel i am using)</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>Both 'gcc' and =
'arm-linux-gcc' (for
the iPaq) give me the same error.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>Please could someone help =
me.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>Many thanks in advance for =
your kind
response.</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>&nbsp;</span></font></p>

</div>

<div>

<p class=3DMsoNormal style=3D'margin-left:.5in'><font size=3D1 =
face=3DTahoma><span
style=3D'font-size:8.0pt;font-family:Tahoma'>-- tahmid</span></font></p>

</div>

</div>

</body>

</html>
=00
------_=_NextPart_001_01C32AB6.A0A25016--

