From: Mike <1100100@gmail.com>
Subject: Re: Port 21, 23, and 80 are open according to Shields Up at grc.com
Date: Tue, 14 Sep 2004 01:09:07 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <8ca4228204091322097d44fbc1@mail.gmail.com>
References: <1095079786.1899.8.camel@wolfpack.ljm.dom>
	<200409132122.i8DLM1i6001590@bassett.home.org>
	<8ca42282040913164724b70aa4@mail.gmail.com>
Reply-To: Mike <1100100@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca42282040913164724b70aa4@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

SOLVED.

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

