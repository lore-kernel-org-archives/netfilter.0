From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: iptables leaking blocked ip addresses.
Date: Mon, 20 Jun 2005 23:24:50 -0400
Message-ID: <200506202324.50283.Alistair@nerdnet.ca>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <49bf7d7050620083448c1dee9@mail.gmail.com>
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

On June 20, 2005 11:34 am, terry l. ridder wrote:
> hello;
>
> i have recently noticed that iptables is leaking blocked ip addresses into
> the local network.
>
> one example of the leak is below:
>
> 200.0.0.0/8 is dropped if the destination port is 25 (smtp).
> the large majority of the packets are dropped but a random few are leaking
> pass iptables.
> 404 19712 DROP       tcp  --  eth2   *       200.0.0.0/8
> 0.0.0.0/0           tcp dpt:25
> 143   6992 DROP       tcp  --  eth2   *       201.0.0.0/8
> 0.0.0.0/0           tcp dpt:25
>
> at the 2nd lines of defenses the following is seen:
>
> date and time is utc.
>
> 2005-06-18 08:20:38.310864 IP 200.221.11.147.29937 >
> 204.238.34.206.25: R 0:0(0) win 0
> 2005-06-18 08:35:33.035504 IP 200.221.11.147.9618 > 204.238.34.206.25:
> R 3184482893:3184482893(0) win 64240
> 2005-06-18 09:12:47.772699 IP 200.221.11.147.37399 >
> 204.238.34.206.25: R 0:0(0) win 0
> 2005-06-18 10:15:29.731794 IP 200.221.11.147.37803 >
> 204.238.34.206.25: R 3790354139:3790354139(0) win 64240
> 2005-06-18 12:28:47.356603 IP 200.221.11.147.37540 >
> 204.238.34.206.25: R 3124247582:3124247582(0) win 64240
> 2005-06-18 14:42:14.852914 IP 200.221.11.147.59505 >
> 204.238.34.206.25: R 2944314039:2944314039(0) win 64240
> 2005-06-18 16:56:23.417184 IP 200.221.11.147.51204 >
> 204.238.34.206.25: R 3050896753:3050896753(0) win 64240
> 2005-06-18 19:09:00.235525 IP 200.221.11.147.14427 >
> 204.238.34.206.25: R 2304489220:2304489220(0) win 64240
> 2005-06-18 21:22:08.824748 IP 200.221.11.147.54471 >
> 204.238.34.206.25: R 2920726621:2920726621(0) win 64240
> 2005-06-18 23:35:36.046110 IP 200.221.11.147.27797 >
> 204.238.34.206.25: R 0:0(0) win 0
> 2005-06-19 01:49:10.050142 IP 200.221.11.147.29328 >
> 204.238.34.206.25: R 0:0(0) win 0
> 2005-06-19 04:01:59.082248 IP 200.221.11.147.23754 >
> 204.238.34.206.25: R 0:0(0) win 0
> 2005-06-19 06:15:32.815212 IP 200.221.11.147.46328 >
> 204.238.34.206.25: R 1445346336:1445346336(0) win 64240
>
> computers are all running debian sarge with kernel 2.6.11.10 and iptables
> version iptables v1.2.11.
>
> i also have a short web page concerning the iptables leaks at:
> http://204.238.34.206/iptables-leaks.txt


	I hope that what I saw was the corrected configuration:

	given that, I have to agree that your filtering method is slightly odd, 
however I can follow that it will work -- somewhat.
	In my diagrams, and understanding these packets are FORWARD packets, thus 
your iptables flow is as follows:
1) mangle PREROUTING
2) nat PREROUTING (where you have a lot of drops done)
3) mangle FORWARD
4) filter FORWARD (keep this fella in mind.....)
5) mangle POSTROUTING
6) nat POSTROUTING (where you appear to be dropping a lot of outbound stuff)

	The tcpdump didn't have a lot of detail to my eye... since you filter 
200.x.x.x 255.0.0.0. could these packets have an illegal netmask on them?
	you have a couple of ACCEPT rules in FORWARD -- I'm not 100% certain but I 
suspect that those ACCEPTS could shortcut NAT Postrouting -- but don't take 
it as bible.

	Those are just a couple of thoughts on what might be happening in there.. I'm 
not sure what changed on debian in that upgrade, but folks on their mailing 
lists would have a better clue.  I'm a gentoo/slackware/*cough*RH*cough* 
user .. and HP-UX and Solaris -- but thats work and no fun on an off night.


	Alistair.

	

