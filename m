From: stoffl4ever <stoffl4ever@gmail.com>
Subject: Re: issue with nftable - goto : Operation not supported
Date: Wed, 26 Nov 2014 22:45:16 +0100
Message-ID: <547649EC.2090200@gmail.com>
References: <5474BC91.6060108@c-s.fr> <20141126130042.GA1533@salvia> <54760ABA.4040900@c-s.fr> <20141126174721.GA3815@salvia> <5476152E.8010400@c-s.fr> <20141126181312.GA25447@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=djkMvQRbaNtfz4i0iAYArMrJ7pfIk33HkFl5zuCP0Qo=;
        b=mGsZ+V6g6ST6XJrF5cLVCshAZiE8aKILxzXKJLnvORboOtda9MQWP8etKvWY6/xq2U
         bM2UuWImPH58cLcFJqek/DvqyTc1pP3KugelLV5Wdx3rZhxEzrk4mBbGSUVAy6LB46oM
         IktZ6/vRTVsgDo9+aHywMjkWuKZwEaTN7/LUxHUpiBmdOw2f+U7TjCiPNa86QR644PZN
         t63SdzZsAXTDc2HRY1HnLeTIcWGx8RcOE2fZEb8+IP8g2cYLP3pbPWzRTU23KMbe4mUS
         LXNcNjuYhMkf6BBochtuiilgBzUZB2MCYZr9beQ4qv8d19Qs57pnI5V625hIv837uQ90
         xAqQ==
In-Reply-To: <20141126181312.GA25447@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On 26.11.2014 19:13, Pablo Neira Ayuso wrote:
>> > I tried it, it adds rules but doesn't remove the previous ones. How
>> > can I replace previous rules in one go with 'nft -f' ?
> You have to prepend:
>
>  flush table filter
>
> to the output of 'nft list table filter'.
>
> Since 3.18, you can also use:
>
>  flush ruleset
>
> that removes everything, including the existing table and chain
> configuration.
Also named sets?
I was running into this before that sets are not removed when only using:
flush table filter
