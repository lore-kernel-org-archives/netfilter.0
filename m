From: Unknown <unknown@unknown.invalid>
Subject: Re: netfilter stops working
Date: Thu, 22 Jan 2004 14:15:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <29259.9350716502$1074799152@news.gmane.org>
References: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
From: Alistair Tonner <>
In-Reply-To: <1074788089.27896.13.camel@webmail.aeropostal.com.ve>
Content-Disposition: inline
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
To: Juan Hernandez <alucard@kanux.com>, Lista de netfilter <netfilter@lists.netfilter.org>


>
> ifconfig eth0 down
> ifconfig eth1 down
> ifconfig eth0 192.168.0.1 #router's address
> ifconfig eth1 up #DHCP internet access
>
> it will work -but not always, sometimes both interfaces do not ping
> anybody- but it will quit working after an hour or so not allowing any
> other services -like internal ftp or mail fetching- and I'll start
> having those logs again... I have checked all the box for any security
> issues and I haven't found any- I have latest packages due to a red hat
> network subscription-. What's weird is that it worked flawlessly for 6
> months...
>

	Juan -- I still firmly believe that this will come down to a routing/connectivity issue.
	      been watching this list for a long time and never have seen issues like this tracked to 
	      netfilter code itself... always routing/network connectivity... *grin* makes me stubborn.
	
	== something you can do here when the problem is occuuring to see the problem more clearly is 
	check your arp cache for the mac addresses of the DSL router and the devices on the LAN 
	(or at least a few of them if htere are many) -- Admittedly I'm still thinking that there
	is some cabling issue -- but I've been watching this list for a Looooong time .. and never seen
	netfilter go this wrong like this... its *always* been a network routing issue.
	
	(my experience was to have the two nic drivers loaded in reverse, and the ROUTING table managed,
	for a brief time, to keep the internet pipe going, but eventually things in arp timed out and caused the pipe
	to fall down. -- in my case I spotted it right off because the two nics have different duplex/speed settings 
	and the settings were reversed to what I expected to see -- I didn't have to get to arp level stuff.)

	Alistair 


> Juan

