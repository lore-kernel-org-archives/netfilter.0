From: "Rob Sterenborg" <rsterenborg@xs4all.nl>
Subject: RE: iptables and http port(80)
Date: Tue, 14 Jan 2003 20:08:57 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <GOEDLKDBKHLHGAKAGFGKAECOLMAA.rsterenborg@xs4all.nl>
References: <20030114184338.80245.qmail@web14606.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030114184338.80245.qmail@web14606.mail.yahoo.com>
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

> Hello world,
> I have a link on my web server router linux mandrake 8.2
> which shows nothing(white page) inside and outside of my
> network. I add INPUT( -A INPUT -i eth1 -p tcp -m tcp
> --dport 80 -j ACCEPT) rule in my firewall(iptables 1.2.5)
> and now i can browse this link inside my network but none
> outside. I add OUTPUT( -A OUTPUT -o eth0 -p tcp -m tcp
> --dport 80 -j ACCEPT)  rule but I'm not able to browse this
> link outside my network. I don't catch what's wrong
> Any help will be more appreciated

The INPUT chain is for incoming packets.
The OUTPUT chain is for outgoing packets, and is not refering to the
external network card.

Since the webserver can reply to your clients, I assume the you have a
default policy of ACCEPT for the OUTPUT chain (iptables -P OUTPUT
ACCEPT) so you don't have to use any rule there.

I guess your LAN is connected to eth1 and internet to eth0.
To accept http traffic for your LAN and internet :
# iptables -A INPUT -i eth1 -p tcp --dport 80 -j ACCEPT
# iptables -A INPUT -i eth0 -p tcp --dport 80 -j ACCEPT

If you have only 2 network cards (disregarding lo), you can a rule
like this :
# iptables -A INPUT -p tcp --dport 80 -j ACCEPT


Rob


