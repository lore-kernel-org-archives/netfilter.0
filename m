From: Yvonne & Paul Keser <kesers@earthlink.net>
Subject: Re: setting up NAT to a internal network. {Scanned}
Date: Tue, 22 Jul 2003 13:12:03 -0700 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1629345.1058904747863.JavaMail.nobody@bert.psp.pas.earthlink.net>
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
To: Support <support@computer-medic.us>, iptables <netfilter@lists.netfilter.org>
Cc: paul@keser.com

You need to add a more specific route for 192.168.0.0/20 pointing to 192.168.48.1

The easy way would be to put this on the smoothwall.  I have no experience with
smoothwall but you should be able to add additional static routes
unless the have gutted the routing functionality of the original OS.
Normally a router will look for the best match so if the more specific route matches
it will use it, if not it will go to the default.  If smoothwall won't allow this you
still have 2 options, add another interface to the smoothwall (if possible)
and hang 192.168.0.0/20 off that interface or configure all the hosts 
on 192.168.48.0/20 with the static route for 192.168.0.0/20 to point to 
192.168.48.1.

I hope this helps...I have a little iptables experience but a lot of routing experience.

Sorry if the formatting of this email is funky.  I am using earthlink's webmail.  It will probably bounce for the mailing list since it won't be coming from my domain address.

-PaulK
-------Original Message-------
From: Support <support@computer-medic.us>
Sent: 07/22/03 09:12 AM
To: iptables <netfilter@lists.netfilter.org>
Subject: setting up NAT to a internal network. {Scanned}

> 
> Hello All, I'm new to iptables so go easy on me.
I'm using Smoothwall OS as my router / firewall. I have two internal
networks. I need the first network to have access to the second network
that is NATed to the first network. The first network has default route
to the Smoothwall router. Is there anyway to tell iptables that if the
destination is the second network to NAT or direct the packet the
internal router (192.168.48.1)?


ISP
|
XXX.XXX.XXX.XXX DHCP eth1
Smoothwall Router / Firewall
192.168.48.98/20 eth0
|
|
_______________________________________
|First Network            	   	|Second Network
|                         	   	|
192.168.48.0/20   	   	   	192.168.48.1/20
Workstations   	   	   	Internal Router
GW 192.168.48.98   	   	192.168.0.0/20


PS I also posted this on Smoothwalls list and was told they can't help.

Please help!!

Thanks, David


-- 
This message has been scanned for viruses and
dangerous content by www.Computer-Medic.us, and is
believed to be clean.
support@computer-medic.us


> 

