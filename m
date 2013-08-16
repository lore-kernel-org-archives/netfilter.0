From: Kristian Evensen <kristian.evensen@gmail.com>
Subject: Re: MASQUERADE/SNAT and multiple interfaces with the same IP
Date: Fri, 16 Aug 2013 13:23:31 +0200
Message-ID: <CAKfDRXjqm-7q_2g=KZPCQj2bSU+Th_p3zjXPQvhsaxXOMK2+rw@mail.gmail.com>
References: <CAKfDRXjXkY--PjXAa1m=As+Vf_1__WBokkTAE5BHg+gxsM9Yxw@mail.gmail.com>
	<20130816110443.GB5154@breakpoint.cc>
	<CAKfDRXgNtPgQjtrSL=oVkws6GB_sTv+h+-_GLVvVvpWoEHBRnw@mail.gmail.com>
	<20130816111826.GC5154@breakpoint.cc>
Mime-Version: 1.0
Return-path: <netdev-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type;
        bh=xNEdjKrYuFTwsRWkxtuV0qBk1peOIxtVdVmLTGeFAPs=;
        b=Qn02HJB/iRF/RFeG7/MxAusnz5mqSf74ZOCcikBrM8kOJjFKmz7dMDP16YMF7yGoKi
         Oe9e7W1mdQ06InSju2n+GIOqO+DxT/n+IftFyKTFO3bUcy0/eqz1nZmcaGrK/sf56ajH
         oyrRU08ffRwUDaEIE6g0+IyvLI79gO6NaPJ8nHwuS7BmnCqnyZMf3q3cH3wUfMUlyLZe
         YZq0oQvhS+T5t0xQpHiQRg329/xI+p5lsonWKW9tAwmQpi6+iz81T/r8lZ1EWVWDRk3h
         Yl7TkXVDjP2H3HcbBuIoePiEgJUtIeqN6src5P+2ZFCiEWLLzXgVJURf9FXSVxcTobCH
         5xpA==
In-Reply-To: <20130816111826.GC5154@breakpoint.cc>
Sender: netdev-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Florian Westphal <fw@strlen.de>
Cc: netfilter@vger.kernel.org, netdev@vger.kernel.org

On Fri, Aug 16, 2013 at 1:18 PM, Florian Westphal <fw@strlen.de> wrote:
>> Does this mean that even when using SNAT, the old mapping is deleted
>> and a new created?
>
> No.

Thank you very much for the help, I see now that I was a little bit
too fast and missed a detail in nf_nat_oif_changed(). If anyone ever
stumbles across the question in the future: SNAT does not set
masq_index and, thus, nf_nat_oif_changed() will always return false.

Have a nice weekend!

-Kristian
