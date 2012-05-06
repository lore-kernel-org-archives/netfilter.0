From: Waqar Hameed <waqar.hameed08@gmail.com>
Subject: Issuing verdicts out of order
Date: Sun, 6 May 2012 19:08:24 +0500
Message-ID: <CAPy6qbd=sMMEGqNfsYiAdfKMfKBN=0W1m1FyF2eu9DzhxF05Kg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:from:date:message-id:subject:to:content-type;
        bh=NL+ICnTINjVI1p2jX81w9aSqZ88gaRNDorIIKjK2GbU=;
        b=e9awEBlg6huKJO5WoGXnjtTOukLGRF6Bh1upyBl79FSqieTEbLHuq+463hk4rE8BEH
         +Od+9R1d5KPmNCqCzl0xcOMwPzhXDCWQoZz14CIJoIg0t3tV773jElHObf4bxpHRxyMQ
         6miiheOPqi34HrE4sbvmHxhFcoLwcphNpdoNfUBqPrO3nGuP1FXI2Wd9hUmBNQGmmcdV
         79DG5kJXdEvppknzbZd3AeeQnPuJ8GDeXVxZbyvr2sazB2Xheb9MGUrGe4JwvGg3UhAG
         Dn/cUh5//8U/Ecc8Nnn1XVmnPmTG5S23klnZIhKRJcEzzX9NM0TwB3eEUi8Yo42F94e6
         HjFA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I wanted to ask that can verdicts be issued to packets out of order?

I am building an application that delays the delivery of packets
depending upon some factors. So it may be the case that the first
packet has to be delayed whereas the second packet in queue must be
*accepted* immediately. So can we store delaying packets in some queue
and releasing them as required?

If someone has other ideas of how to implement it using
libnetfilter_queue, please guide me.

Best,

Waqar
