From: Luke Deryckx <luke@westaironline.com>
Subject: Re: Compiling new iptables after kernel patch (compilation errors)
Date: Fri, 02 Apr 2004 08:33:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BC92D5C6.6C3F%luke@westaironline.com>
References: <200404020430.i324UxsV030704@server5.bandwidthco.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="B_3163739590_33813479"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404020430.i324UxsV030704@server5.bandwidthco.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: markee@bandwidthco.com, Netfilter list <netfilter@lists.netfilter.org>

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3163739590_33813479
Content-type: text/plain; charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

Absolutely sure. :)

It=B9s actually /usr/src/linux-2.4.22 for me but I also have a sym link at
/usr/src/linux=20

I checked many times, tried specifying on the command line, and even tried
hard coding it into the Makefile.

I think I might try starting from scratch with a different kernel. I did
this same process on another linux distro machine with kernel 2.4.25 and
iptables 1.2.7a and it worked flawlessly.

From what I=B9ve seen of the IP_PPTP_CONNTRACK patch on the other machine, it
works very nicely by the way. It was nice to be able to VPN in with two
sessions to the same office from behind the same NAT =AD a definite must for
any publicly used NATed network.

 Thanks for the help

 Luke



On 4/1/04 8:30 PM, "Mark E. Donaldson" <markee@bandwidthco.com> wrote:

> Are you using "make KERNEL_DIR=3D/usr/src/linux" ?
>=20
>=20
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Luke Deryckx
> Sent: Wednesday, March 31, 2004 2:58 PM
> To: netfilter@lists.netfilter.org
> Subject: Compiling new iptables after kernel patch (compilation errors)
>=20
> I=B9ve patched my kernel (2.4.22) using the ip_conntrack_pptp patch in the
> latest patch-o-matic which I downloaded from the netfilter.org website.
> Everything went very smoothly patching, building installing and booting m=
y
> kernel. However when I try to compile (or re-compile) any version of ipta=
bles
> so that it will work with my new kernel the make fails almost immediately
> yielding the a few different errors.
>=20
> If I attempt to compile a fresh version of iptables 1.2.6a which is what =
I had
> been runing on before I get:
>>>  >> make: *** No rule to make target `extensions/libipt_dscp.o', needed=
 by
>>> `extensions/libext.a'.  Stop.
> If I try any other version it seems (I=B9ve tried 1.2.7a and 1.2.9) I get:
>>>  >>make: *** No rule to make target `extensions/libipt_dscp.o', needed =
by
>>> `extensions/libext.a'.  Stop.
> Or
>>>  >> make: *** No rule to make target `extensions/libip6t_mark.c', neede=
d by
>>> `extensions/libip6t_mark.d'.  Stop.
>=20
> Depending on if I=B9ve fooled around with the Make file at all (which I did=
 to
> try to overcome these errors)
>=20
> I=B9m using a debian based linux called Pebble (www.nycwireless.org/pebble)=
 with
> the 2.4.22 kernel (which I have recompiled and reinstalled).
>=20
> I=B9ve tried compiling with and without the NO_SHARED_LIBS value set in Mak=
efile
> (changing this seems to change the error, but there is still and error) a=
nd
> I=B9ve also made extra sure that I have the correct KERNEL_DIR set
> (/usr/src/linux-2.4.22 in my case).
>=20
> Any advice would be most appreciated.
>=20
>  Thanks
>=20
>  Luke Deryckx
>=20
>=20
>=20



--B_3163739590_33813479
Content-type: text/html; charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

<HTML>
<HEAD>
<TITLE>Re: Compiling new iptables after kernel patch (compilation errors)</=
TITLE>
</HEAD>
<BODY>
<FONT FACE=3D"Verdana">Absolutely sure. :) <BR>
<BR>
It&#8217;s actually /usr/src/linux-2.4.22 for me but I also have a sym link=
 at /usr/src/linux <BR>
