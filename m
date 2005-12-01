From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: dumb question...route from local eth1 to eth2 and vice versa
Date: Wed, 30 Nov 2005 19:13:27 -0800
Message-ID: <08c101c5f625$3318e6e0$5e00800a@printserver>
References: <20051201024311.18382.qmail@web54602.mail.yahoo.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Joel F <roadapathy@yahoo.com>, netfilter@lists.netfilter.org

----- Original Message ----- 
From: "Joel F" <roadapathy@yahoo.com>
To: <netfilter@lists.netfilter.org>
Sent: Wednesday, November 30, 2005 6:43 PM
Subject: dumb question...route from local eth1 to eth2 and vice versa


> eth0 - my WAN ip.
>
> eth1 - 192.168.0.0  My kids network
> eth2 - 192.168.1.0  My personal network
>
> How can I route packets to and from my network of
> 192.168.1.x (eth2)
> to my kids network 192.168.0.x (eth1) so that we can
> all play
> network games???

You may get away with simply enabling forwarding between eth1 and eth2, 
something like this might allow both the *.1.x and the *.0.x networks to 
communicate with eachother:
iptables -A FORWARD -i eth1 -o eth2 -j ACCEPT  #Data going one way is 
allowed
iptables -A FORWARD -i eth2 -o eth1 -j ACCEPT #And data going other way is 
allowed.

Since both networks use the linux box as their gateway, I would guess that 
it'd work.

If you wish restrict your kids access to only one computer on your network 
(and only allow one computer on your network to reach their network)
you can add in -s source_ip and -d dest_ip to make the forward acceptance 
more strict. For example:

iptables -A FORWARD -i eth1 -o eth2 -s 192.168.0.1.24 -j ACCEPT   #Data 
coming from dad's .24 IP is allowed onto kids network.
iptables -A FORWARD -i eth2 -o eth1 -d 192.168.0.1.24 -j ACCEPT  #Data going 
to dad's .24 IP is allowed from kids network.

If you wish to restrict to a specific port, can specify -p tcp (or udp) and 
the --dport 3306 or --sport 5133.
like this:
iptables -A FORWARD -p tcp -i eth1 -o eth2 --dport 139  -j ACCEPT #Forward 
data coming from kids network to dad's network if it's destined for port 
139.

Of course if you have other policies or rules which would block this 
traffic, you'll have to remedy those as well.

Anyway, I'm in way over my head by now. I've been using iptables for years 
(ipchains before that), but like you, once I set it up, I mostly just ignore 
it.

If this doesn't help, just wait till another more experianced answers.

-Jesse


>
> I know this is a really dumb quetion but I set up my
> Linux server
> and Netfilter firewall years ago....AND NEVER HAD TO
> REBOOT IT
> SINCE! MU HA HA HA HA. Linux rocks.
>
> Thank you!
>
>
>
>
> __________________________________
> Yahoo! Mail - PC Magazine Editors' Choice 2005
> http://mail.yahoo.com
>
> 



