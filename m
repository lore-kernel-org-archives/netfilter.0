From: "Marcos S. Trazzini" <mstrazzini@gmail.com>
Subject: Re: IP and MAC Address check
Date: Wed, 5 Oct 2005 01:58:22 -0300
Message-ID: <20051005045822.GA5636@mobilion>
References: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005d01c5c964$b7ccebe0$580110ac@HO.lippogeneral.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Oct 05, 2005 at 11:24:46AM +0700, Winanjaya - PBXSoftwares wrote:
> Hi All,
> 
> I have list of Mac addresses and also have range of IP addresses.. how to set iptables with conditions below:
> 
> Range of IP addresses: 172.16.2.241 to 172.16.2.250
> 
> List of MAC Addresses: (stored in a file named maclist)
> 01:02:03:04:05:0a
> 01:02:03:04:05:0b
> 01:02:03:04:05:0c
> 01:02:03:04:05:0d
> 01:02:03:04:05:0e
> 01:02:03:04:05:0f
> 01:02:03:04:05:1a
> 01:02:03:04:05:2a
> 01:02:03:04:05:3a
> 01:02:03:04:05:4a
> 
> When Incoming package from the ranged IP address (172.16.2.241 to 172.16.2.250)  then the mac address must be checked from the list of MAC Address, if the MAC Address matched then it allowed otherwise it will be rejected or dropped..
 
Hi All,

This's my first reply to the list (And I wan't to send a lot more...), and
expect to help. Sorry for the the bad english (Need's a litle practice).

Can't you associate each IP with a MAC address from the list? It's the best thing
to do (as it is the most secure...).

Or.... maybe this is that you want:

---CUT HERE---
while read mac; do
  iptables -A INPUT -m mac --mac-source $mac -m iprange --src-range \
   172.16.2.241-172.16.2.250 -j ACCEPT
done < /path/to/maclist
iptables -AINPUT -m iprange --src-range 172.16.2.241-172.16.2.250 -j DROP
---CUT HERE---

This will create a lot of rules (One per MAC address from the list) instead of only one "wonderful rule". Of course the rules must be "best worked", but maybe this can solve the problem.

See also:
# iptables -m mac --help
# iptables -m iprange --help

--
Marcos S. Trazzini

