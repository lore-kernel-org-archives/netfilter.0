From: Lars Nooden <lars.curator@gmail.com>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Tue, 22 Jun 2010 22:16:52 +0300
Message-ID: <4C210C24.9050605@gmail.com>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=8Nh8s9ILCgR5oKL3pDmFYsLEZlpWe7DpinE40yxoIjo=;
        b=IMV76ClbHnESs9Uk6hvr8jCrML8Q8CfwzusBy+o+Toc/2CdbDLt/XBfLEUEgJrEvwz
         raaV88o3TtU9uxsmZrGxoIxXmqgdCdEzKqnb/5aLuBOcq3SMXQr1ZzgGOuevSfxovYzk
         Qu6M0Fa3qfrjv4kbCVvttxPpNzCJmYMLyKVCo=
In-Reply-To: <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Florian Effenberger <floeff@gmail.com>
Cc: netfilter@vger.kernel.org

Hello, Florian,

On 6/22/10 9:30 PM, Florian Effenberger wrote:

> what does another chain help? I need to keep some records in the
> tables, because of clients that might have still the "old" address in
> their cache. The tables get cluttered anyways, no matter if I use one
> or several user-defined chains.

The chain is a drop-through list of ip addresses that you have decided 
are good.  Then make a rule or pair of rules to send tcp traffic for 
port 993 and port 537 to that user-defined chain.

  ip6tables -N gmailimap
  iptables  -N gmailimap4

...

  iptables -I gmailimap4 --destination 74.125.79.111 -j ACCEPT
  iptables -I gmailimap4 --destination 74.125.79.109 -j ACCEPT
   # etc

  ip6tables -I gmailimap --destination 2a00:1450:8005::68 -j ACCEPT
  ip6tables -I gmailimap --destination 2a00:1450:8005::93 -j ACCEPT
   # etc

...

  ip6tables -I OUTPUT -i eth0 -p tcp --destination-port 993 -j gmailimap;
  iptables -I OUTPUT -i eth0 -p tcp --destination-port 993 -j gmailimap4;


All that is just a guess / pseudo-code.

/Lars
