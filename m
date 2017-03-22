From: Andreas Schultz <aschultz@tpip.net>
Subject: Re: nftables: vmaps and atomic update
Date: Wed, 22 Mar 2017 09:58:32 +0100 (CET)
Message-ID: <1684649016.477817.1490173112759.JavaMail.zimbra@tpip.net>
References: <748570280.473727.1490115228816.JavaMail.zimbra@tpip.net> <990b6f2b-ad63-6e79-b9fd-41a662034850@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <990b6f2b-ad63-6e79-b9fd-41a662034850@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Robert White <rwhite@pobox.com>
Cc: netfilter <netfilter@vger.kernel.org>

Hi Robert,

Thanks for you effort.

----- On Mar 21, 2017, at 8:36 PM, Robert White rwhite@pobox.com wrote:

> On 03/21/17 16:53, Andreas Schultz wrote:
>>     delete element ip filter client_to_any { 10.180.86.22 : goto CIn_1 }
>>     delete chain ip filter CIn_1
> 
> I've verified that the problem is repeatable and that the two commands
> work separately. The problem also exists for jump verdicts.

The problem is actually even greater. If you use something like this:

    table ip filter {
	chain FORWARD {
		type filter hook forward priority 0; policy accept;
		goto CIn_1 # handle 6
	}

	chain CIn_1 {
	}
    }

Then attempting to apply a atomic update like this:

    delete rule ip filter FORWARD handle 6
    delete chain ip filter CIn_1

fails with the same error:

# nft -f del-1.nft 
del-1.nft:2:1-29: Error: Could not process rule: Device or resource busy
delete chain ip filter CIn_1
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

So, atomic update *ONLY* works with a "flush ruleset" followed loading all
the rules from scratch.

Andreas

> I'd suspect that there's a strict ordering that makes "the chain work
> happen first". For most cases this would make sense. Since the sets and
> the chains are owned by different parts of the kernel (the two set types
> are in kernel modules, so must be distinct from the chain handling)
> there are probably limits on the degree of atomic modification. (e.g. I
> think the sets and maps internal consistency logic _must_ be separate.)
> 
> The two commands work separately, so once the set element is gone the
> chain is just noise. So I'd rate it as annoying but probably non-trivial
> to fix.
> 
> I'd open a bug at the bug tracker site (https://bugzilla.netfilter.org/)
> and meanwhile do the chain drop separately after the set/map command.
> 
> As a cheesy workaround for scripting, you can use a here document (etc.)
> redirected into "nft -i" to do fast sequential changes.
> 
> So
> 
> nft -i <<'EOT'
> delete element ip filter client_to_any { 10.180.86.22 : goto CIn_1 }
> delete chain ip filter CIn_1
> EOT
> 
> 
> --Rob.
> 
> P.S. I'm just some guy, not a core developer or anything. I just thought
> I'd toss in a few seconds of problem analysis. 8-)
