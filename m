From: Nick Howitt <nick@howitts.co.uk>
Subject: Re: Problem with ipset and --in-interface
Date: Mon, 27 Mar 2017 19:53:54 +0100
Message-ID: <58a5ce32-1340-0d3f-666a-fc54519cf448@howitts.co.uk>
References: <237f8db1-1a60-c97f-f965-8ed363860731@howitts.co.uk>
 <f22d3b15-a879-0147-a339-a31ebf413363@pobox.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 28E88409E692
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490640837;
        bh=m1wOylldgcII9NjaWk9QEC+EAQgOxF+foHI2/fOt1Z4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=cExbWqVbm8pS393N2oHEXtsCTtLmV5MG4++1YdKoZWVhVXl0spCHMzygTDAdaIuAk
         T93X14MLBMjzrC25Dn29dLmieXg4yF5c8qPx+9p8e25nNXaD+6steuGHT4sE9aFrtq
         1Fk2t4skjcP1iN6MJsBnoVTyEQylJ9VSOUZdKSHQyzsururRadwXKrT6sJxntB61nX
         KgvD+ZlYhcgYK5ZV7b3TcHycb5kahYCtAIFJzs8+n0k+VOiBVcCxsevZAFLVrmnA9t
         bjOB0LVLA2V4ajdLnRlPWPM8SJa1IC7k/h6uHVX3/tNsM3K+mIKwZD5rfgNX1ATRpU
         NDyZvr0y80mEQ==
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 8A402409E695
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490640834;
        bh=m1wOylldgcII9NjaWk9QEC+EAQgOxF+foHI2/fOt1Z4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=vTF/xYlNV26E2T4jM4x/eI0dtxmXr/z8vTp31i1qQ0zosFynUKW8X829AU/HuafqG
         hOAlcyVxFTUAqFuUUYft5hQBRscij7IQtYl/P4oRzJL27j6aIeoctM2yJFgakNspWv
         inx/eOkwoHFnZjpgfH6DGK81oNnKLqw2CLv3RU5+Ay9yehz99aP3USvNLESZ/nvhCc
         9OxqcYR9hzpM3R5G5+QAXwZH06aA1RO02O7TCeJOmDm+jGNG3WD+F/NC0MsTHrtZyx
         VdmS+i7mxpuYSmgZW+V7pbyNpKOZwdMpFomsahiILWdY5zLtFhqH9NwslP4gKGleTJ
         XYIgZEKxY1oag==
DKIM-Filter: OpenDKIM Filter v2.10.3 mailserver.howitts.co.uk 56441409E691
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=howitts.co.uk;
        s=201703; t=1490640834;
        bh=m1wOylldgcII9NjaWk9QEC+EAQgOxF+foHI2/fOt1Z4=;
        h=Subject:To:References:From:Date:In-Reply-To:From;
        b=vTF/xYlNV26E2T4jM4x/eI0dtxmXr/z8vTp31i1qQ0zosFynUKW8X829AU/HuafqG
         hOAlcyVxFTUAqFuUUYft5hQBRscij7IQtYl/P4oRzJL27j6aIeoctM2yJFgakNspWv
         inx/eOkwoHFnZjpgfH6DGK81oNnKLqw2CLv3RU5+Ay9yehz99aP3USvNLESZ/nvhCc
         9OxqcYR9hzpM3R5G5+QAXwZH06aA1RO02O7TCeJOmDm+jGNG3WD+F/NC0MsTHrtZyx
         VdmS+i7mxpuYSmgZW+V7pbyNpKOZwdMpFomsahiILWdY5zLtFhqH9NwslP4gKGleTJ
         XYIgZEKxY1oag==
In-Reply-To: <f22d3b15-a879-0147-a339-a31ebf413363@pobox.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robert White <rwhite@pobox.com>, netfilter@vger.kernel.org

OK I feel a prat but you've pointed out the error. "s" and not "S". I 
could not see the wood from the trees.

FWIW, the Shields Up test is an external port scanner at grc.com. It is 
not fully functional in that it only scans tcp and always tries to give 
a fail if it can ping you.

Regards,

Nick

On 27/03/2017 19:29, Robert White wrote:
> On 03/26/17 08:06, Nick Howitt wrote:
>> I have the following rule in my iptables:
>>
>> iptables -w -I INPUT -i enp2S0 -m set --match-set country-list src -p
>> tcp -m multiport ! --dports 25,80,443 -m state --state NEW -j DROP
>>
>> but I've noticed it is not blocking. I tried checking using GRC's
>> Shields Up test scanning port 993. If instead, I do:
>>
>> iptables -w -I INPUT -m set --match-set country-list src -p tcp -m
>> multiport ! --dports 25,80,443 -m state --state NEW -j DROP.
>>
> There's nowhere near enough information in that post. In particular,
> where are you running the "shileds up" test? If it's not coming from
> another computer on the enp2S0 adapter then it would, of course, not hit
> this rule for not arriving on that adapter.
>
> Now my suspicion is that upper-case letter "S". The default naming
> scheme uses lower case letters. The name match is not checked at install
> time because it's a wildcard enabled text match. So for instance I can
> paste that command line in on my host:
>
> iptables --append FORWARD -i blarg -j DROP
>
> and it will go into my rule set just fine even though I don't have an
> interface named "blarg". The rule will simply hang out, doing nothing,
> until I rename an interface to "blarg".
>
> So I'd guess that you need to double-check that argument for correctness.
>
> The rule isn't matching because the interface name doesn't match.
>
> --Rob.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

