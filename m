From: patrick conlin <patrick@wechsler.com>
Subject: simple nat dilemma
Date: Thu, 09 May 2002 13:33:40 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <B9002B34.C58%patrick@wechsler.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

Hello everyone,

Let me preface this by saying that I am seriously disappointed by my failure
to figure out what I'm doing wrong here, and any admonitions I receive from
ramin for being an idiot will be appreciated. I've been using ipchains for a
over a year for simple packet filtering and am now setting up a simple nat
gateway with iptables, but can't get it to work.

I'm trying to get the nat machine (bulgakov) to make zamyatin look and feel
like 207.224.76.204 for all external activity, inbound and outbound.
Eventually I'll be trying to make olesha look and feel like 207.224.76.202,
but one step at a time.

It's the classic setup:

bulgakov
eth0: 207.224.76.201
eth1: 10.1.1.1

zamyatin
eth0: 10.1.1.107

I've got a 1 in /proc/sys/net/ipv4/ip_forward

As an aside, when I set up

# iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Everything works great, for what it's worth (obviously not useful for
inbound connections). I am able to connect to the outside world and do
whatever I want (ping, traceroute, ftp, www, whatever) and It looks like the
connection is coming from 207.224.76.201. Of course, that's not what I'm
trying to do so I flush the chain, follow trusty rusty, and add the
following:

# iptables -t nat -A POSTROUTING -o eth0 -s 10.1.1.107 -j SNAT --to-source
207.224.76.204

No dice. I think the packets must be getting nat'd on the way out, but the
return packects aren't getting sent to the right place, so I add:

# iptables -t nat -A PREROUTING -d 207.224.76.204 -j DNAT --to-destination
10.1.1.107

Still nothing. I think maybe I need some explicit action on my FORWARD
chain, so I add:

# iptables -t filter -A FORWARD -s 10.1.1.107 -j ACCEPT

And

# iptables -t filter -A FORWARD -d 207.224.76.204 -j ACCEPT

Alas, still no love. So, a plea for help to those more fluent. I know I must
be missing something obvious.

Thanks!

patrick


