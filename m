From: "loong" <loong@eads.com.my>
Subject: Re: firewall bridge , Vlan ?
Date: Mon, 9 Jun 2003 13:22:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <044601c32e47$31279820$b401a8c0@ows5>
References: <09B04A55822EFF4DA48D2E0BB2941D4A01926C@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: netfilter@lists.netfilter.org

no,

i don wan install firewall need a hub.
becouse netsreen or other firewall don no need hug when they put few server
behind the firewall..

i don no how to do this.. you have any idea?

loong



----- Original Message ----- 
From: "George Vieira" <georgev@citadelcomputer.com.au>
To: "loong" <loong@eads.com.my>
Sent: Monday, June 09, 2003 12:51 PM
Subject: RE: firewall bridge , Vlan ?


> Yeah you can do that with multiple NICs but what's the reason for this? Is
it to seperate the webservers from each other so that they can't see the
other webservers?
>
>
> -----Original Message----- 
> From: loong [mailto:loong@eads.com.my]
> Sent: Mon 09-Jun-03 1:46 PM
> To: netfilter@lists.netfilter.org
> Cc:
> Subject: firewall bridge , Vlan ?
>
>
> hi
>
> is there anywhere install bridge firewall and install vlan
> http://www.candelatech.com/~greear/vlan.html
>
>
> so that my firewall can run like netscreen without using  hug or switch to
my webserver.
>
> currently is
> internet -- > eth0 firewall   eth1 -- >   hub ------> webserver 1
>                                                      ------> webserver 2
>
> is that anywhere i install few network card in my firewall then
>
> internet --->    eth0    firewall   eth1 ---->    webserver 1
>                                                      eth2 ----->
webserver 2
>                                                      eth3 ----->
webserver 3
>
>
> thanks
>
> loong
>
>
>
>
>
>
>
>
>
>
> ----- Original Message ----- 
> From: John Paul <mailto:john@pinoylinux.sytes.net>
> To: George Vieira <mailto:georgev@citadelcomputer.com.au>  ;
netfilter@lists.netfilter.org
> Sent: Monday, June 09, 2003 11:35 AM
> Subject: Re: Problem Found! - Firewall Rule
>
> Thanks George. I have modified my network to (10.10.0.0/24).
>
> Now, I'am able to ping the machines inside the network after connected to
the VPN. The problem now is, I'm not able to map/see machines in Network
Neighborhood except the VPN server.
>
> Any clue?
>
>
>
> ----- Original Message ----- 
> From: George Vieira <mailto:georgev@citadelcomputer.com.au>
> To: John Paul <mailto:john@pinoylinux.sytes.net>  ;
netfilter@lists.netfilter.org
> Sent: Friday, June 06, 2003 8:56 AM
> Subject: RE: Problem Found! - Firewall Rule
>
> Your local IP is the same as the remote networks IP.. so how is the local
machine to know that 192.168.0.55 or 66 or 32 is on the VPN!?
>
> The only way I know is to proxyarp the ppp device that the vpn is running
on.. I'm assuming it's PPTP so you could try this command when the VPN comes
up :
> echo 1 > /proc/sys/net/ipv4/conf/$VPNDEV/proxy_arp
>
> and this must be done on the VPN server too..
> I've never done it this way with a VPN.. but you can only try it..
>
> I'm surprised that anything really works properly the way you've done it
because the firewall has 2 network devices with the same IP range.
>
> Thanks,
>
>
> ____________________________________________
> George Vieira
> Citadel Computer Systems Pty Ltd Systems Manager georgev AT
citadelcomputer DOT com DOT au
> Citadel Computer Systems Pty Ltd
> Phone : +61 2 9955 2644 HelpDesk: +61 2 9955 2698
<http://www.citadelcomputer.com.au/> http://www.citadelcomputer.com.au
<http://www.citadelcomputer.com.au/>
>
>
> -----Original Message-----
> From: John Paul [mailto:john@pinoylinux.sytes.net]
> Sent: Friday, June 06, 2003 9:56 AM
> To: netfilter@lists.netfilter.org
> Subject: Problem Found! - Firewall Rule
>
>
>
> Hello Folks, its me again :(
>
> Below is my config. My problem is, I can connect to VPN but for some
reason, I cannot see machines inside the network after being connected. Can
somebody give me the simpliest firewall rule on this? just for me to see the
machines inside the network.
>
> Thanks!
> /JP
>
>
>


