From: "Rodrigo Haces" <rhaces_chistes@yahoo.com.mx>
Subject: RE: IP Alias with iptables
Date: Mon, 19 Apr 2004 10:07:15 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <EMEKLOMJOPNJPAFKHEDJGECHCDAA.rhaces_chistes@yahoo.com.mx>
References: <200404191553.50340.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404191553.50340.Antony@Soft-Solutions.co.uk>
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



> Enviado el: Lunes, 19 de Abril de 2004 08:54 a.m.
>
> On Monday 19 April 2004 4:41 pm, Rodrigo Haces wrote:
>
> > Hi:
> >
> > I have only one network adapter in my Server, but i need to have 2
> > different networks, 192.168.1.0 to the MAC addresses i know and
> 192.168.0.0
> > to the MAC addresses i don't know
>
> This sounds strange - what is your network layout, giving rise to
> machines
> with "MAC addresses you don't know", which need you to be on a different
> subnet?

Ok, this is what i want, i have a Restaurant, and have an administrative
network (192.168.1.0) and i am giving wireless access to my clients, but i
cant let them get into my administrative network, so i set them 192.168.0.0.

>
> > i have managed this by makin mi eth0 to
> > 192.168.1.1 and an alias eth0:0 to 192.168.0.1, everythings ok, but i'm
> > also sharing internet, but when i start the rule to the eth0:0
> it sends me
> > an error. Is there a way to use IP Aliasing with iptables?
>
> Yes - just remember that there's only one physical interface, and
> it's called
> eth0.   Don't try to use :0 or :1 in your netfilter rules.   You
> can always
> use -s or -d to specify source & destination IP addresses if you want the
> rule/s to apply only to certain packets.

ok, this are my rules, were and how do i use the -d and -s??

echo "   FWD: Allow all connections OUT and only existing and related ones
IN"
iptables -A FORWARD -i ppp0 -o eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT
iptables -A FORWARD -i eth0 -o ppp0 -j ACCEPT
echo "   Enabling SNAT (MASQUERADE) functionality on ppp0"
iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE

>
> > if not, is there a way to create an eth0 and eth1 witn the same adapter?
>
> No.   It's a simple (and cheap) job to add another ethernet card, though.

No PCI slots available... :(

Thanks in advanced
Rodrigo


