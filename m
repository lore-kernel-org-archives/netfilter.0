From: "Mark E. Donaldson" <markee@bandwidthco.com>
Subject: RE: forwarding traffic from one port to another on the same box
Date: Tue, 27 Jan 2004 21:49:53 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401280549.i0S5nqmK030255@server5.bandwidthco.com>
References: <bv779t$mo0$1@sea.gmane.org>
Reply-To: <markee@bandwidthco.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <bv779t$mo0$1@sea.gmane.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: 'Andrew' <andrew@arda.homeunix.net>, netfilter@lists.netfilter.org

 Andrew - your DNAT rule looks fine to me and it should work.  I really
think your problem is the first rule, even though the error is apparently
charged to the second rule.  I think what you need to do is change the first
rule to -A to the INPUT chain and not the forward chain and it should work.
The packet is not being forwarded, but is rather destined to the same NIC -
so it should be the INPUT chain.  Try that and see if it does the trick.  If
not, holler again cause there are many with greater expertise on this list
than me. 

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Andrew
Sent: Tuesday, January 27, 2004 6:38 PM
To: netfilter@lists.netfilter.org
Subject: forwarding traffic from one port to another on the same box

I would like to forward all tcp traffic arriving on a particular port to
another port on the same machine. This has worked for me in the past but I
can't get it working on my current machine.

Here are the two commands I'm using to try to create the forward.

iptables -I FORWARD -p tcp -d 192.168.10.34 --dport 26 -j ACCEPT

iptables -t nat -A PREROUTING -p tcp -i eth0 -s 0/0 -d 192.168.10.34 --dport
26 -j DNAT --to 192.168.10.34:25

The first command is accepted but the second command results in an 'Invalid
argument' error.

The computer has only one interface, eth0. Here are its particulars:
Mandrake Linux 9.2
Iptables 1.2.8
kernel 2.4.24 patched with super-freeswan 1.99.8

The value of /proc/sys/net/ipv4/conf/eth0/forwarding is 0. Changing it to 1
has no impact.
The value of /proc/sys/net/ipv4/conf/eth0/rp_filter is 0.

I hope someone out there has some ideas about what's going on because I'm
all out.

Andrew





