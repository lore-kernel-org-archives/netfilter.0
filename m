From: "Henning Riis Rasmussen" <hrr@indbakke.dk>
Subject: DNAT and IP aliasing - how?
Date: Mon, 10 Mar 2003 12:02:00 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001701c2e6f4$79edee00$85200f0a@smaug>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi all

I'm setting up a firewall using kernel 2.4.20 with iptables 1.2.7a (and some
patches).

The firewall has 3 NICS:

  LAN0  (Local protected network)
  WAN1  (Sister organisation)
  INET2 (Internet)

IP adresses used on LAN and WAN are not routable and must therefore all be
translated by the firewall (i.e. WAN can not route the addresses belonging
to LAN).

Generally hosts on the LAN accessing the WAN should be SNAT'ed behind the
WAN1 interface (and this is no problem).

But at the same time some host on the LAN need to provide services to hosts
on the WAN. And there need to be more than one LAN host providing the same
service (i.e. "DNS") with no possibility of moving that service to another
port.

Hence, I need WAN1 to have more than one IP address (i.e. 10.0.0.1/24,
10.0.0.2/24 and 10.0.0.3/24).

I assume I should use DNAT to provide the address translation needed for the
hosts on the LAN that must be visible on the WAN. But what am I supposed to
do about getting arp responses for the extra IP addresses on the WAN1
interface? I recall using the kernel IP aliasing option in previous setups,
but this is no longer an option in kernel 2.4.20 (as far as I can tell).

What is the "correct" way to set this up?

Regards,
Henning



