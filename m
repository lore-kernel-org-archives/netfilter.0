From: Ran Shalit <ranshalit@gmail.com>
Subject: Q: using PREROUTING to change destination
Date: Tue, 14 Mar 2017 10:56:33 +0200
Message-ID: <CAJ2oMh+hJ30EYbMJqrWTBuPjkoimuYukdNtcGDaF0dhKw+w5DQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=17I1vYKfkkAR/71gvDym5ITlozmy+r/2TVGi8Jf/ABE=;
        b=i3gJVYJN5DpwtxrR7S7b+LXOh4Vo477b6+Mxmdw8ghj0aqj9wxeOX/bumCSSsAKVGv
         zhh5WmpYO11EjYxGmhBeuQ38LQV9S2B5FcUu27l2rs9DotYm6GF0q1/Al2BgdiaGinba
         w2CVxe1q6xOwuyceZ+39/Pir885eyeDJfWioyS2YYEgtlfdUk9RcHnBjUtTTHGH67t4W
         S0UBrwjDvjpfu87wf9FImIycQMSn0mOckeIL7UVINy/a/kupJ6kax62Lcf18BEpDoJRe
         /bkIuEYgg8WPc6ZFmuPozbmkwNSMeoJ013m07xETm8Dn3+81gdZzI/rGfNBC3B8aqik7
         0TEA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I am trying to understand how to use rules with PREROUTING and
transparent proxy.

In documentation it is said:

"6.2 Destination NAT

This is done in the PREROUTING chain, just as the packet comes in;
this means that anything else on the Linux box itself (routing, packet
filtering) will see the packet going to its `real' destination. It
also means that the `-i' (incoming interface) option can be used."

What does `real' destination means here ? Does it mean that the packet
is transfered to the new destination according to the rule given for
PREROUTING ?
for example, In case of transparent proxy :

iptables -t nat -A PREROUTING -p tcp -s 192.168.201.0/24 --dport 80 -j
DNAT --to 192.168.201.250:3128

Does it mean that the transparent proxy will be the end destination of
the packet ?

I am new with iptables.

Thank you,
Ran
