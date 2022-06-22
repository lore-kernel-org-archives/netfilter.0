From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: ABI Breakage - nftnl_rule_parse_attr_cb
Date: Wed, 22 Jun 2022 09:36:43 +0200
Message-ID: <YrLGi2k9+PvMJepi@salvia>
References: <fb274774-b42e-fce8-7018-2c21a93a4d38@vt.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <fb274774-b42e-fce8-7018-2c21a93a4d38@vt.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Kiernan George <kbg98@vt.edu>
Cc: netfilter@vger.kernel.org

On Tue, Jun 21, 2022 at 08:07:24PM +0000, Kiernan George wrote:
> Hi,
> 
> I am getting an ABI breakage error at these lines in rule.c:
> 
> case NFTA_RULE_HANDLE:
>         if (mnl_attr_validate(attr, MNL_TYPE_U64) < 0)
>             abi_breakage();
>         break;
> 
> It only seems to happen when I set the flag NLM_F_ECHO in
> nftnl_rule_nlmsg_build_hdr. I want to hold onto the rule handle of the
> returned rule, which is why I set it to echo. This error was not affecting
> me in Ubuntu 20.04, but started as soon as I upgraded to 22.04. I am running
> Linux kernel version 5.15.0-39-generic with libnftnl-dev version
> 1.2.1-1build1.

That's very strange. Could you post a sample code?
