From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Validating this is the right conntrack ruleset
Date: Mon, 6 Jun 2022 16:30:48 +0100
Message-ID: <20220606163048.de7ca3450ec3048fb9c3e3ba@plushkava.net>
References: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1654529451; x=
        1654615851; bh=mYgfu4JLp4BJi2ngpAL2Wbu88JWkd5ufMsdq4Gfitog=; b=a
        Eg0meZbhIV2O/I+DlnvMlj1VtPhloPhmLkeQy72WA1747OGH1VHaUe3BRVkKyXhM
        4KPw/2+P/liH+oyCp7faAbRa2rDxD2Gjh0+SIDAGXO8Nwrah1LJ6TcOFTOlgqtFz
        NzXPwJTU6ooV4IKYLEy5VGnOasUkDwSpr835x+tCwF/65GoGDhiCq+9ZpS/GQ6D6
        f4D1X74MKtZB01mvrPG6LMRAJ0tBvrLW3rDOQhjUVNg/Yozd2Y18uX9qQQYosPFl
        Z2+rd008ZjsT2uvdmr5aFyEzUaKR1y6oM9/RaEXTatjCAOCsJJ6ZNe/9sgwjndoY
        uJ2P03AwiAzeUDFvw0uyQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654529451; x=
        1654615851; bh=mYgfu4JLp4BJi2ngpAL2Wbu88JWkd5ufMsdq4Gfitog=; b=U
        OQgxjVtFerJ9095K3crN+tA0lb9I0v0h9w2GcGkKGevp+AocBzwMHP0hg4I6vqfZ
        pEYSXtgMLvj8RRsH0brLGsWKBV6iLA5zEa4ZispaYDJMiC8Tf+Mim3r5xYq9EunP
        H0ZF8mAx8fABW82IvK1y9tmPmW3MERhSFLNRRdMqZ5WeyEQpT+ZG736tY+pICjP4
        o+eKhIkTOmt1EfsOWWaEuCEZsbeiz9ez4BmYzu2g2s59hC6LbESqizMW9FaEP0Df
        ydORC6JC0ToT80y7zbfnbOmePwmDZE29BZtcaaXbfKJ0aNX00hBAQ3PjfF00iWMh
        /UAUf9wRXhe9hbXjVo4MA==
In-Reply-To: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

On Mon, 6 Jun 2022 09:48:23 -0400
Gio <gioflux@gmail.com> wrote:

> I need some help understanding the proper way to do conntrack
> bidirectionally in a secure way. Could someone help validate my
> understanding and indicate if the below ruleset and approach is
> correct?
> 
> My goal is to allow incoming connections to tcp/80 (input hook) and
> all response traffic (output hook) without blindly allowing more ports
> than intended for this one service running on tcp/80.
> 
> table ip legacy {
>         chain root_out {
>                 type filter hook output priority filter; policy drop;
>                 tcp sport 80 ct state established,related accept
>         }
> 
>         chain root_in {
>                 type filter hook input priority filter; policy drop;
>                 tcp dport 80 accept
>         }
> }
> 
> I have seen other firewall examples where the input chain just blindly
> allows all reply packets via 'ct state established,related accept'
> like so :
> 
>         chain root_in {
>                 type filter hook input priority filter; policy drop;
>                 ct state established,related
>                 tcp dport 80 accept
>         }
> 
> I am not sure if my first example is correct and secure; should 'ct
> state established,related accept' always be in the input hook for
> response packets or only needs to be in the output hook?

I would describe your example as neither correct nor secure. For one thing, both chains would impede traffic traversing "lo", which is normally inadvisable. For another, the rule in the root_in chain does not match on the ctstate, despite being the ruleset being of a stateful design. For instance, you probably don't intend for your rule to match packets in the "invalid" state, but it would. Here is a sample ruleset that might prove instructive.

table inet legacy {
    chain root_in {
        type filter hook input priority filter; policy drop;
        ct state established,related accept
        iifname "lo" accept
        meta l4proto ipv6-icmp accept
        tcp dport 80 fib daddr type local ctstate new accept
    }
}

Note the use of the inet family so as not to inadvertently leave things wide open in the case of IPv6. The conntrack state machine already does a good job of matching essential ICMPv4 packets pertaining to a TCP flow against the "related" ctstate. Filtering ICMPv6 in such a way that does not result in breakage is comparatively difficult, hence the blanket rule there. The fib check will ensure that the destination IP address was specified as one that is actually assigned to your host. The use of "ctstate new" should be self-explanatory. If you set the "net.netfilter.nf_conntrack_tcp_loose" sysctl to a value of "0", it will behave even more strictly in that a packet that would result in a new TCP flow (from the perspective of conntrack) must have only the SYN flag set.

I would advise against hooking output with a drop policy, unless you have a concrete reason to do so. In the event that you do, the "root_out" chain could share some of the characteristics of the "root_in" chain, such as allowing established/related to pass, as well as packets traversing the lo interface. You would not then require any counterpart for the tcp dport 80 rule. However, you would need to consider other matters, such as allowing for the passage of packets destined to nameservers and those required for your package manager to function, to name a few.

-- 
Kerin Millar
