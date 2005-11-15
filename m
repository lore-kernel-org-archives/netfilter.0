From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 15 Nov 2005 10:07:08 +0100 (CET)
Message-ID: <Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
References: <4372A919.8020100@rosi-kessel.org>
	<4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4378A8B1.8010206@rosi-kessel.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Adam Rosi-Kessel <adam@rosi-kessel.org>
Cc: netfilter@lists.netfilter.org

On Mon, 14 Nov 2005, Adam Rosi-Kessel wrote:

> Okay--would it be sufficient to grep on port 500? conntrack tracks by port,
> right? So as long as there are *no* entries in ip_conntrack for port 500 at
> any point while I'm trying to make this connection, doesn't it mean that
> conntrack isn't handling the packets?

Yes. And if conntrack does not handle them, NAT won't do either.

> I should also mention that all other NAT stuff works fine with this setup,
> including FTP (passive and active), web browsing, etc..  I am also able to
> DNAT inbound ssh connections to another internal machine.  It's only these
> inbound udp port 500 that are somehow not entering the nat table or showing
> up anywhere other than in mangle PREROUTING.

Try to enable internal logging by

echo 255 > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid

and load in ipt_LOG or ipt_ULOG as logging engines.

Add a logging rule to the very end of the PREROUTING chain in the mangle
table:

iptables -t mangle -A PREROUTING -m state --state INVALID -j LOG \
	--log-prefix "INVALID packet: "

and let's see the result.

I suspect the UDP packets in question are marked as INVALID for some
reason.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

