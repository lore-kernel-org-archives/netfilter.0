From: Martin <martin@balkanboy.net>
Subject: Re: H323 module installing and copiling prob
Date: Wed, 19 Mar 2003 11:49:36 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0303191144340.9224-100000@balkanboy.net>
References: <14C5057BC852D611BAC400E0299AA10F127444@MAILSERV>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <14C5057BC852D611BAC400E0299AA10F127444@MAILSERV>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: MOUDARIR Mohamed <moudarir@Richbond.ma>
Cc: netfilter@lists.netfilter.org

Why don't you try upgrading your kernel to 2.4.20? I know patching the 
2.4.20 kernel works indeed, because I have RedHat 8.0 and I compiled a 
vanila kernel (from kernel.org), applied the H323 patch through the 
patch-o-matic, enabled the H323 module through the linux menu 
configuration (the curses enabled one), and recompiled.. Reboot, and you 
should be able to place calls from a NAT-ed box where Linux is your 
gateway/firewall...

What I cannot do, and what no one here seems to have offered any advice 
on, is how to get incoming NetMeeting connections to go through NAT and 
into one of the boxes on the internal LAN.. I tried various command sets 
that I found on the archives of this list, but to no avail, none of them 
work. So either I'm doing something wrong, or incoming netmeeting 
connections are just not possible behind NAT...

Martin
p.s. One more important thing - patching the RedHat kernel with the 
Patch-o-Matic H323 patch, does not work. There's some conflicts that do 
not resolve when patching so the patch fails to apply. Which is why I said 
to use 2.4.20 vanila...


On Wed, 19 Mar 2003, MOUDARIR Mohamed wrote:

> Date: Wed, 19 Mar 2003 11:58:46 -0000
> From: MOUDARIR Mohamed <moudarir@Richbond.ma>
> To: netfilter@lists.netfilter.org
> Subject: H323 module installing and copiling prob
> 
> Hi all,
> I want to use netmeeting over an iptables firewal version 1.2.3 ( redhat
> 7.2, kernel 2.4 )
> I use this command to update iptables :
> 	# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login 
> 	# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic co
> netfilter/userspace netfilter/patch-o-matic 
> And to make dependecies :
> 	# cd /usr/src/linux/ 
> 	# make dep 
> And cd ton ~/netfilter/patch-o-matic/ :
> 	./runme extra
> and  # ./runme --batch extra/h323-conntrack-nat.patch
> After that, i add H323 module to kernel :#  make menuconfig
> And compile iptables :
> 	# cd ~/netfilter/userspace/
> 	# make all install
[snip]
> 
> Is there any probleme, and how can i delete the old version of iptables.
> Thanks.
> 


