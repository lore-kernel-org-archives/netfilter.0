From: =?ISO-8859-1?Q?Mart=EDn_Chikilian?= <slack@efn.uncor.edu>
Subject: Re: security question
Date: Thu, 03 Jun 2004 12:06:08 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40BF3E60.2060206@efn.uncor.edu>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

a.westendoerpf@gmx.de wrote:

> Hi *!

> I have the following setup. Please tell me if I have some security
> issues here.

> A linux box with two ethernet interfaces to work as a masquerading
> router. One of them (eth0) is connected to a dsl-modem, the other is a
> wlan card (eth1). All client systems get this box a default gateway
> via dhcp.

> My goal is to drop everything coming from the wlan by default. I do
> this with:

> # iptables -t nat -P PREROUTING  DROP

I don't know if i understand well what you wrote, but i think that your rule applies to drop packets being PREROUTED by default. What is the goal of this??
What you mean with "is to drop everything coming from the wlan by default" ??
You want to drop packets destined TO wlan by default???

> I want the all www-requests of the client systems to be redirected to
> the local Apache on the box. I do this with:

> # iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 - REDIRECT

The corect rule for this is the next one:
iptables -t nat -A POSTROUTING -p tcp --dport 80 -i eth1 -j REDIRECT

Note the POSTROUTING chain must be used (I think)

> As I need DNS for these www-requests I have to let DNS be accepted:

> # iptables -t nat -A PREROUTING -p udp --dport 53 -i eth1 -j ACCEPT

> Then, in the POSTROUTING chain I need all the packets that made it
> here to be masqueraded:

> # iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

> If I want to allow a specific wlan client to get outside connections I
> use:

> # iptables -t nat -I PREROUTING -m mac --mac-source XX:XX:XX:XX:XX:XX
> -i the1 -j ACCEPT

> to let him through.

> Beside of MAC-spoofing, is this setup safe? Can someone get though the
> PREROUTING chain, without being "MAC-inserted".

Sure there are ways to bypass this restriction, but it is pretty difficult, imho ;-)

> What can I do to block incoming connection attempts? I only want to
> allow ssh from outside (internet) to the box.
Through wlan?? You can do:
iptables --policy INPUT DROP	/* DROP by default incoming packets
iptables --append INPUT --in-interface eth1 --destination-port ssh --jump ACCEPT

Note that if you drop incoming packets by default, you also need to add a few rules:
iptables --append INPUT --in-interface eth1 --match multiport --ports http,https,ftp,ftp-data,ssh,... --jump ACCEPT
You must add the ports that you and your clients commonly use.

Any other doubt, contact the list.

Ciao, Martin


