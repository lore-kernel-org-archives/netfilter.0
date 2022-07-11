From: Kiernan George <kbg98@vt.edu>
Subject: Re: Creating a map with libnftnl
Date: Mon, 11 Jul 2022 14:55:00 +0000
Message-ID: <6350f4d6-76ab-c8e6-80d3-9b817fc6f6d1@vt.edu>
References: <fbaccc73-c98c-4a21-bc12-0c89b041ae32@vt.edu>
 <20220630160303.ed722cd8c3a70facdf133f14@plushkava.net>
 <20220630160628.f7bd5dd1f234d834be19aed6@plushkava.net>
 <a751cf13-8ca9-7d9d-e1d7-6f4242ae8860@vt.edu>
 <20220630165409.7c3d0d1920ba9163ab057386@plushkava.net>
 <cc75919c-63ad-7255-1c60-63f266ba244c@vt.edu>
 <20220630171153.f6db1674be194c72ca6d17e7@plushkava.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=vt-edu.20210112.gappssmtp.com; s=20210112;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=W0dSEK250DGRCJmeGhst8RL+a+YHkUmAYeoSBSL2CZE=;
        b=bgVNRpf5j95ATeeUdFzKj1B6zjZIkPHXl4QkZ4xSY+aRSZp4/K6TDXGnDRaUhLYq4I
         yZwE3rLw/VXEPc/PXBjbSBKK3e1mqeSqiMno4u7biYpz85yX5bXpImfFQbflVvrmC0dD
         m98PPJbt7nTqez3DeixqW2E+TpnE2sMgueWa7IOYM6fUiVgJcSMxQeciEtRIXWIgLRcz
         tRrU4L5atcBncnQr24RFClywY6FXW/2T/85i6+SgxxOUWbwpsRiOkfhnvDO1oAuKPdsH
         PNgHpaVhGTfZwLlmp4o123HUE0t/QlqV7ejvwoeT+nS1ayPJkkNpbnbUtsJH/8Jp/Swx
         K6Rw==
Content-Language: en-US
In-Reply-To: <20220630171153.f6db1674be194c72ca6d17e7@plushkava.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Could someone modify the nft-set-add example to show me how to do this? 
I was able to read the netfilter messages to determine the appropriate 
key length/type and data length/type, but I'm not sure how those were 
calculated.

On 6/30/22 16:11, Kerin Millar wrote:
> On Thu, 30 Jun 2022 15:59:12 +0000
> Kiernan George <kbg98@vt.edu> wrote:
>
>> That's actually what I had, I got screwed up when copying it over.
>> Regardless, do you know how to set that up correctly with libnftnl?
> I do not. I'll leave it to one of the resident API experts to chime in.
>
