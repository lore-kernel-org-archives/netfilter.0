From: Robert White <rwhite@pobox.com>
Subject: Re: nftables: vmaps and atomic update
Date: Tue, 21 Mar 2017 19:36:27 +0000
Message-ID: <990b6f2b-ad63-6e79-b9fd-41a662034850@pobox.com>
References: <748570280.473727.1490115228816.JavaMail.zimbra@tpip.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <748570280.473727.1490115228816.JavaMail.zimbra@tpip.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andreas Schultz <aschultz@tpip.net>, netfilter@vger.kernel.org

On 03/21/17 16:53, Andreas Schultz wrote:
>     delete element ip filter client_to_any { 10.180.86.22 : goto CIn_1 }
>     delete chain ip filter CIn_1

I've verified that the problem is repeatable and that the two commands 
work separately. The problem also exists for jump verdicts.

I'd suspect that there's a strict ordering that makes "the chain work 
happen first". For most cases this would make sense. Since the sets and 
the chains are owned by different parts of the kernel (the two set types 
are in kernel modules, so must be distinct from the chain handling) 
there are probably limits on the degree of atomic modification. (e.g. I 
think the sets and maps internal consistency logic _must_ be separate.)

The two commands work separately, so once the set element is gone the 
chain is just noise. So I'd rate it as annoying but probably non-trivial 
to fix.

I'd open a bug at the bug tracker site (https://bugzilla.netfilter.org/) 
and meanwhile do the chain drop separately after the set/map command.

As a cheesy workaround for scripting, you can use a here document (etc.) 
redirected into "nft -i" to do fast sequential changes.

So

nft -i <<'EOT'
delete element ip filter client_to_any { 10.180.86.22 : goto CIn_1 }
delete chain ip filter CIn_1
EOT


--Rob.

P.S. I'm just some guy, not a core developer or anything. I just thought 
I'd toss in a few seconds of problem analysis. 8-)
