From: "hard__ware" <hard__ware@hotmail.com>
Subject: RE: ipt_iplimit - IPtables 1.2.7a - Kernel 2.4.18 Issue Resolved
Date: Mon, 30 Sep 2002 00:18:24 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE26CvPeSHvnNFmXNZ600000d00@hotmail.com>
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
To: netfilter@lists.netfilter.org

Hey Antony,

how are you ,,

>Please don't refer to the connection timeout values as Time To Live,
>especially if you put it in comments or documentation for any patches you
>submit - it'll confuse people.

Sorry its just, thats what /proc/net/ip_conntrack says it is and in a few
other docs i have come acoss
 but im not going to argue ... :P

>Time To Live refers to the number of router hops an IP packet is allowed to
>go through.

oh my mistake you are correct, Thanks.

>Antony.
>--
>
>Software development can be quick, high-quality, or low-cost.
>
>The customer gets to pick any two out of three.

I totaly agree, same thing apply's to building computers .. :-)

----------------------------------------------------------------
Also a note to Anders Fugmann,

this is my first actual hack that i had to do myself to NetFilter ..
sorry if you could not read my dumbfounded english ... :P

where i have specified the -+ this means you need to include the code
aftwards
to the file Mentiond above ie ..
~src/linux-2.4/net/ipv4/netfilter/ip_conntrack_standalone.c

where i have specified a dash --- this is the old file (not all of it)
just to show that the -+ line was never there, sorry got work on my
Communication skills & Include Pacth Documentation ...

Thanks for the coment, :D

Good Nite...

{What iz a bed for ? defently not sleep.}

