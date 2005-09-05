From: =?ISO-8859-1?Q?Javier_Miguel_Rodr=EDguez?=
	<javier.miguel@talika.eii.us.es>
Subject: Question about high perfomance Linux firewall
Date: Mon, 05 Sep 2005 20:36:23 +0200
Message-ID: <431C9027.3010104@talika.eii.us.es>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailinglist <netfilter@lists.netfilter.org>

Hello

I have to built a FAST Linux firewall (12 gigabit ethernets), and I need 
your advice

My current setup is ( I can change things if needed)

Compaq Proliant DL380g4 (1 xeon 3.6 ghz, with hyperthreading, pci-x 
based, 1 gb ram)
2 broadcom gigabit ethernet cards (tg3 driver)
3 intel quad gigabit ethernet cards (e1000 driver)


I need to keep connection tracking, so nf-hipac is discarded. I will use 
almost no logging.
My ruleset will be rather short: 500-600 lines, with SNAT/DNAT in about 
5% of these rules. Only ipv4 will
be used in this firewall setup.

I expect substained rates of 300-400 megabits on EACH gigabit interface, 
with gigabit peaks. I also expect 40.000-50.000
concurrent connections (mainly http/smtp/dns traffic). I also expect 
500-600 megabits of NATed traffic (to & from  internet)


Which gigabit ethernet card is more suitable for high perfomance 
filtering? Any special advice
about linux distro/ kernel tuning?

Thank you for your support

