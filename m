From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ipchains to iptables NAT/MASQ conversion question.
Date: Wed, 3 Jul 2002 23:28:04 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020703222806.RNQT295.mta03-svc.ntlworld.com@there>
References: <OJEKLLDJMPFGONMBIJEFOEHECEAA.karl@unfiw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <OJEKLLDJMPFGONMBIJEFOEHECEAA.karl@unfiw.com>
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

On Wednesday 03 July 2002 10:27 pm, Karl Kopper wrote:

> I am trying upgrade a long list of ipchains rules to iptables and am stuck.
> On ipchains I was able to create "ACCEPT" rules in the forward chain that
> would cause some packets (based usually on source IP address AND port
> number) to simply pass through the firewall unmasqueraded (they were kicked
> out of the chain before the MASQ rule).
>
> How can I accomplish the same thing using iptables?

The FORWARD chain in IPtables allows or blocks packets going through the 
firewall, nothing to do with NAT.

The nat table in the POSTROUTING chain handles all Source NAT, so if you want 
some packets to be SNATted, and others not, put a rule into the POSTROUTING 
chain which only matches the packets you want NATted, with a target of SNAT.

eg suppose you have two internal network ranges, one routable and one 
private, and you want to SNAT packets from the private network, but not 
packets from the routable network:

# allow packets from inside net to outside
iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT
# allow replies back again
iptables -A FORWARD -i eth0 -m state --state ESTABLISHED, RELATED -j ACCEPT

# NAT the private range on the way out
iptables -A POSTROUTING -t nat -s 192.168.0.0/16 -o eth0 -j SNAT --to 
12.34.56.78

Should do what you need...

 

Antony.

