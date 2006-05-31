From: "Enigma Psi" <enigmapsi@gmail.com>
Subject: MSAQ and SHAPING: A million dollar question
Date: Thu, 1 Jun 2006 02:25:00 +0300
Message-ID: <e2ddd1bc0605311625t7d1bf0eco4c915c069af2cacd@mail.gmail.com>
References: <e2ddd1bc0605311609m48b261adp2b87542e59576860@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <e2ddd1bc0605311609m48b261adp2b87542e59576860@mail.gmail.com>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I have a great question for the netfilter developers. But first, a
little explanation.

I am a net engineer, and tried to implement a net solution for a
medium-sized ISP. They rely on linux for their machines (routers
included) so didn't want to change this. So, they've asked for a
solution for traffic shaping and masquerading on one of their network
branch. Tha first, basic, setup was a Centos linux box, with two nics,
one having an external IP, the other an internal one ( 10.10.10.254,
mask /24). Masq works okay, as I made this config a few hundred times.

Both, masq and shaping, are done on the same machine. Shaping is done
with the tc tool from linux. The "download" shaping acts on the
internal interface, the "upload" traffic on the external one (this
means, both on the egress side). So, every thing is okay, aparently.

Now, here comes the problem. While the shaping on the internal
interface is okay (/sbin/tc class add dev eth0 parent 1:1 classid 1:11
htb  rate 32Kbit ceil 64Kbit burst 4Kbit prio 3 quantum 1532 and
/sbin/tc filter add dev eth0 parent 1:1 protocol all prio 2 u32 match
ip dst 10.0.0.179 flowid 1:11) - meaning that the dst ip is correctly
seen, the upload traffic doesn't get matched ( match ip src
10.0.0.179). As far as I could see with iptraf and other tools, the
shaper sees the ALLREADY MASKED IP in this case. Now, this is very
annoyng, cause the iptables docs say that POSTROUTING is done "just
before the packet is sent out the wire". But it seems that POSTROUTING
is executed before the shaping (egress) code.

Now, if someone understood all this...can he, or she, tell me where on
the Earh does the MASQ (SNAT-POSTROUTING) code sit inside the kernel
in relation with EGRESS shaping code?

Oh, by the way, the qdisc used is HTB, as this can be seen from the
lines above.


Thanks allot!

