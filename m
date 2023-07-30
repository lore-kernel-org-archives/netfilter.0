From: Kerin Millar <kfm@plushkava.net>
Subject: Re: converting iptables/ip6tables to efficient nftables rules
Date: Sun, 30 Jul 2023 22:14:47 +0100
Message-ID: <20230730221447.af1b866bdddfe794be4d9b47@plushkava.net>
References: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm1; t=1690751689; x=1690838089; bh=bfE2OL8qVVBmdqxk0PSauRtiS
        co+4rCbDVknxjeNWsM=; b=QOuxebo67t/334EfoERz7Yz8/9+lu5P7d2PPEU78x
        jSo97VdwBRA0HBgR667ofMv86tKKGi8qodLKljCpdG6QsPOIHwrNyR73/2/jHOyE
        z6cHaTi1jePomPrCfA0ArkOOW94bXfTDUsBF4VxP4+3LoWQxBb0UEPFbqHVgE5Wm
        AjqrrU8MB8xPTWkDxuD5pWQaiamLc1Wm8m/VOv28CCzvWBnb9OmzneuYLFf9dCsP
        ZBTObHBqwU9HkXg1n+sZuL9I1mLj5Vkb/2/HH6P0DszEPGH9yvbaVl+tBKPAox9t
        PZsE60ufQn2xjwP/4thdtRqcLWHdtfHpXBAXtCfvTD18g==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=
        1690751689; x=1690838089; bh=bfE2OL8qVVBmdqxk0PSauRtiSco+4rCbDVk
        nxjeNWsM=; b=l8tV8PAGHrzGJQCQD4VsV6PRNQOkS6Jk/yYeVuIeQkmrE2AE5AL
        Mrl8SHB/r3K8peVcoUHBn/84+9i3lRFCZ5xw/OYvpwkpjIw5GOmV57IlouQ9wcz+
        +DLjC2LuIxpS/JVsFbTU/siWEpTJHh0ejm3EB0dPMzGkTkfjwBymcF9t9yGm4dKx
        NDvOnbVRP6k6mQ3OXWOsDbUBcCGfHzkZTwWv6tNbWsdZ2IKCkelHnoU0o0aWgPx9
        mwsOO3G0QzQSRJshl2pdrQzKfXfg15Thg8BQ9EkOUaDyYmn8gtWiM6p/GxY2xIXP
        8j35SET81XaeH5eOot59coyeozGq+mPO4Fw==
In-Reply-To: <924b35f-bda5-6ae5-efe-d05a8de7aec@ndsu.edu>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Tim Mooney <Tim.Mooney@ndsu.edu>
Cc: netfilter@vger.kernel.org

On Sun, 30 Jul 2023 15:30:14 -0500 (CDT)
Tim Mooney <Tim.Mooney@ndsu.edu> wrote:

> 
> All-
> 
> I haven't been able to find anywhere in the nftables wiki that talks
> about "Dos and Don'ts" from an efficiency perspective, especially for
> people that may be coming from iptables/ip6tables to nftables.  If it's
> there and I've missed it, please point me at it.
> 
> I have a mix of 32 iptables and ip6tables rules on a RHEL 7 box that I
> want to convert to nftables for RHEL 9 (kernel 5.14.0 + Red Hat vendor
> sauce, nftables 1.0.4).
> 
> The obvious thing to do would be to just directly translate each rule to
> nftables, and have 32 nftables rules.
> 
> However, the iptables rules are all pairs of
> 
>  	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 80 -j ACCEPT
>  	-A ports_allow -p tcp -m tcp -s X.Y.0.0/16 --dport 443 -j ACCEPT
> 
>  	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 80 -j ACCEPT
>  	-A ports_allow -p tcp -m tcp -s A.B.C.D/32 --dport 443 -j ACCEPT
> 
> So I could cut the number of ntables rules in half just by using
> 
>  	dport { 80, 443 }
> 
> in the translated rule.
> 
> The question is, *is it more efficient*, from a packet processing
> perspective, to do that?  My guess is that it is, but can anyone with
> expertise confirm?  If it is more efficient, what type of efficiency
> improvement are we talking about, roughly?

# nft -d netlink -c -f - <<<'table ip t { chain c { ip saddr 10.0.0.0/16 tcp dport { 80, 443 } accept; }; }'
ip (null) (null) use 0
__set%d t 3 size 2
__set%d t 0
	element 00005000  : 0 [end]	element 0000bb01  : 0 [end]
ip t c
  [ payload load 2b @ network header + 12 => reg 1 ]
  [ cmp eq reg 1 0x0000000a ]
  [ meta load l4proto => reg 1 ]
  [ cmp eq reg 1 0x00000006 ]
  [ payload load 2b @ transport header + 2 => reg 1 ]
  [ lookup reg 1 set __set%d ]
  [ immediate reg 0 accept ]

Unsurprisingly, repeating the rule can be shown to demonstrate twice the number of instructions. You may find it difficult to measure the difference, however.

> 
> Similarly, all of the rules list CIDR ranges or individual IPs, though
> there are a mix of IPv4 and IPv6 ranges.  I therefore could greatly reduce
> the number of rules by creating a couple of named sets, one for IPv4 and
> one for IPv6, and match the 'ip saddr' against the sets.

You are definitely on the right track. Maps and/or verdict maps incorporating concatenations of the form "ipv4_addr . inet_service" and "ipv6_addr . inet_service" might also prove useful, depending on your exact requirements.

-- 
Kerin Millar
