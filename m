From: Daniel Lakeland <dlakelan@street-artists.org>
Subject: Re: manipulating the ttl
Date: Sat, 25 Jan 2020 17:17:05 -0800
Message-ID: <82e00d85-680c-2932-42e2-3b1087bb1013@street-artists.org>
References: <9c18d561-2033-baa9-718f-29275392acd5@street-artists.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed; d=street-artists.org; h=
        subject:from:to:references:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=
        street-artists.org; bh=+scAJ+gBgqYpoppq8O6u937Qr9Q=; b=edRTLf9Dp
        Y1+iGgmWrhIQY4AKynHXhko1QQ2eLEqpD9H1xWV8JzYOwvjZtpaWGTlsdbRXKvk6
        eFsF5tf3l056ZCFl1qjrlYonaP217SU2MdHmjZSE8H7LUIFZghboxheIZ2wcUsRA
        clo/G/z3L1ji81rImyIKLx+1LM3ByMY5dQ=
In-Reply-To: <9c18d561-2033-baa9-718f-29275392acd5@street-artists.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Netfilter Mailing List <netfilter@vger.kernel.org>

On 1/25/20 5:02 PM, Daniel Lakeland wrote:
> As far as I can tell in nftables there's no way to manipulate the TTL 
> field in packets, along the lines of iptables -A foo -j TTL --ttl-set 
> 2 or the like
>
> This becomes a problem for handling certain multicast scenarios. Is 
> this on the horizon?
>
>
>
hmmm in further inspection I see that you can *set* the ttl, something like:

nft add rule inet mytable mychain ip ttl set 2

but I don't see how I could do something like decrement the ttl by 4 or 
basically do anything where you'd calculate the TTL as a function of its 
current value.

In general calculating simple arithmetic in order to manipulate fields 
isn't necessarily obvious in nftables. Any pointers?


