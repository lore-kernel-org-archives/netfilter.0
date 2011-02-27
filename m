From: Anatoly Muliarski <x86ever@gmail.com>
Subject: ipset preformance
Date: Sun, 27 Feb 2011 21:40:25 +0200
Message-ID: <AANLkTimNBPsd-a2YbM9Bf755WRrUnchXT7P31U83Txb3@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:date:message-id:subject:from:to
         :content-type;
        bh=z+0GZAbhh0kUlP+x+yvepPDuT+qzC2Y1iY72R+c8eWc=;
        b=t2WjQ6A/baXHhrpAkJa+koffkg0DpbX1pGzF5WkZ7wI7kPLnsGxT+Lx1y5YVIUz+TM
         gtGPyT2LTAn4W+u5ht7BUGKGo6Lugkr8AqiFGlAQapPHb1l+dMJOq46khLyqveFvluk6
         sO6QvcEW7otCrlnTXnhJxR37m7SFR0l3lKXx4=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi all,

I did oprofile test on our router and I found strange things with
ipset performance.
Using a single check of a nethash set with 3 nets in it consumes 1.88%
of CPU, using a single check of an ipportiphash with zero items
consumes 3.39% and ip_set module itself  consumes 4.9%.
Currently I am using 2.6.25.17 kernel with ipset v2.4.9.
Is it worth to upgrade to ipset v4.5 to resolve this issue?

-- 
Best regards
Anatoly Muliarski
