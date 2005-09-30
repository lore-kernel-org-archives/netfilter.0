From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 08:39:15 -0500
Message-ID: <200509300839.15330.rob0@gmx.co.uk>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<Pine.LNX.4.61.0509301440560.19019@filer.marasystems.com>
	<20050930125427.28160.qmail@focomunicatii.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050930125427.28160.qmail@focomunicatii.ro>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Friday 2005-September-30 07:54, sebastian.ionita@focomunicatii.ro wrote:
> > On Fri, 30 Sep 2005 sebastian.ionita@focomunicatii.ro wrote:
> >> Why doesn't iptables works with vlans interfaces? iptables -t
> >> mangle -A FORWARD -i eth0 -o eth1.11 -j MARK --set-mark 4
> >> Gives me the error:
> >> host/network eth1.11 not found.
> >
> > Sounds like there may be a bug in your iptables command.
> >
> > Are you sure the command line given above is what you tried to use?
> > The error seems to suggest a -s/-d option was used instead of -o.
>
> You are right .. it was my mistake .. :)). In the shell i typed the
> wrong command, but when I wrote the e-mail I write the correct

Hmmm, I had always thought you couldn't use virtual interfaces.
# iptables -vI INPUT -i eth0:101
Warning: wierd character in interface `eth0:101' (No aliases, :, ! or *).
  all opt -- in eth0:101 out *  0.0.0.0/0  -> 0.0.0.0/0
# iptables -vnL INPUT
Chain INPUT (policy ACCEPT 54651 packets, 5325K bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0            all  --  eth0:101 *       0.0.0.0/0            0.0.0.0/0
  12M 4929M State      all  --  *      *       0.0.0.0/0            0.0.0.0/0
55325   12M Outside    all  --  *      *      !192.168.0.0/19       0.0.0.0/0

Why the warning (with "weird" misspelled, no less)? I ping the IP
address for eth0:101, check -vnL again, and the packet counters are
still zero. Apparently the rule is accepted but the kernel cannot use
it.

eth0:101 was made using ifconfig(8), which demands the real interface
name and a colon as prefix to an alias. I tried making another one
using ip(8):
    ip ad ad 192.168.6.78 label eth0.dl dev eth0
ip(8) only seems to want the real interface name. I inserted the rule
without the warning. I inserted a second rule to count --icmp-type 8
and pinged that IP from another host. The ICMP rule packet counters
incremented exactly one for each ping, but the eth0.dl rule never did.

What's the truth here? Is there something needed in the kernel?
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

