From: P@draigBrady.com
Subject: Re: UDP connection tracking problem
Date: Mon, 10 Nov 2003 16:05:27 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FAFB747.4090005@draigBrady.com>
References: <3FAFA135.9050707@draigBrady.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FAFA135.9050707@draigBrady.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

P@draigBrady.com wrote:
> Hi, I've a very simple rule set as follows, and in summary
> it looks to me like udp connection tracking info
> is only being updated for traffic comming into the box?
>=20
> Chain INPUT (policy DROP)
> target     prot opt source               destination
> ACCEPT     all  --  127.0.0.1            anywhere
> ACCEPT     all  --  anywhere             anywhere           state=20
> RELATED,ESTABLISHED
> ACCEPT     all  --  172.18.1.170         anywhere
>=20
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere           state=20
> NEW,RELATED,ESTABLISHED
>=20
> The problem is that I can't initiate udp from this box.
> If I allow udp in, I can do tftp fine.
> Then removing the udp rule I can tftp fine for
> variable amount of time 0s, 30s, 180s.
>=20
> I'm using linux 2.4.20 and iptables v1.2.7a

Ah hang on, when the UDP is sent out, the following
is added to /proc/net/ip_conntrack as expected:
udp      17 22 src=3D172.18.1.55 dst=3D172.18.1.14 sport=3D32769 dport=3D=
69=20
[UNREPLIED] src=3D172.18.1.14 dst=3D172.18.1.55 sport=3D69 dport=3D32769 =
use=3D1

However the response packet doesn't use 69 as the sport.
It seems to use an ephemeral one (33118)

FYI the tftpd is "tftp-hpa 0.34, with remap, with tcpwrappers"

Hmm: http://www.zytor.com/pipermail/syslinux/2003-April/001851.html

Should udp connection tracking only use the sport
for outgoind packets and dport for incomming packets?

P=E1draig.


