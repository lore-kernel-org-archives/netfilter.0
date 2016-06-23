From: "Irwin L." <biatche@gmail.com>
Subject: Re: nftables: drop ssh brute force with ip block
Date: Thu, 23 Jun 2016 18:39:46 +0800
Message-ID: <576BBC72.8030507@gmail.com>
References: <5766E34B.4040008@gmail.com> <20160623103430.GA10616@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:cc:subject
         :references:in-reply-to:content-transfer-encoding;
        bh=wVacoDoFiWFUEYxxqdEWAC1nObCvbxvnlQbDZnDfUag=;
        b=DHiWIsFjEZKy3qPYXoyYd0AWn0fRlw5oDQrCJFT9Xf+iHtGNo5Fmq1U1i5tJJeHCTA
         KI6EHVcfOh5kXNa1sHvJN4ZT5fGzsluweZe3UovQRpvjkGuL8KA8OqfPhHZ8To1nhP7k
         +V4H1s1Pb+GoHSqoRRZxoLNQN4Ipj4O+zuDy96g6AeZuv5QlIKLL8pwfnAThM6aGTrEq
         QUn38Emg+tODXF0bZnswWmU9vurlHF+ueXwQ531Efu74mO2UGhYe3ZjjhaWSuhANfGAP
         kXCMk8+LsVUWOT5IxZp2HawgjYb0bwb1mROlY7pUlOgb88wpJNUUxd1pBTkuxJpegmNm
         nl+Q==
In-Reply-To: <20160623103430.GA10616@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org


On 2016-06-23 18:34, Pablo Neira Ayuso wrote:
> On Mon, Jun 20, 2016 at 02:24:11AM +0800, Irwin L. wrote:
>> As subject says.
>>
>> tcp dport {22} counter limit rate 3/minute counter accept comment "avoid
>> brute force"
>>
>> I've tried something like this, but it seems to limit ALL ips.
>> I would prefer to block the ip address for 24 hours or something.
> Try something like:
>
> # nft add rule x y tcp dport 22 \
>          flow table ssh-bruteforce { ip saddr limit rate 3/minute } \
>                  accept comment \"avoid brute force\"
>
> This is ratelimiting based on the source IP address.
>
> You can consult the content of this flow table via:
>
> # nft list flow table x ssh-bruteforce
> ...
>
> The current output of this specific command is not stable,
>
> You require a relatively recent kernel and nft 0.6 to get this
> working.
>
> BTW, please don't use:
>
>          tcp dport { 22}
>
> The curly braces have very specific semantics, ie. they are requesting
> the kernel to create a set. In this specific case, this is overkill
> since this will create a set with *only one single element*. Thus:
>
>          tcp dport 22
>
> is better.
I currently use:
tcp dport {22222,40022,42222} ct state new counter flow table bruteforce 
{ ip saddr limit rate 3/minute } counter accept comment "limit bruteforce"

Is this ok?

I wanted to ban spamming ips altogether, but I've since learned that 
this is the job of 'fail2ban'

Thanks!
