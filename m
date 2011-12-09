From: "U.Mutlu" <for-gmane@mutluit.com>
Subject: Re: [nfqueue] nfqueue in virtualized environment (ie. on a VPS)
Date: Fri, 09 Dec 2011 12:04:07 +0100
Message-ID: <jbspvo$lnf$2@dough.gmane.org>
References: <jbr5is$u2g$1@dough.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jbr5is$u2g$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

For the interested ones: here are similar postings regarding the same issue:
   http://forum.openvz.org/index.php?t=msg&goto=40984&
and a bugreport here:
   http://bugzilla.openvz.org/show_bug.cgi?id=1677


U.Mutlu wrote, On 12/08/2011 09:09 PM:
> I need to use, in a virtual environment (VPS), an app
> that makes use of libnetfilter_queue (ie. the NFQUEUE target of iptables).
> Running the same app on the host machine works fine,
> but I need it to run also on VPSes.
>
> Is nfqueue supposed to work in such virtual environments?
> (IMO since iptables works fine on a VPS, then I think nfqueue should do too, isn't it?)
>
> I wonder why it's not working on my setup.
> Could someone please give me some hints & tips for diagnosing and solving this problem?
> It would be much helpful if someone who has it working simply confirm that it works.
>
> My environment: debian wheezy using openvz kernel from the debian repo:
> # uname -a
> Linux s7 2.6.32-5-openvz-amd64 #1 SMP Fri Sep 9 21:03:29 UTC 2011 x86_64 GNU/Linux
>
> # iptables --version
> iptables v1.4.12
>
> Libs installed:
> # dpkg -l | grep nfnet
> libnfnetlink-dev 1.0.0-1 Development files for libnfnetlink0
> libnfnetlink0 1.0.0-1 Netfilter netlink library
> # dpkg -l | grep queue
> libnetfilter-queue-dev 0.0.17-1 Development files for libnetfilter-queue1
> libnetfilter-queue1 0.0.17-1 Netfilter netlink-queue library
>
> NFQUEUE definition in iptables script:
> iptables -A INPUT -p all -j NFQUEUE --queue-num 4712
>
> App output:
> opening library handle
> binding nfnetlink_queue as nf_queue handler for AF_INET
> error during nfq_bind_pf()
>
>
> Thx
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
>


