From: Yury Polyanskiy <ypolyans@princeton.edu>
Subject: Re: martian destination and RAW iptable
Date: Tue, 27 Jan 2009 22:34:49 +0300
Message-ID: <ea182b20901271134j2515994dk3db95ef073d47554@mail.gmail.com>
References: <ea182b20901270724r3c7909dbo7ddec6bc92c8afa6@mail.gmail.com>
	 <ea182b20901270725n3fde42e4i166b346a919a3050@mail.gmail.com>
	 <497F504E.9040807@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:sender:received:in-reply-to
         :references:date:x-google-sender-auth:message-id:subject:from:to:cc
         :content-type:content-transfer-encoding;
        bh=NA/tGivKVGMhiSPdjww9Jp81XDMmaP5OCb+qeI6SOfs=;
        b=i9DBsPt1kGxwxrYmjfxB/JmdUcpAR4szhTzqwkTlTmAoUO5UnneHtRmRFT7bAtOix4
         06cwmFCaVk4ONbEVskamf/NXaXvOsPRnnZAv3i/eq6S0A+/D3FzpIExh2ca7KVfu+1V6
         p6ym50R3QPonTR72y9LYMHcbmu/3CERuBxjpM=
In-Reply-To: <497F504E.9040807@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mart Frauenlob <mart.frauenlob@chello.at>
Cc: netfilter@vger.kernel.org

On Tue, Jan 27, 2009 at 9:19 PM, Mart Frauenlob
<mart.frauenlob@chello.at> wrote:
> Yury Polyanskiy wrote:
>>
>> Hello everyone!
>>
>> I wanted to filter out the annoying logs:
>>
>> Jan 24 00:19:54 tetra kernel: martian destination 0.0.0.0 from 1.2.3.4,
>> dev eth0
>>
>> and issued the following:
>>
>> #iptables -t raw -I PREROUTING -s 1.2.3.4 -d 0.0.0.0 -j DROP
>> #iptables -t raw -I PREROUTING -s 1.2.3.4 -j DROP
>>
>> Amazingly, I'm still getting those pesky log messages. How is this
>> possible?
>>
>
> find /proc -name log_martians
>
> set the one for your interface to `0'.
>

Thanks, but I was asking how is it possible that a packet slips
through the -s 1.2.3.4 -j DROP rule in PREROUTING.

Y
