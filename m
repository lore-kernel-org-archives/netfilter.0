From: "Slawomir Orlowski" <orlowscy@hotpop.com>
Subject: virtual interfaces not visible from internet
Date: Wed, 22 Oct 2003 13:57:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00a101c398c5$e5546b00$4900a8c0@cympak.com>
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

Hello there,

I have working Linux 6.1 kernel 2.16 firewall with ipchains + ipmasqadm.

And I have wanted to build new one based on RH 9.0 kernel 2.4 + iptables.

I have build it following guidelines of Oskar Andreasson (Iptables Tutorial
1.1.19) expanding, adding some rules.
I have 10 virtual interfaces (web pages on LAN). So I needed to add
Prerouting (DNAT) rules to it and proper Forward rules because web servers
are behind firewall.

I can ping from firewall all its interfaces external eth0, eth0:0 ...
eth0:10 and internal eth1.
But they are not visible form internet, not all of them, sometimes some of
them...
From internet I can ping eth0 and sometime two of its virtual interfaces
(one for DNS, anothe for web page) for example eth0:3 and eth0:1 and them if
I can ping it I can get web page of IP of this interface.

Funny thing is then I swap to old firewall I will not be able for a few
hours to ping this two IP address (it is not the some interface exact
interface). For example IP 198.x.x.89 on old one is eth1:4 on new one is
eth0:3.
There is a difference between then on old working one, external interfaces
are eth1, eth1:0 ... eth1:10 and internal is eth0, but this should not
matter, should not it?

I have been swapping them on the fly. There are first 20 something "BTP: not
in syn" packets from broken masq connection from old one, but there are not
dropped INPUT OUTPUT or FORWARD packages (I'm logging nearly everything).

So usually after swapping to new one, I can get the first web page I'm
trying to get by external proxy (to check it from outside).
The some behavior is then I'm doing it for some PC at home.
And I can not get other web pages, I cannot ping their IP addressees. After
swapping from new one to old one, this first web page would not work but
rest would.

I have two virtual interfaces designated to answer DNS queries about our
domains.
Funny thing after connecting new firewall one will work with it second not,
after swapping to old one will be opposite way for a few hours. Latter both
will work. It do not make any sense to me, I cannot understand it.

So please somebody help me. It looks like magic to me.

One more thing traffic originated form LAN will go through firewall
(eth1-eth0 SNAT) without any problems.
This magic situation concerns only virtual interfaces. This is really strong
firewall in not letting anybody in :)
I would appreciate if somebody would be willing to help me in any way.

ANY advice appreciated.

Best regards.

Slawomir Orlowski


