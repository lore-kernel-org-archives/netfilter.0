From: "PiSiC..." <pisic@service.agress.ro>
Subject: Re: possibly annoing ...
Date: Fri, 28 Feb 2003 13:42:44 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000f01c2df1e$84c04040$c80da8c0@service.agress.ro>
References: <000101c2dee0$78f1fa80$fd0aa8c0@winxp>
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
To: Matt Hellman <mhellman@taxandfinance.com>
Cc: netfilter@lists.netfilter.org

 I tried this ... and doesn't seem to work... but i'm afraid my firewall
script is kinda messy
 I realized that i use MASQUERADE instead of SNAT.
 Can you give me a script or a link where to get one for my case ?

I will show the stuff that i have :

          eth0(aaa.bbb.ccc.ddd)
            |
           fw
            |
           eth1(192.168.13.1)
            |
           switch
            |
           LAN
 - eth0 has a staticaly assigned IP by my ISP.
 - eth1 has an private IP staticaly assigned by me.
 - on LAN i have a machine (192.168.13.199) which runs a webserver which i
want to be accesible from the world.

I think that i should use Static NAT for my machines inside LAN.
I have a firewall script that i just realized that was created for Dynamic
NAT.
I'm running Slackware 8.0 with kernel 2.4.5(all the modules for netfilter
are compiled into kernel(i don't need modprobe)).

I hope i was clear enough.

           Thank you four your efforts,


Danila Octavian
----- Original Message -----
From: Matt Hellman <mhellman@taxandfinance.com>
To: 'PiSiC...' <pisic@service.agress.ro>
Cc: <netfilter@lists.netfilter.org>
Sent: Friday, February 28, 2003 6:18 AM
Subject: RE: possibly annoing ...


> I'll give you an example. It assumes a default drop policy. Also, INTIF =
> internal interface, HTTP1 = external ip address clients will connect to
> (www.mydomain.com resolves to this address), and HTTPDMZ1 = internal web
> server.
>
> ##### Setup prerouting rules to route Internet traffic internally
> ## Change the destination of external $HTTP requests to the DMZ HTTP
server
> $ipt -t nat -A PREROUTING -i $EXTIF -p tcp -d $HTTP1 --dport 33333 -j DNAT
> --to $HTTPDMZ1:80
>
> ## Allow established,related forward traffic
> $ipt -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>
> ## Allow new http forward traffic from Internet to servers in the DMZ
> $ipt -A FORWARD -m state --state NEW -i $EXTIF -p tcp -d $HTTPDMZ1 --dport
> 80 -j ACCEPT
> $ipt -A FORWARD -m state --state NEW -i $EXTIF -p tcp -d $SMTPDMZ --dport
25
> -j ACCEPT




