From: "Andrew J. Meader" <ameader@corp.lcom.net>
Subject: Re: Changing MAC Addresses
Date: Mon, 16 Dec 2002 08:24:10 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DFDE20A.7040106@corp.lcom.net>
References: <3DF16CDD.5000400@aos.net.au>
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
To: Sam Johnston <samj@aos.net.au>, netfilter@lists.netfilter.org

Sam,

What does /sbin/ifconfig -a tell you?

Andy

Sam Johnston wrote:

 > Afternoon all,
 >
 > I'm not sure if this is the best forum for this question as it is not
 > necessarily directly related to Netfilter, but I can't think of
 > anywhere else I might find anyone capable of answering it, so here goes.
 >
 > I have a bunch of xboxes running linux which all have the same MAC
 > address: 00:00:00:00:00:00. This causes obvious problems when more
 > than 1 machine is on any one segment. I'm led to believe I can work
 > around the problem by putting something like:
 >
 > /sbin/ifconfig eth0 hw ether 00:50:f2:ab:cd:ef up
 >
 > fairly early in the boot process (specifically, I've chosen the pre-up
 > directive in /etc/network/interfaces as they're running Debian).
 >
 > When I do this I'm able to see the MAC<->IP mapping in the ARP table
 > of another machine, but it doesn't respond. I figure that something
 > somewhere is remembering the old MAC address and dropping anything
 > that doesn't match, although I don't know enough about low level
 > networking in linux to be sure.
 >
 > Any suggestions would be appreciated.
 >
 > Sam





