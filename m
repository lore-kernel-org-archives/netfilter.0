From: Frank Myhr <fmyhr@fhmtech.com>
Subject: Re: TCP and UDP dport in the same rule
Date: Sun, 22 Mar 2020 10:17:55 -0400
Message-ID: <c3cba3e7-4cbb-13f5-7104-e1129416b5e0@fhmtech.com>
References: <670198645.21727.1584884428183@ox89.mailbox.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=larkmoor.net; s=larkmoor20140928;
        h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:Subject; bh=3Y76iR1QNhjGUD0ogsYCkAPZPfcHov8MJPbxL6Ab+2E=;
        b=v5ulDefxBcFhlqXLgyfXl4WGfAf9WG6A6ZIJ+FiJrJffy6tBHIvf9tfInI0HL2AYrp6L8pzbMYAYHUdhi8lWFAHhO6XLOFCqQGMBUXKFV1PMKqiErgPO751tGVx2XEl/Da8tnjBWlndo913w9fRghk4m/kYTyPfajV2pkgSbEGs=;
In-Reply-To: <670198645.21727.1584884428183@ox89.mailbox.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Darius <dram@mailbox.org>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 2020/03/22 09:40, Darius wrote:
> Hi, I can't find the way to make one rule matching packets with the
> same dport either on tcp or udp. So far I have rules like this:
> 
> ip protocol tcp tcp dport 2000 counter accept ip protocol udp udp
> dport 2000 counter accept
> 
> I would like to have one rule instead. I couldn't find the way to do
> it with intervals or maps because dport statement must go together
> with tcp or udp.

Hi Darius,

Please see:
https://www.mankier.com/8/nft#Payload_Expressions-Raw_Payload_Expression

and this very recent thread:
https://marc.info/?l=netfilter&m=158472251109859&w=2

Best regards,
Frank
