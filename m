From: jim@netgate.com (Jim Thompson)
Subject: Re: [NoCat] spoofing client IP configuration
Date: Thu, 13 Mar 2003 16:52:30 -0800 (PST)
Sender: hostap-admin@shmoo.com
Message-ID: <20030314005230.85F27F4006@netgate.com>
References: <5.2.0.9.0.20030313064430.0323ecb0@yeagerautomation.com>
Return-path: <hostap-admin@shmoo.com>
In-Reply-To: <5.2.0.9.0.20030313064430.0323ecb0@yeagerautomation.com>
Errors-To: hostap-admin@shmoo.com
List-Unsubscribe: <http://lists.shmoo.com/mailman/listinfo/hostap>,
	<mailto:hostap-request@shmoo.com?subject=unsubscribe>
List-Id: <netfilter.vger.kernel.org>
List-Post: <mailto:hostap@shmoo.com>
List-Help: <mailto:hostap-request@shmoo.com?subject=help>
List-Subscribe: <http://lists.shmoo.com/mailman/listinfo/hostap>,
	<mailto:hostap-request@shmoo.com?subject=subscribe>
List-Archive: <http://lists.shmoo.com/pipermail/hostap/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: doug@aircomwireless.net, hostap@shmoo.com, , netfilter@lists.netfilter.org, nocat@lists.nocat.net, , nocatnet@lists.nocat.net, 

Its been discussed on the list before.  Its basically spoofed ARP responses and NAT.

Check the archives...

Jim

	From nocat-admin@lists.nocat.net  Thu Mar 13 04:14:29 2003
	X-Original-To: jim@netgate.com
	X-Sender: doug@ycomsystems.com@yeagerautomation.com
	X-Mailer: QUALCOMM Windows Eudora Version 5.2.0.9
	To: nocat@lists.nocat.net;, nocatnet@lists.nocat.net;,
		hostap@shmoo.com;, netfilter@lists.netfilter.org
	From: Doug Yeager <doug@aircomwireless.net>
	Mime-Version: 1.0
	Content-Type: text/plain; charset="us-ascii"; format=flowed
	Subject: [NoCat] spoofing client IP configuration
	Sender: nocat-admin@lists.nocat.net
	Errors-To: nocat-admin@lists.nocat.net
	X-BeenThere: nocat@lists.nocat.net
	X-Mailman-Version: 2.0.12
	Precedence: bulk
	List-Help: <mailto:nocat-request@lists.nocat.net?subject=help>
	List-Post: <mailto:nocat@lists.nocat.net>
	List-Subscribe: <http://lists.nocat.net/mailman/listinfo/nocat>,
		<mailto:nocat-request@lists.nocat.net?subject=subscribe>
	List-Id: Development list for the NoCatAuth project <nocat.lists.nocat.net>
	List-Unsubscribe: <http://lists.nocat.net/mailman/listinfo/nocat>,
		<mailto:nocat-request@lists.nocat.net?subject=unsubscribe>
	List-Archive: <http://lists.nocat.net/pipermail/nocat/>
	Date: Thu, 13 Mar 2003 06:58:24 -0500

	o.k.,
	managing a public WLAN, people have all sorts of IP configurations preset 
	on their clients (not all are dhcp clients enabled).
	i am currently running a DHCP server and it works *MOST* of the time.  the 
	ultimate solution would be to somehow ignore the client ip configuration 
	and map to the clients on the server side based on their mac address, or 
	something like that.  i know this is possible because there are hotels that 
	do this kind of thing.....some terms like "nomadic server" have popped up.

	i want the server to route based on local addresses, so this service 
	hopefully would run at the mac level.
	the public wlan currently runs:
	nocat gateway
	HostAP
	Iptables firewall
	DHCPD  (server in question by this email)

	any alternatives to DHCP that do this would be great....i just want people 
	configured to their work ip configs to be able to get on.  would moving to 
	802.11 auth help?  i don't think so because after authentication you still 
	need an IP to do anything...unless i'm thinking about this wrong.

	thx,
	doug


	_______________________________________________
	NoCat mailing list
	NoCat@lists.nocat.net
	http://lists.nocat.net/mailman/listinfo/nocat
