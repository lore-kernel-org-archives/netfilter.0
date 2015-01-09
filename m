From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: Stateless NAT with iptables
Date: Fri, 9 Jan 2015 21:53:41 +0100
Message-ID: <CAKfDRXg33kvVEMRJBsbU=sHF3LZm_SjVcQh=_E7ybvrdpYOKnw@mail.gmail.com>
References: <SNT152-W84CAD14ACDD2F149C65D88B8440@phx.gbl>
	<CAKfDRXgQJ8zkyBjdyhLFCgpV7z7yiR497G7XOTubM5y2rYxDMg@mail.gmail.com>
	<SNT152-W8102200148E4B5EE0CE5B8B8440@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=voyGHBPADYOvfUPKkN/lsz5av0vP95Od/eFD29gYMew=;
        b=CZJIBal61Ao/6diBZze7ntU97KHh6mUce7+OaFKSaN1oE7tcLF8A0lpIqr5sLHcfaX
         5+prN12/UazyPmZ6iQUSTG8T8qbgPO1mtQIQRsoWMd02rqsCiyRQNnzorfwFbJCI2kGR
         uarhRHIvtlrF3eOIc52Z97oyjh0tGaUb+P4wd2IKZiFJLucFUKwAX3stQ740KT+Z1Eru
         L/eX2YI5SZK/RyMMYmilA9t9d70Eghy7DBG0ZfJsoX391SQU7nQQxQWTuU+kSRdBYTGB
         XA17PX5wpcDqb9V1f4jt5KE7RlyH8DT+rCqHjfCVe5jmVmKtgX9vm4SGUyPJ4pTvnEkX
         utZw==
In-Reply-To: <SNT152-W8102200148E4B5EE0CE5B8B8440@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Glen Miner <shaggie76@hotmail.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,

On Fri, Jan 9, 2015 at 9:32 PM, Glen Miner <shaggie76@hotmail.com> wrote:
> I've fiddled around with RAWDNAT but from what I can tell it doesn't support --to addr:port (just addr) like regular DNAT. Thank you for pointing it out the xtables-addons package to me, though.

Ah, yes, that is true, forgot about that. However, patching RAWDNAT to
support this should be too much work. You can probably copy most of
the code from DNAT.

-Kristian
