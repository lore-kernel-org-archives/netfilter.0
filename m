From: "ISC Jorge Ceron Galvan" <jorgec@acerlandslp.com.mx>
Subject: Re: Problem getting connection to terminal Server behind router and
	firewall
Date: Wed, 19 Oct 2005 12:46:42 -0500
Message-ID: <WorldClient-F200510191246.AA46420109@acerlandslp.com.mx>
References: <20051019154258.31D6BCAFF@dd2824.kasserver.com>
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051019154258.31D6BCAFF@dd2824.kasserver.com>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marius <netfilter@marius83.de>, netfilter@lists.netfilter.org

I had a similar problem, and I found out that you must open ports 1000-2000 tcp/udp because 
the client pc uses them to make the conecction.

Maybe you closed them and they have to be open.


-----Original Message-----
From: "Marius" <netfilter@marius83.de>
To: <netfilter@lists.netfilter.org>
Date: Wed, 19 Oct 2005 17:42:50 +0200
Subject: Problem getting connection to terminal Server behind router and firewall

> Hello,
> 
> I have got following problem and would be happy about every hint you
> can
> give to me:
> 
> Infrastructure:
> ===============
> 
> A router (AVM Fritz!Box Phone 7050 connected via Broadband-Access to
> the
> WWW, using an dynamic IP adress. It's neccesarry to use this Router
> because
> it includes a VoIP-telephone switchboard with QOS-Features. 
> External Adress: dynamic (WAN)
> Internal Adress: 192.168.178.1
> 
> The dynamic Address is published through a dyndns-Account
> 
> After the router there is my firewall, (SuSE 9.3, iptables). The
> firewall is
> based on a "harry's script" which was a little bit modified.
> eth0: 192.168.178.100 (connected to the router)
> eth1: 192.168.1.100   (connected to my LAN)
> 
> With IP 192.168.1.101 there is a Microsoft Windows SBS Server 2003
> including
> Terminal-Server Service reached via MS-Remote-Desktop (Port 3389)
> 
> ToDo:
> =====
> 
> The Terminal-Server should be reached from the www.
> 
> This works fine as long as I don't have the Linux-Server in my
> network.
> If I change the MS SBS-IP to 192.168.178.101 for example and
> configure the
> router to forward all TCP 3389 requests to 192.178.101, everything
> works as
> it should.
> 
> Problem:
> ========
> 
> After the Linux-Firewall is between router an MS SBS, Terminal-Server
> access
> is not possible (all client services HTTP, HTTPS, POP3, IMAP... work
> fine)
> 
> I tried to ways:
> 
> 1. Config the router to forward all TCP 3899 requests to the firewall
> (192.168.178.100) On the firewall i put the setting: 
> iptables -t nat PREROUTING -p tcp --dport 3389 -j DNAT --to
> 192.168.1.101:3389 and (another try) iptables -t nat PREROUTING -p
> tcp
> --dport 3389 -j DNAT --to 192.168.1.101
> 
> 2. Config the outer to forward all TCP requests directly to MS SBS
> (192.168.1.101)
> Firewall:
> iptables -A FORWARD -p tcp --dport 3389 -j ACCEPT
> 
> On both way's a tried to include Source/Destination-IP,
> incoming/outgoing
> devices, but without any positive results. Which way I should follow
> generally?
> 
> There get some packages through the firewall using both solutions (I
> can see
> an incoming connections in the Terminal-Servers log files) but no
> correct
> connection can be established.
> 
> Thanks for your help


