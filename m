From: Stephen Smoogen <smoogen@lanl.gov>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 11:31:00 -0600 (MDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0407181124380.25525@smoogen3.lanl.gov>
References: <ef83df6b040718033163810a15@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <ef83df6b040718033163810a15@mail.gmail.com>
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
To: John <futurasci@gmail.com>
Cc: netfilter@lists.netfilter.org

On Sun, 18 Jul 2004, John wrote:

>Hi,
>
>When I run the command
>
>grep ^tcp /proc/net/ip_conntrack | awk '{print $4}' | sort | uniq -c
>
>I get these lines ...
>
>    26 CLOSE
>    11 CLOSE_WAIT
>   883 ESTABLISHED
>    57 FIN_WAIT
>    34 SYN_RECV
>   116 SYN_SENT
> 23720 TIME_WAIT
>
>the TIME_WAIT number seems very strange ... network interrupts
>increased a lot three months ago and I couldn't find an explanation
>for this. The number of our visitors didn't increased like this ...

What modules are loaded into the kernel? There is a bug in the Red Hat 
7.x/8.0/9 kernels from a patch that Alan Cox had in his patchset long 
ago and should have been updated. The bug causes connections to sit 
in slabinfo forever and not get cleaned out from the conntrack module. I 
think I tracked it down to the conntrack_ftp but it could have been 
generic. 

The best bet on a 7.x/8 machine is to download and compile the latest
2.4.x kernel and possibly add POM items if you need them. On a 9 system
it would be better to upgrade to Fedora 1(or 2) as the 2.6 backported
code is a pain to get around. I found that for the 7.x series a stock 
kernel 2.4.24 kernel worked great because a lot of the patches Red Hat 
had incorporated into theirs was now in the mainline. 

Hope this helps.



-- 
Stephen John Smoogen		smoogen@lanl.gov
Los Alamos National Lab  CCN-5 Sched 5/40  PH: 4-0645
Ta-03 SM-1498 MailStop B255 DP 10S  Los Alamos, NM 87545
-- "We cannot have a free government without elections; and if the
-- rebellion could force us to forgo, or postpone, a national election,
-- it might fairly claim to have already conquered us." Abraham Lincoln

