From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: seeking heavy weaponry !!
Date: Sun, 7 Jul 2002 21:43:09 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020707204311.KLDF23840.mta03-svc.ntlworld.com@there>
References: <002201c2260e$b9fd7b70$28d33cd0@nebuchadnezza>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <002201c2260e$b9fd7b70$28d33cd0@nebuchadnezza>
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
To: iptables <netfilter@lists.samba.org>

On Monday 08 July 2002 12:32 am, Tim wrote:

> Hey ppl,
>
> echo "[--Setting Policies--]"
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
> iptables -P FORWARD ACCEPT

Please set this one to DROP as well :-)

> #
> #
> ## Allow inside traffic to get to the DMZ and back
> iptables -A FORWARD -i $INTERNAL_NET -o $DMZ_NET -j ACCEPT
> iptables -A FORWARD -i $DMZ_NET -o $INTERNAL_NET -j ACCEPT
> iptables -A INPUT -i $INTERNAL_NET -s 192.168.1.0/24 -d 172.16.1.0/24
> -p icmp -j ACCEPT
> iptables -A OUTPUT -o $DMZ_NET -s 172.16.1.0/24 -d 192.168.1.0/24 -p icmp
> -j ACCEPT
> iptables -A INPUT -i $DMZ_NET -s 192.168.1.0/24 -d 172.16.1.0/24 -p icmp
> -j ACCEPT
> iptables -A OUTPUT -o $INTERNAL_NET -s 192.168.1.0/24 -d 172.16.1.0/24
> -p icmp -j ACCEPT #

You seem to have a big misunderstanding of how packets go through the chains 
in iptables (hint: it's very different from ipchains...)

The INPUT chain is *only* for packets addressed to the firewall itself.

The FORWARD chain is *only* for packets going through the firewall from a 
machine on one side to another machine on the other.

The OUTPUT chain is *only* for packets originated on the firewall itself.

No packet will ever go through both INPUT and FORWARD, or through both 
FORWARD and OUTPUT.

 

Antony.

