From: "Sneppe Filip" <Filip.Sneppe@cronos.be>
Subject: RE: tftp conntrack
Date: Mon, 10 Jun 2002 17:50:27 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <E131E9F1848D0148813EAF06A846608F615DA8@w2ks-e2k.iconos.be>
Mime-Version: 1.0
Content-Type: multipart/alternative;
	boundary="----_=_NextPart_001_01C21096.8A5F4F60"
Return-path: <netfilter-admin@lists.samba.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
To: Skull <skull@skullkrusher.net>, netfilter@lists.samba.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C21096.8A5F4F60
Content-Type: text/plain;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

Hi,

Skull [mailto:skull@skullkrusher.net] wrote:
>
>Yes... To avoid any kind of misunderstanding during the configuration,=20
>this is what I did:
>- I downloaded a 2.4.18-vanilla tarball
>- I've checked out thru CVS the entire netfilter/userspace repository=20
>directory
>- I launched the make patch-o-matic
>

Just out of curiosity:
Can you tell me how you applied newnat then without taking extra
steps? I just tried 2.4.18 and cvs netfilter, and newnat doesn't
apply to 2.4.18 anymore from just running patch-o-matic.

>The only problem happens when it tries to install the tftp-conntrack=20
>helper (that was what I really needed from all this thing... damn...):=20
>it comes out with:
>
>Testing patch extra/tftp-conntrack-nat.patch...
>    Placed new Config.in line
>    Placed new Config.in line
>    Placed new Configure.help entry
>    Placed new Makefile line
>Could not find place to slot in Makefile line
>TEST FAILED: patch NOT applied.
>
>
>And this is not such a verbose comment if I need to understand where =
the=20
>problem is :-)
>

Well, it does show you something useful: it fails on the Makefile,
which is fairly trivial to fix manually. My guess is that you've also=20
applied patches for additional connection tracking helpers.

Why don't you force to apply the patch anyway with patch-o-matic, and
then take a look at the reject file=20
(/path/to/linux/src/net/ipv4/netfilter/Makefile.rej) and manually
adjust the Makefile from it.=20

You really only need to add:

obj-$(CONFIG_IP_NF_TFTP) +=3D ip_conntrack_tftp.o
obj-$(CONFIG_IP_NF_NAT_TFTP) +=3D ip_nat_tftp.o

somewhere :-)

Regards,
Filip

------_=_NextPart_001_01C21096.8A5F4F60
Content-Type: text/html;
	charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 3.2//EN">
<HTML>
<HEAD>
<META HTTP-EQUIV=3D"Content-Type" CONTENT=3D"text/html; =
charset=3DWindows-1252">
<META NAME=3D"Generator" CONTENT=3D"MS Exchange Server version =
6.0.5762.3">
<TITLE>RE: tftp conntrack</TITLE>
</HEAD>
<BODY>
<!-- Converted from text/plain format -->

<P><FONT SIZE=3D2>Hi,<BR>
<BR>
Skull [<A =
HREF=3D"mailto:skull@skullkrusher.net">mailto:skull@skullkrusher.net</A>]=
 wrote:<BR>
&gt;<BR>
&gt;Yes... To avoid any kind of misunderstanding during the =
configuration,<BR>
&gt;this is what I did:<BR>
&gt;- I downloaded a 2.4.18-vanilla tarball<BR>
&gt;- I've checked out thru CVS the entire netfilter/userspace =
repository<BR>
&gt;directory<BR>
&gt;- I launched the make patch-o-matic<BR>
&gt;<BR>
<BR>
Just out of curiosity:<BR>
Can you tell me how you applied newnat then without taking extra<BR>
steps? I just tried 2.4.18 and cvs netfilter, and newnat doesn't<BR>
apply to 2.4.18 anymore from just running patch-o-matic.<BR>
<BR>
&gt;The only problem happens when it tries to install the =
tftp-conntrack<BR>
&gt;helper (that was what I really needed from all this thing... =
damn...):<BR>
&gt;it comes out with:<BR>
&gt;<BR>
&gt;Testing patch extra/tftp-conntrack-nat.patch...<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Config.in line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Config.in line<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Configure.help entry<BR>
&gt;&nbsp;&nbsp;&nbsp; Placed new Makefile line<BR>
&gt;Could not find place to slot in Makefile line<BR>
&gt;TEST FAILED: patch NOT applied.<BR>
&gt;<BR>
&gt;<BR>
&gt;And this is not such a verbose comment if I need to understand where =
the<BR>
&gt;problem is :-)<BR>
&gt;<BR>
<BR>
Well, it does show you something useful: it fails on the Makefile,<BR>
which is fairly trivial to fix manually. My guess is that you've =
also<BR>
applied patches for additional connection tracking helpers.<BR>
<BR>
Why don't you force to apply the patch anyway with patch-o-matic, =
and<BR>
then take a look at the reject file<BR>
(/path/to/linux/src/net/ipv4/netfilter/Makefile.rej) and manually<BR>
adjust the Makefile from it.<BR>
<BR>
You really only need to add:<BR>
<BR>
obj-$(CONFIG_IP_NF_TFTP) +=3D ip_conntrack_tftp.o<BR>
obj-$(CONFIG_IP_NF_NAT_TFTP) +=3D ip_nat_tftp.o<BR>
<BR>
somewhere :-)<BR>
<BR>
Regards,<BR>
Filip</FONT>
</P>

</BODY>
</HTML>
------_=_NextPart_001_01C21096.8A5F4F60--

