From: "Dharmendra.T" <dharmu@nsecure.net>
Subject: RE: Small problem -> Prerouting
Date: 16 Apr 2003 18:25:48 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050497772.1001.8.camel@india>
References: <NIENICGJBBAFMLFBMABHGELFCDAA.matti.luoma@bitboys.com>
Mime-Version: 1.0
Content-Type: multipart/alternative; boundary="=-M59EWqyqANPxnq0Y/1/k"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NIENICGJBBAFMLFBMABHGELFCDAA.matti.luoma@bitboys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Matti Luoma <matti.luoma@bitboys.com>
Cc: netfilter@lists.netfilter.org


--=-M59EWqyqANPxnq0Y/1/k
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 2003-04-16 at 18:17, Matti Luoma wrote:

    =EF=BB=BF
                        Seems to be in use, so i cant remove it, so it
    has to be something else...
    =20
                        What module does PREROUTING need anyways?
    =20

        =20
        On Wed, 2003-04-16 at 17:41, Matti Luoma wrote:=20

            Hiya!
           =20
            Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compil=
ed newest=20
            iptables 1.2.8
           =20
            now i got this weird problem with
           =20
            example this line:
           =20
            iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT =
--to IP:Port
           =20
            It should works, and it works, but not anymore, SSH forwarding =
like this=20
            works thou
           =20
            also im gettin some stuff in syslog:
           =20
            kernel: NAT: 0 dropping untracked packet c66ab6c0
           =20
            i think these things are related, and probably some module is c=
ausing this,=20
            any ideas?
           =20
            Cheers,
            Matti
           =20
            I guess this is because of conntrack module. Just check do you =
need this if not remove it.=20


Do onething, recompile the kernel and enable only the modules which you
want to use.=20
I guess PREROUTING does not use any external module. If iptables is
enabled PREROUTING will be enabled.

Regards
Dharmu

--=-M59EWqyqANPxnq0Y/1/k
Content-Type: text/html; charset=utf-8

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 TRANSITIONAL//EN">
<HTML>
<HEAD>
  <META HTTP-EQUIV="Content-Type" CONTENT="text/html; CHARSET=UTF-8">
  <META NAME="GENERATOR" CONTENT="GtkHTML/1.0.4">
</HEAD>
<BODY>
On Wed, 2003-04-16 at 18:17, Matti Luoma wrote:
    <BLOCKQUOTE>
    <FONT COLOR="#737373"><FONT SIZE="3"><I>&#65279;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#0000ff"><FONT SIZE="2"><I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; Seems to be in use, so i cant remove it, so it has to be something else...</FONT></FONT></I>
    <BR>
    <FONT COLOR="#737373"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
    <BR>
    <FONT COLOR="#0000ff"><FONT SIZE="2"><I>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;What module does PREROUTING need anyways?</FONT></FONT></I>
    <BR>
    <FONT COLOR="#737373"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
        <BLOCKQUOTE>
        <FONT COLOR="#737373"><FONT SIZE="3"><I>&nbsp;</FONT></FONT></I>
        <BR>
        <FONT COLOR="#737373"><FONT SIZE="3"><I>On Wed, 2003-04-16 at 17:41, Matti Luoma wrote: </FONT></FONT></I>
            <BLOCKQUOTE>
<PRE><FONT COLOR="#737373"><FONT SIZE="3"><I>Hiya!</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Well i upgraded my kernel to 2.4.20 from 2.4.3, and also compiled newest </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables 1.2.8</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>now i got this weird problem with</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>example this line:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>iptables -A PREROUTING -t nat -p UDP -d IP -dport port -j DNAT --to IP:Port</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>It should works, and it works, but not anymore, SSH forwarding like this </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>works thou</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>also im gettin some stuff in syslog:</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>kernel: NAT: 0 dropping untracked packet c66ab6c0</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>i think these things are related, and probably some module is causing this, </FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>any ideas?</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Cheers,</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>Matti</FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I></FONT></FONT></I>
<FONT COLOR="#737373"><FONT SIZE="3"><I>I guess this is because of conntrack module. Just check do you need this if not remove it. </FONT></FONT></I></PRE>
            </BLOCKQUOTE>
        </BLOCKQUOTE>
    </BLOCKQUOTE>

<BR>
Do onething, recompile the kernel and enable only the modules which you want to use. 
<BR>
I guess PREROUTING does not use any external module. If iptables is enabled PREROUTING will be enabled.
<BR>

<BR>
Regards
<BR>
Dharmu
</BODY>
</HTML>

--=-M59EWqyqANPxnq0Y/1/k--


