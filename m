From: Benno <b.ohnsorg@freenet.de>
Subject: Re: nft numeric output translates tcp flags rule so it cannot be
 loaded again
Date: Sat, 23 Oct 2021 07:42:50 +0200
Message-ID: <35991a1e-7dd6-3677-b3c0-6af2c6b62ce7@freenet.de>
References: <b02e9c0a-281d-02d1-d876-b0b997b6d8c2@freenet.de>
 <YXLWuHabUtY9wKXq@salvia> <9d7cf59f-eb61-5914-cbd5-83e5dd053684@freenet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=freenet.de;
         s=mjaymdexmjqk; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
        MIME-Version:Date:Message-ID:References:Cc:To:From:Subject:Sender:Reply-To:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=Lf4dlNFAXqNkutvBM/QYtRvSrfThq6eYnxibwg64ffM=; b=KIATZuSa2v4vhGFNCZY3kLXVFx
        UGYIVNJU4r/TUtKi/8VfCLIZmdgTZCqXtzlE9OLsvTy198rA3oHQnQJY8zMwa+mDqPbj9Ea8v4oJf
        SBb/o4ACnUhz8Mu0IzECfS/88W/xaAhvGMJ4MKOJfS0vwm8Gn+1/qklbReAUKIefMnRGrIOmTzdFb
        UMiBPiKf9pPcl0Mqm8i5coBvBNyoTuynPzVLDOVStdAUZJBSw2GZkRIGmt09DYnbClu9r4NzbUe+M
        uKIj6WpY8rzfSMKu2v4AwpdNbSCgQEOXQhX55TKgNl+xpTo6tJN4ql62M8ynSiyCNmCWt11rvDnTc
        X4 
In-Reply-To: <9d7cf59f-eb61-5914-cbd5-83e5dd053684@freenet.de>
Content-Language: de-DE
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

>> […]
> And instead of numeric variant of 0.9.9 which was
> 
> tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes 0 drop
> 
> it looks now different with 1.0:
> 
> tcp flags != 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8 counter packets 0 bytes
> 0 drop
> 
> […]
> 
> It'd be great if you could explain the effects of the subtle change of
> the rule. Since I'd like to use nftables to be verbose/ easier to
> maintain. Both numeric variants look complicated to the untrained eye.
> 
> I can match the different string tcp flags to their numeric values. But
> I'm unable to get the difference between tcp flags 0x2 and tcp flags !=
> 0x2… It looks like a not-equal-operator that clearly lacks in the 0.9.9
> variant. Is it because of polish notation/ operator first?
> 
I've been through the documentation and found only a single occurence of
the expression with no explanation.

*
https://wiki.nftables.org/wiki-nftables/index.php/Matching_packet_headers#Matching_TCP.2FUDP.2FUDPlite_traffic
– the only occurrence
* https://www.netfilter.org/projects/nftables/manpage.html – man page
does not list round braces (except for side notes or additions)
* https://wiki.nftables.org/wiki-nftables/index.php/Sets – sets use
curly braces instead
* https://wiki.nftables.org/wiki-nftables/index.php/Verdict_Maps_(vmaps)
– like maps, also curly
*
https://wiki.nftables.org/wiki-nftables/index.php/Quick_reference-nftables_in_10_minutes
– quick reference also lacks a sample (despite the widespread use of
such a rule/ expression)

Would it be correct to call the sub expression

( syn | ack )

combination? Would it be more precise to name it binary combination?
Deducing from the sample (syn | ack) merges all the bits set into a sort
of bit mask that is used for comparison? Why is it necessary then to
preceed the binary combination with an '&'? What is the second operator
if the binary combination is followed by not equal to syn? Is it the
header value? Do I fix my explanation by labelling tcp flags the left
hand side of the bit mask operation and the binary combination right
hand side? Is it interpreted correctly if described as:

1. create bitmask from OR-ing syn 0x02 and ack 0x10
2. flag value of header must match the bitmask exactly (preceeding &)
3. must evaluate to true applying comparison operator and bit mask right
of it

What other prefixes to a combination are valid except &? I tried ! ( syn
| fin ) != syn which failed at the != operator. But | ( syn | fin ) !=
syn works and nft -c accepts this. I didn't try it out with traffic.
Also accepted by nft -c:

# binary combination should evalute to 0x00 -> always true
tcp flags & (fin & syn & ack) != syn ct state new counter drop

# binary combination should evaluate to 0x00, too -> always true
tcp flags & (fin & (syn | ack)) != syn ct state new counter drop

# get a little bit crazy and have a binary combination on both sides
# and use literal greater than instead of >
tcp flags & (fin & (syn | ack)) gt (syn | fin) ct state new counter drop

I'd appreciate if this would be added to the wiki. I'd say a short on
the example and link in the 10min-guide? (Not every firewall maintainer
knows about syntax trees or is fond of de Morgan.)

Just for the records/ side notes:

I also had no success using nft describe. It complained about syntax
errors in too many occasions. For example

nft describe "add rule ip { tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state
0x8 counter packets 0 bytes 0 drop }"

yields

Error: syntax error, unexpected add
describe add rule ip { tcp flags 0x2 / 0x1,0x2,0x4,0x10 ct state 0x8
counter packets 0 bytes 0 drop }
         ^^^

If it weren't explicitely binary expressions one could take the detour
through POSIX syntax[1]. The vertical bar is interpreted as
»arguments…mutually exclusive«. And ellipses »denote […] one or more
occurrences«.

[1] https://pubs.opengroup.org/onlinepubs/9699919799/basedefs/V1_chap12.html
