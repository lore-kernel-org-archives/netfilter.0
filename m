From: Luke Deryckx <luke@westaironline.com>
Subject: Compiling new iptables after kernel patch (compilation errors)
Date: Wed, 31 Mar 2004 14:57:52 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BC908CF0.6B5A%luke@westaironline.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="B_3163589872_26484192"
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

> This message is in MIME format. Since your mail reader does not understand
this format, some or all of this message may not be legible.

--B_3163589872_26484192
Content-type: text/plain; charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

I=B9ve patched my kernel (2.4.22) using the ip_conntrack_pptp patch in the
latest patch-o-matic which I downloaded from the netfilter.org website.
Everything went very smoothly patching, building installing and booting my
kernel. However when I try to compile (or re-compile) any version of
iptables so that it will work with my new kernel the make fails almost
immediately yielding the a few different errors.

If I attempt to compile a fresh version of iptables 1.2.6a which is what I
had been runing on before I get:
 >> make: *** No rule to make target `extensions/libipt_dscp.o', needed by
`extensions/libext.a'.  Stop.
If I try any other version it seems (I=B9ve tried 1.2.7a and 1.2.9) I get:
 >>make: *** No rule to make target `extensions/libipt_dscp.o', needed by
`extensions/libext.a'.  Stop.
Or
 >> make: *** No rule to make target `extensions/libip6t_mark.c', needed by
`extensions/libip6t_mark.d'.  Stop.

Depending on if I=B9ve fooled around with the Make file at all (which I did t=
o
try to overcome these errors)

I=B9m using a debian based linux called Pebble (www.nycwireless.org/pebble)
with the 2.4.22 kernel (which I have recompiled and reinstalled).

I=B9ve tried compiling with and without the NO_SHARED_LIBS value set in
Makefile (changing this seems to change the error, but there is still and
error) and I=B9ve also made extra sure that I have the correct KERNEL_DIR set
(/usr/src/linux-2.4.22 in my case).

Any advice would be most appreciated.

 Thanks

 Luke Deryckx




--B_3163589872_26484192
Content-type: text/html; charset="ISO-8859-1"
Content-transfer-encoding: quoted-printable

<HTML>
<HEAD>
<TITLE>Compiling new iptables after kernel patch (compilation errors)</TITL=
E>
</HEAD>
<BODY>
<FONT FACE=3D"Verdana">I&#8217;ve patched my kernel (2.4.22) using the ip_con=
ntrack_pptp patch in the latest patch-o-matic which I downloaded from the ne=
tfilter.org website. Everything went very smoothly patching, building instal=
ling and booting my kernel. However when I try to compile (or re-compile) an=
y version of iptables so that it will work with my new kernel the make fails=
 almost immediately yielding the a few different errors. <BR>
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
</FONT>
</BODY>
</HTML>


--B_3163589872_26484192--


