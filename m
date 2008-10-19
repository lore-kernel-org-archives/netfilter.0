From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's network
Date: Sun, 19 Oct 2008 17:41:07 +0200
Message-ID: <1814bfe70810190841l1df5d3f7na0cd37ef076f9639@mail.gmail.com>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
	 <slrngfdqhi.3bf.petr.pisar@album.ics.muni.cz>
	 <48F8CF4F.3010704@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=IREFKY1tQGf2M9crf+u80zq12chvvtI4WXgDp3QRI2A=;
        b=tWqY5gb6N8C7PzRIiTK0CFdcRhJHtnoclC8BiTKiIv9kNy3pIAZB22R+7iF+Z9e0KV
         o1fOu8cJqZ5N8SkvrxptPDq/2BgQuFKWu3nZAfnFR2PAuN01jqm3FEK3L4h5u85pWe43
         FCY2Bt2Q1Hh3uHwDrX0UpdktqTkbtp6EoS13I=
In-Reply-To: <48F8CF4F.3010704@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi all,

thank you for this constructive answers, they will help me a lot, with
this gatewaying/translation/whatever in my network. I think now I have
good basic to start working on it. Once I made it I promise I will
document all and send to this mailing list.

Kind regards ant thank you

Elvir Kuric

On Fri, Oct 17, 2008 at 7:45 PM, Grant Taylor <gtaylor@riverviewtech.net> wrote:
> On 10/16/08 02:16, Petr Pisar wrote:
>>
>> `Translating' is not proper word unless you mean real NAT-PT (Network
>> address translation and protocol translation).
>
> I was going to use the term "gatewaying" to describe what needed to be done
> between the IPv6 and the IPv4 protocols.  "Translating" is usually done
> /with in/ a single protocol and "gatewaying" is usually done /between/ two
> protocols.  At least that's my take on it.
>
>> If you want just to connect your IPv6 island via IPv4 Internet to native
>> IPv6 Internet backbone (i.e. bypass your lazy ISP), use 6to4 (in case you
>> have public IPv4 address on your gateway) or AYIYA (in other case). This is
>> called tunneling and former post enlightened it already.
>
> *nod*
>
>> If you want to be able to connect from your IPv6 host to IPv4 only servers
>> in IPv4 Internet, you have to choices:
>>
>> Provide to all IPv6 hosts IPv4 connectivity (i.e. dual stack solution), or
>> do NAT-PT on your gateway.
>
> I think the OP is wanting to avoid dual stack despite this probably being
> the simpler of the options.
>
>> NAT-PT translates one protocol family into other one. However due to some
>> differences between these two protocols, the translation is not seamless
>> (like IPv4 NAPT). Thus there exist few limitations and different solutions
>> how to achieve it.
>>
>> I know only about RFC3142 (An IPv6-to-IPv4 Transport Relay Translator)
>> implementation and it's pTRTd <http://www.litech.org/ptrtd/> and totd
>> (http://www.vermicelli.pasta.cs.uit.no/software/totd.html). It works
>> following:
>>
>> IPv6 only client asks totd name server for AAAA record of IPv4 only host.
>> The name server provides fake answer resolving to network prefix routed to
>> pTRTd server. Then your client sends IPv6 TCP or UDP packet to given fake
>> IPv6 address, the packet recieves pTRTd server (a userspace daemon capturing
>> packets on TUN network interface), pTRTd established mapping between IPv6
>> and IPv4 transport addresses, translates the packet into IPv4 protocol and
>> transmits it to the real IPv4 only host in IPv4 Internet. Of course the
>> pTRTd processes returing responses and forward them to your IPv6 client as
>> IPv6 packets.
>>
>> Thus your IPv6 only hosts can see whole IPv4 world as a subnet in IPv6
>> address space.
>
> Very interesting!
>
> I now have a reason to mess with IPv6.
>
>
>
> Grant. . . .
>
>
> P.S.  Very good reply.  I was going to try to sum up the bit about
> translation verses gatewaying, but I think you did a better job than I could
> have.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