<BR>
I checked many times, tried specifying on the command line, and even tried =
hard coding it into the Makefile. <BR>
<BR>
I think I might try starting from scratch with a different kernel. I did th=
is same process on another linux distro machine with kernel 2.4.25 and iptab=
les 1.2.7a and it worked flawlessly.<BR>
<BR>
From what I&#8217;ve seen of the IP_PPTP_CONNTRACK patch on the other machi=
ne, it works very nicely by the way. It was nice to be able to VPN in with t=
wo sessions to the same office from behind the same NAT &#8211; a definite m=
ust for any publicly used NATed network. <BR>
<BR>
&nbsp;Thanks for the help<BR>
<BR>
&nbsp;Luke<BR>
<BR>
<BR>
<BR>
On 4/1/04 8:30 PM, &quot;Mark E. Donaldson&quot; &lt;markee@bandwidthco.com=
&gt; wrote:<BR>
<BR>
</FONT><BLOCKQUOTE><FONT COLOR=3D"#0000FF"><FONT SIZE=3D"2"><FONT FACE=3D"Arial">=
Are you using </FONT></FONT></FONT><FONT SIZE=3D"2"><FONT FACE=3D"Arial"><B>&quo=
t;</B></FONT><B><FONT FACE=3D"Verdana">make KERNEL_DIR=3D/usr/src/linux&quot; ?<=
BR>
</FONT></B></FONT><FONT FACE=3D"Verdana"><BR>
<HR ALIGN=3DCENTER SIZE=3D"3" WIDTH=3D"100%"></FONT><FONT SIZE=3D"2"><FONT FACE=3D"Ta=
homa"><B>From:</B> netfilter-admin@lists.netfilter.org [mailto:netfilter-adm=
in@lists.netfilter.org] <B>On Behalf Of </B>Luke Deryckx<BR>
<B>Sent:</B> Wednesday, March 31, 2004 2:58 PM<BR>
<B>To:</B> netfilter@lists.netfilter.org<BR>
<B>Subject:</B> Compiling new iptables after kernel patch (compilation erro=
rs)<BR>
</FONT></FONT><FONT FACE=3D"Verdana"><BR>
I&#8217;ve patched my kernel (2.4.22) using the ip_conntrack_pptp patch in =
the latest patch-o-matic which I downloaded from the netfilter.org website. =
Everything went very smoothly patching, building installing and booting my k=
ernel. However when I try to compile (or re-compile) any version of iptables=
 so that it will work with my new kernel the make fails almost immediately y=
ielding the a few different errors. <BR>
<BR>
If I attempt to compile a fresh version of iptables 1.2.6a which is what I =
had been runing on before I get:<BR>
&nbsp;&gt;&gt; make: *** No rule to make target `extensions/libipt_dscp.o',=
 needed by `extensions/libext.a'. &nbsp;Stop.<BR>
If I try any other version it seems (I&#8217;ve tried 1.2.7a and 1.2.9) I g=
et: <BR>
&nbsp;&gt;&gt;make: *** No rule to make target `extensions/libipt_dscp.o', =
needed by `extensions/libext.a'. &nbsp;Stop.<BR>
Or<BR>
&nbsp;&gt;&gt; make: *** No rule to make target `extensions/libip6t_mark.c'=
, needed by `extensions/libip6t_mark.d'. &nbsp;Stop.<BR>
<BR>
Depending on if I&#8217;ve fooled around with the Make file at all (which I=
 did to try to overcome these errors)<BR>
<BR>
I&#8217;m using a debian based linux called Pebble (www.nycwireless.org/peb=
ble) with the 2.4.22 kernel (which I have recompiled and reinstalled). <BR>
<BR>
I&#8217;ve tried compiling with and without the NO_SHARED_LIBS value set in=
 Makefile (changing this seems to change the error, but there is still and e=
rror) and I&#8217;ve also made extra sure that I have the correct KERNEL_DIR=
 set (/usr/src/linux-2.4.22 in my case). <BR>
<BR>
Any advice would be most appreciated. <BR>
<BR>
&nbsp;Thanks<BR>
<BR>
&nbsp;Luke Deryckx<BR>
<BR>
<BR>
<BR>
</FONT></BLOCKQUOTE><FONT FACE=3D"Verdana"><BR>
</FONT>
</BODY>
</HTML>


--B_3163739590_33813479--


