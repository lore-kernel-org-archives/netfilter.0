From: "Stuart J. Browne" <stuart@promed.com.au>
Subject: RE: Multihomed firewall/router
Date: Sat, 31 Jan 2004 12:02:16 +1100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c3e795$dea933c0$2288e7c0@promed.com.au>
References: <20040130142117.66050.qmail@web41209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040130142117.66050.qmail@web41209.mail.yahoo.com>
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
To: seldeterre@yahoo.com, netfilter@lists.netfilter.org



>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
>seldeterre@yahoo.com
>Sent: Saturday, 31 January 2004 00:21
>To: netfilter@lists.netfilter.org
>Subject: Multihomed firewall/router
>
>
>I have a firewall/router performing snat.  This is its
>configuration.
>
>                        eth1-192.168.1.0/24
>                       /
>Internet--eth0-firewall-eth2-192.168.2.0/24
>                       \
>                        eth3-192.168.3.0/24
>
>My iptables setup is successfully blocking connections
>from eth0.  However, I need to segregate the internal
>subnets from each other because the belong to
>different organizations.  No matter what I try I can't
>seem to block pings from one subnet to another.  I can
>lock it down to only allow input access to the
>interface the subnet is directly connected to, but I
>need to provide dns access to eth1 and this breaks
>when I do this.

It should be pretty simple.  Basically, you want to stop forwarding:

iptables -t filter -P FORWARD DROP

Then you want to only allow forwarding out eth0 for external 'net
traffic:

iptables -t filter -j ACCEPT -o eth0 -m state --satte NEW
iptables -t filter -j ACCEPT -m state --state ESTABLISHED,RELATED

Translation:

Only allow 'new' to be forwarded to the real world, only allow existing
or related back in.

eth[1-3] won't be able to talk to each other because of the Policy on
the Forward chain.

The INPUT and OUTPUT chains don't really need any changing, as they
aren't touched for talking between interfaces.

>The firewall is running a caching dns server(djbdns)
>on eth1.  It also provides dhcp leases, and ntp
>services on eth1-3.
>
>I have also noticed that when I flush the tables and
>delete the chains.  Nat is still provided, i.e. I can
>still connect to the internet.

This is because the NAT rules are in the 'nat' table, not in the
'filter' table.

>Any pointers or help would be greatly appreciated.


Hope this helps some..


