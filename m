From: Mike <1100100@gmail.com>
Subject: Re: <SOLVED>Port 21, 23,
	and 80 are open according to Shields Up at grc.com
Date: Mon, 13 Sep 2004 20:12:21 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204091317124f5d5731@mail.gmail.com>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<8ca42282040911160952abec3b@mail.gmail.com>
	<1095079786.1899.8.camel@wolfpack.ljm.dom>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095079786.1899.8.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org

This is pretty embarassing but I will go ahead and post it so that it
is forever archived under the "silly noobs on routers" directory.

1.  I've been too lazy to get the roaring penguin dsl client working
on my routerbox.  Historically, I've had trouble with making the right
data packet sizes and providing headroom for packet headers, etc.

2.  So, I'm still using a simple $50 Netgear cable/dsl router to act
as my LAN's DHCP server.

3.  The LAN diagram looks like:  Internet --> Netgear Router --> Linux
firewall/router/gateway --> LAN clients.

4.  A while back I needed to set up some video conferencing for my
boss.  I wanted to make sure there were no issues with the Netgear
router so I simply turned it into a DMZ that let everything through to
the Linux routerbox.

5.  Forgetful as I am, I modified the linux firewall back to its
original state once the video conferencing was completed, but never
turned off the DMZ settings on the Netgear router.  That was the
entire problem.  The netgear was responding and opening ports as it is
designed to do while set on DMZ.

Long story, short.  I tested the linux box on its own with no Netgear
in front of it, and then also tested it with the Netgear set up as the
DHCP server, but no longer set up as a DMZ.  Both tests yielded
results of complete stealth.

Where's the beer.

Mike

