From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: ARP question
Date: Fri, 11 Mar 2005 19:43:58 +0200
Message-ID: <3063e5050311094359b3723e@mail.gmail.com>
References: <1110546366.423197bebe6e1@webmail.atix.com.br>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110546366.423197bebe6e1@webmail.atix.com.br>
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
To: "alexb@atix.com.br" <alexb@atix.com.br>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

It has to do with icmp redirescts. You can do these:
on the main server, the one with the internet connectiosn, eun this command:

# for i in /proc/sys/net/ipv4/conf/*/send_redirects ; do echo 0 > $i ; done
also make sure in FORWARD chain in iptables packets between the 2
subnets is accepted.

Also, you can make sure all hots from lan accept the redirects, like

# for i in /proc/sys/net/ipv4/conf/*/accept_redirects ; do echo 1 > $i ; done

Another way, wich is probably the best if you administrate all
computers in lan (hostA, hostB and Serv6) is to add static routes like
these:

HostA:
# ip ro add 200.1.1.0/27 dev eth0

eth0 is the card connected to lan

same on hostB

on serv6:

# ip ro add 200.2.2.8/29 dev eth0

You can read about icmp redirects on google, it is usually used for
sending info to routers about some better routes when they can guess
the topology permit it.

On Fri, 11 Mar 2005 10:06:06 -0300, alexb@atix.com.br <alexb@atix.com.br> wrote:
> I've a strange problem in my network that I beleave is related to the arp table
> and would like to ask if someone could help me trace down the source of my
> probleme.
> 
> My firewall has two internal networks on the same nic and routes back trafic
> from one network to the other eaven they are on the same segment. It's not
> elegand, but in an emergency (after a host crash) its what I could bring up.
> 
>                   Internet
>                       |
>                       |    eth0=PublicIP
>                   firewall
>                       |    eth1=200.1.1.1/27
>                       |  eth1:0=200.2.2.9/29
>                       |
>    Host-A          Host-B         Serv6
>  200.2.2.12/29   200.2.2.14/29  200.1.1.6/27 eth0:0=200.1.1.5/27
> 
> At Host-A it happens that the IP+MAC of Serv6 gets in his arp table, but there
> is no direct route between this hosts. When that happens every services
> provided by serv6 can still be accessed at Host-A as they are routed thru the
> firewall. But I can't ping from Host-A to Serv6.
> If I force to remove Serve6 from host-A arp table (arp -i eth0 -d Serv6) and
> flush his route table (ip route flush cache) then I can ping Serv6.
> Unfortunetly, some minutes later, Serv6 gots into the arp table from Host-A and
> stops ping that I use to monitore the server.
> The problem just occurs on Host-A, I can't see a topological difference betwean
> Host-A and Host-B, just the service they are running.
> Also I have a secont IP bind to the same nic at Serv6, that doesn't get afected
> by this problem (in fact the second IP doesn't ever apears in the arp table).
> 
> What I whant to figure out is how the base IP from Serv6 goes into Host-A arp
> table, as there are no explicit route between the two networks on both (host-A
> and Serv6) forcing them to use the Default Gatway to comunicate. As I
> understand they shouldn't issue any arp requests from the other host as they
> will comunicate thru the GW (firewall).
> 
> Any idea ?
> 
> Thanks
> 
> Alexander E. Belck
> 
> -----------------------------------------------------------------
> Esta mensagem foi enviada pelo IMP, o Internet Messaging Program.
> 
> 


-- 
Bla bla

