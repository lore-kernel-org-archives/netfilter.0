From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Is Linux based Gateway/Firewall feasible
Date: Thu, 08 Jul 2004 16:43:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1089297824.2125.32.camel@anduril.intranet.cartel-securite.net>
References: <40ED39B9.30608@svw.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40ED39B9.30608@svw.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Sudheer Divakaran <sudheer@svw.com>
Cc: netfilter@lists.netfilter.org

Le jeu 08/07/2004 =E0 14:10, Sudheer Divakaran a =E9crit :
> I'm asking this because one guy told me that my decision to go for a=20
> Linux based solution is a wrong one and it can never match the=20
> performance of hardware based Routers.

While this statement is not true regarding low end Cisco products : my
home "ye old good" P233MMX performs better at routing/firewall than a
Cisco 827 router with IOS Firewall. Not mentioning price... Stressed, I
got 50Mbps total passthrough using DLink quad ethernet adapter, router
optimize kernel and ratherly clean ruleset, what is largely overperforms
my needs...

Now, one can tell you that a Cisco 7200 serie will perform far better
than a PC architectured solution based on Linux, which will probably be
true. But, the thing you should consider first is whether you need this
performance or not. I mean I could plug a 7200 on my home LAN, with
gigabit interface, connected to a 2950 switch and so on. It will perform
far better than my Linux box. But, in my context which is 5Mbps ADSL
link, 3 Wifi 54g laptops and 1 box, I certainly don't need this
overpowerful and overpriced solution.

Now you can stress your Linux box to bench it, and see if it offers
bandwidth and latency you need now, and fits your future evolution
plans. And don't forget a high end PC with PCI 64bits gigabit adapter is
often cheaper than most Cisco stuff...

Finally, you have to take in account the fact that a Linux based
solution is de facto full featured, as with stock 2.6 kernel, you have :

	. routing
	. advanded policy routing
	. QoS
	. stateful firewalling from layer 2 to layer 5
	. 802.3ad bonding (see Cisco Etherchannel)
	. 802.1q VLAN support
	. etc...

Which is not necessarily the case of Cisco routers with stock IOS, not
mentionning the fact that some Cisco routers cannot be shipped with all
available features because of a too small Flash/RAM amount.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

