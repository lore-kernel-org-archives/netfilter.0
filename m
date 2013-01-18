From: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Subject: Re: [PATCH v4] netfilter: nf_conntrack_sip: Handle Cisco 7941/7945 IP phones
Date: Thu, 17 Jan 2013 22:55:38 -0300
Message-ID: <CACuyg24kxP3Ck280LBcPuUc6bp26DbWqpWaLyHAkz6pwd8WMVA@mail.gmail.com>
References: <1355805238-2460-1-git-send-email-cernekee@gmail.com>
	<20130117233539.GA15576@1984>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=9vIhaIa9KhqzU33rHmJY6oKPqiOh2h2qTx0SNrHEtzQ=;
        b=I3tPbVh/kjfP7PpNob8H2VDX1VP+cgYri1LLlxCOIoJwZlE8yUg9sIxBurpqneR7aA
         XkxUGp3hb8XHfUcPhPxuglGICfltZHbJzE0lidZSU91wGOLD12A1f/SJQN5CPi7qiZCl
         Nfo+jheZIuQuysf8cCUyx3uBzDy82qGUgw5pshCXu2K89iKYWoc1i5fe5Tawd/7JKJX0
         ryQW/SsaSSAbk8ocg1f7iMJgTCRQwb8DPxuE7x1pKJLemxfTB/LGyu1GYexuayDCNXTY
         QGJei7GJoVa5JDsHD/o1OjDkdN7eoLNAqfdcp7dxSY1/Ywb64zF8PkTJicBVoLQJoye2
         l0NA==
In-Reply-To: <20130117233539.GA15576@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

For now I'm using "siproxd" to solve this.

I glad to hear that already has a patch for this.
I will wait for official kernel support (Ubuntu)!


2013/1/17 Pablo Neira Ayuso <pablo@netfilter.org>:
> On Mon, Dec 17, 2012 at 08:33:58PM -0800, Kevin Cernekee wrote:
>> Most SIP devices use a source port of 5060/udp on SIP requests, so the
>> response automatically comes back to port 5060:
>>
>>     phone_ip:5060 -> proxy_ip:5060   REGISTER
>>     proxy_ip:5060 -> phone_ip:5060   100 Trying
>>
>> The newer Cisco IP phones, however, use a randomly chosen high source
>> port for the SIP request but expect the response on port 5060:
>>
>>     phone_ip:49173 -> proxy_ip:5060  REGISTER
>>     proxy_ip:5060 -> phone_ip:5060   100 Trying
>>
>> Standard Linux NAT, with or without nf_nat_sip, will send the reply back
>> to port 49173, not 5060:
>>
>>     phone_ip:49173 -> proxy_ip:5060  REGISTER
>>     proxy_ip:5060 -> phone_ip:49173  100 Trying
>>
>> But the phone is not listening on 49173, so it will never see the reply.
>>
>> This patch modifies nf_*_sip to work around this quirk by extracting
>> the SIP response port from the Via: header, iff the source IP in the
>> packet header matches the source IP in the SIP request.
>
> Applied, thanks Kevin.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
