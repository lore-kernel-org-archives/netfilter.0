From: traef06@ebasedsecurity.com
Subject: Re: Management of bridged iptables
Date: Wed, 27 Apr 2005 05:12:02 -0700
Message-ID: <0380eb44cd704cf780c1fd7f71cece5e@ebasedsecurity.com>
Reply-To: traef06@ebasedsecurity.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: eldesoky.lists@gmail.com
Cc: netfilter@lists.netfilter.org

Thank you.=0D=0A=0D=0ASo, just for my clarification, if I have eth0 (outsid=
e interface) and eth1 as my internal interface and they both=0D=0Aare used =
to form br0, I could assign eth0 an external IP address so that I can ssh i=
nto the box for management?=0D=0A=0D=0AAm I following his correctly?=0D=0A=
=0D=0AThen can I also assign eth1 an internal IP address so that I can mana=
ge it from within as well? This won't harm the bridge=0D=0Ainterface br0?=
=0D=0A=0D=0AThank you in advance for all your assistance.=0D=0A=0D=0A=0D=0A=
Thomas J. Raef=0D=0Ae-Based Security, Inc.=0D=0A"You're either hardened, or=
 you're hacked!" =0D=0A=0D=0A-------- Original Message --------=0D=0A> From=
: Mohamed Eldesoky <eldesoky.lists@gmail.com>=0D=0A> Sent: Tuesday, April 2=
6, 2005 3:32 AM=0D=0A> To: traef06@ebasedsecurity.com=0D=0A> Subject: Re: M=
anagement of bridged iptables=0D=0A> =0D=0A> You can give the firewall an I=
P address, on any interface, whether=0D=0A> part of the bridge or not part =
of the bridge.=0D=0A> This will still keep the firewall stealthy (not shown=
 in traceroutes),=0D=0A> as that IP is not a gateway for any server !!=0D=
=0A> =0D=0A> On 4/26/05, traef06@ebasedsecurity.com <traef06@ebasedsecurity=
.com> wrote:=0D=0A> > I've been scouring Google searches looking for an ans=
wer. If this is the wrong forum, please forgive me.=0D=0A> > =0D=0A> > I wa=
nt to be able to setup iptables and I guess ebtables for a bridged firewall=
. My problem is that I also need to be able=0D=0A> > to manage this remotel=
y like with ssh or something.=0D=0A> > =0D=0A> > How do I do this and still=
 be able to maintain a "stealthy" firewall?=0D=0A> > =0D=0A> > Thank you in=
 advance for any help.=0D=0A> > =0D=0A> > Thomas J. Raef=0D=0A> > e-Based S=
ecurity, Inc.=0D=0A> > "You're either hardened, or you're hacked!"=0D=0A> >=
 =0D=0A> > =0D=0A> =0D=0A> =0D=0A> -- =0D=0A> Mohamed Eldesoky=0D=0A> www.e=
ldesoky.net=0D=0A> RHCE =0D=0A




