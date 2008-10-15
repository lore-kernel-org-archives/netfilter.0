From: "Elvir Kuric" <omasnjak@gmail.com>
Subject: Re: Transfer ipv6 packages over ipv4 iptables gateway to ipv4 ISP's network
Date: Wed, 15 Oct 2008 22:58:36 +0200
Message-ID: <1814bfe70810151358m15638a00k55ca230c40f78534@mail.gmail.com>
References: <1814bfe70810151332r61aa900see2931df5dddcdb0@mail.gmail.com>
	 <48F65657.1010200@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from:to
         :subject:cc:in-reply-to:mime-version:content-type
         :content-transfer-encoding:content-disposition:references;
        bh=3dPckRQZGhOS/K2Ipu+U8TiFKz9Nja5nKuit02iPGfA=;
        b=JxTEsJTzDGK0YMXPZeV/8KCSaNCKkqxO4sP++wmzBi9vRaGvH2aSn5dbM4vZnCMuPZ
         7k7Vjr9/XTcmgBDBXb6ucpyeT8ZQvvjCNovBj3jTG879a+DyGDhyB2Up5/7rV/F+ZJqx
         APp7jlQJ9+wY/JCKJTWIe47avqkWcNwPB0Zeo=
In-Reply-To: <48F65657.1010200@riverviewtech.net>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

Hi,

thank you for mail, actually I know there must me some way to include
an IPv6 island to IPv4.

|------IPv6------|-------| gw/iptables|--------IPv4 (ISP)

I just need a hint how to implement translation on my gateway when I
have on internal interface IPv6 address and on external interface IPv4
address.

Anyway thank you for link I will take a look into it.

Kind regards,

Elvir Kuric

On Wed, Oct 15, 2008 at 10:45 PM, Grant Taylor
<gtaylor@riverviewtech.net> wrote:
> On 10/15/08 15:32, Elvir Kuric wrote:
>>
>> I am wondering does someone has experinece with translation from ipv6 --->
>> ipv4, I mean I am going to set up my home computers to use IPv6 but still I
>> have to push my iptables rules ( I know iptable supports ipv6 ) and my
>> gateway to packages from ipv6 network prepare for ipv4 network ( my ISP
>> provider )
>
> Sorry, I've avoided IPv6 as of yet.
>
>> Any suggestio is welcome and thank you in advance.
>
> Try taking a look at this web page
> http://tldp.org/HOWTO/Adv-Routing-HOWTO/lartc.tunnel-ipv6.addressing.html
> and see if there is any thing helpful there.
>
> I'm not quite sure how IPTables will come in to play with both IPv4 and
> IPv6.  Also, that particular web page only deals with tunneling IPv6, not
> gatewaying it to IPv4.
>
>
>
> Grant. . . .
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>
