From: hclfm@pricol.co.in
Subject: Re: tcpdump query
Date: Wed, 10 Sep 2003 16:32:53 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF9054355A.45AFE669-ON65256D9D.003CAFA4@pricol.co.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
MIME-Version: 1.0
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/html; charset="us-ascii"
To: tsh@mrc-lmb.cam.ac.uk
Cc: netfilter@lists.netfilter.org

<P>Hi ,</P><P>upgrade your tcpdump package. www.tcpdump.org</P><P>regards,<=
/P><P>U.SivaKumar</P><P>&quot;Never give in, never give in, never, never, n=
ever, never - in nothing, great <BR>or small, large or petty - never give i=
n except to convictions of honor and <BR>good sense.&quot; -- Winston Churc=
hill<BR></P><P>&nbsp;<BR><FONT SIZE=3D2><B>&lt;tsh@mrc-lmb.cam.ac.uk&gt;</B=
></FONT><BR><FONT SIZE=3D2>Sent by: netfilter-admin@lists.netfilter.org</FO=
NT><BR><FONT SIZE=3D2>09/10/2003 11:38 AM CET</FONT><BR><BR> <FONT SIZE=3D2=
>To:</FONT> <FONT SIZE=3D2>netfilter@lists.netfilter.org</FONT><BR> <FONT S=
IZE=3D2>cc:</FONT> <BR> <FONT SIZE=3D2>bcc:</FONT> <BR> <FONT SIZE=3D2>Subj=
ect:</FONT> <FONT SIZE=3D2>tcpdump query</FONT><BR> <BR><BR></P><P><FONT FA=
CE=3D"Monospace,Courier">Apologies if this seems off-topic, but it is at le=
ast<BR>being used to investigate an iptables problem.<BR></FONT><BR><FONT F=
ACE=3D"Monospace,Courier">The man page on tcpdump says that the -e option w=
ill<BR>cause tcpdump to print out the link-level header, which<BR>for ether=
net will contain the source and destination<BR>addresses. However, it only =
seems to print either<BR>the source *or* the destination, and gives 0:0:0:0=
:0:0<BR>or 0:0:0:0:0:1 for the other item. e.g.:<BR></FONT><BR><FONT FACE=
=3D"Monospace,Courier">eth0 &gt; 0:0:0:0:0:0 0:4:76:e6:63:59 arp 42: arp re=
ply fw1.mrc-lmb.cam.ac.uk (0:4:76:e6:63:59) is-at 0:4:76:e6:63:59 (8:0:2b:8=
6:97:88)<BR>eth0 &lt; 8:0:2b:86:97:88 0:0:0:0:0:1 ip 98: ag4.mrc-lmb.cam.ac=
.uk &gt; fw1.mrc-lmb.cam.ac.uk: icmp: echo request<BR>eth2 &gt; 0:0:0:0:0:0=
 0:4:75:e2:92:3a ip 98: ag4.mrc-lmb.cam.ac.uk &gt; fw1.mrc-lmb.cam.ac.uk: i=
cmp: echo request<BR>eth2 B 0:10:5a:30:f6:18 Broadcast arp 60: arp who-has =
ag4.mrc-lmb.cam.ac.uk tell fw1.mrc-lmb.cam.ac.uk<BR>eth2 &gt; 0:0:0:0:0:0 0=
:4:75:e2:92:3a arp 42: arp reply ag4.mrc-lmb.cam.ac.uk (0:4:75:e2:92:3a) is=
-at 0:4:75:e2:92:3a (0:10:5a:30:f6:18)<BR></FONT><BR><FONT FACE=3D"Monospac=
e,Courier">Any ideas how I can get it you cough up both?<BR></FONT><BR><FON=
T FACE=3D"Monospace,Courier">Cheers,<BR>Terry.<BR></FONT><BR><BR><BR><FONT =
FACE=3D"Monospace,Courier">Terry Horsnell (tsh@mrc-lmb.cam.ac.uk)<BR>I.T. M=
anager<BR>Medical Research Council<BR>Lab of Molecular Biology<BR>Hills Roa=
d<BR>CAMBRIDGE CB2 2QH<BR>U.K.<BR>Phone:+44 (0)1223 248011<BR>Fax:+44 (0)12=
23 213556<BR></FONT></P>=

