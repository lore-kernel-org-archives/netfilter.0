From: "John Wells" <lists@sourceillustrated.com>
Subject: Re: icmp unreachable - need to frag
Date: Sun, 24 Oct 2004 13:49:15 -0400 (EDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <2135.172.16.3.2.1098640155.squirrel@172.16.3.2>
References: <1865.172.16.3.2.1098597006.squirrel@172.16.3.2>
	<1098630525.9024.19.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1098630525.9024.19.camel@hubcap.ljm.dom>
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

Jason Opperisano said:
> huh?  OSX has the BSD IPSec stack in its kernel.

Really?  Had no idea.  I'm not an OS X guy, but my wife recently bought an
eMac.  When we purchased it, I googled for IPSec clients...couldn't find
any non-commercial ones.  PPTP was the natural choice since it was
supported by default.  However, guess I *should* have searched on IPSec
*support*.  Thanks for the heads up...I should now be able to drop poptop
and go back to freeswan...

> what you need to do is lower the MSS that is being advertised by the
> Windows XP machine.  on the VPN Server/Router:
>
>         iptables -A FORWARD -p tcp --syn -s $WINXP_BOX \
>           -j TCPMSS --set-mss 1400
>
> if the problem continues--lower that 1400 until the problem disappears.
> i have had to ratchet it down as low as 1330 on IPSec + WiFi setups.
> with your addition of the ppp0 (pptp) MTU of 896--you may need to use
> "--set-mss 850" before the Windows XP box will work properly.

Bingo!  Setting to 850 works...setting to 880 doesn't, curiously.  I wish
I could trouble you to describe in depth what was going on here, but I'd
bet it'd involve me realizing quickly I need to pull the old networking
textbooks of the shelf and dust up on the details.

So, one final question:

Wouldn't it be better to raise the PPTP MTU value from 896 to something a
bit higher up, like 1400, and then set this with the command you gave? 
Seems like that would be less overhead on the network, but I'm probably
wrong.

Thanks tremedously for your reply.  It was a very frustrating experience!

John



