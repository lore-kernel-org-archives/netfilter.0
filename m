From: "Jee J.Z." <jz105@york.ac.uk>
Subject: Re: Reinjecting packets using libipq
Date: Tue, 20 Apr 2004 14:13:16 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <009401c426d9$3e2a3a10$68892090@grouse>
References: <OFCC294FDA.EB782326-ON65256E7C.002FB337@hss.hns.com> <20040420102929.GA6236@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>, aksingh@hss.hns.com
Cc: netfilter@lists.netfilter.org

Hi,

You can have a look at 'libnet' for injecting a new packet. I think it's
good for packet construction. But I am not sure whether the newly generated
packet can bypass a certain hook or not at this time.

Jee

>    Also, I had another doubt, can we use libpq to reinject absolutely new
>    packets into the kernel at the ip level and make sure that they dont
get
>    caught by our registered netfilter hooks ? .. or if we cannot use libpq
>    then is someother way available (on the same system where we have the
>    PRE_ROUTING netfilter hook, we want to bypass this hook for certain
>    packets). The newly injected packets cld either be outbound(going to
the
>    wire) or inbound( they after going to ip will have to go up the stack
to
>    tcp and all)

I recently read your new mail at the netfilter mailing list about
(re)injecting new packets from userspace, but actually I don't think
that this would work (or at least it would be quite some work to
do), as you'd also have to build a completely new skb in your
function which would call nf_reinject. Anyone else with more
knowledge on this one??

Another way of injecting packets to the kernel might be packet sockets,
don't know if that would be the right one for you. see man 7 packet


HTH

Sven

>
> thanks
> Amit
>


-- 
Linux zion 2.6.6-rc1 #1 Sat Apr 17 11:50:12 CEST 2004 i686 athlon i386
GNU/Linux
 12:17:13  up 2 days, 19:14,  1 user,  load average: 4.20, 4.08, 2.82


