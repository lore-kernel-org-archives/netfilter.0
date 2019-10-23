From: Aaron Gray <aaronngray.lists@gmail.com>
Subject: understanding my MASQURADING and SNAT problem
Date: Wed, 23 Oct 2019 20:52:13 +0100
Message-ID: <58adc088-21de-2280-4d77-83ed4c6d2c01@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=to:from:subject:message-id:date:user-agent:mime-version
         :content-transfer-encoding:content-language;
        bh=Yadvj1LPYT0o4YbeyTdtNKhwNIL4rqFbLcXFDRhiDRA=;
        b=mTJGAu5O/l64WFkLmLaVO00UiFSC/AoGIh6hoLTFQmqCaRxAnPA0TJZcios13nN4Nh
         /BwcmMSFWuzy+4osxFg6oe1xjCykWxkjMw/OsSCMBTuH43GLOrJBkn47XBVp9+93ZgTv
         m+q0UBaAL/bsQ0ZVMpwUiVYOw1T01l9sH4e7ois8ftgdhnO1tkEA9CHbO2JqIZPHacHT
         Z4+CPx+sK/E1R+24Gpj5by0DrrnQeA7Q+7OSudCDzN63Xs8Pzv2cbxUUWku52MyV356N
         nt7K2Hjipxsfb5dP1GjGLur/BriFDIqPNdI/WQiNpCtmVja1ZuDVH/fCeWnk/PBAu2Q9
         TMuA==
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: netfilter@vger.kernel.org

I am trying to provide a gateway for firewalling Windows.

I have two ethernet ports :-

     enp4s0 which is external onto another router onto the internet on 
192.168.1.0/8 <http://192.168.1.0/8>
     enp5s5: which is my internal Windows network.

I have the following rule working :-

     iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
<http://192.0.1.0/8> -o enp4s0 -j MASQUERADE

Why do we need the '! d 192.0.1.0/8 <http://192.0.1.0/8>' this doesn not 
seem to make any sense ?

I am trying to just allow ports 53 DNS and 443 HTTPS to be allow 
through, so I tried :-

     iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
<http://192.0.1.0/8> -p tcp --dport 53 -o enp4s0 -j MASQUERADE
     iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
<http://192.0.1.0/8> -p udp --dport 53 -o enp4s0 -j MASQUERADE
     iptables -t nat -A POSTROUTING ! -d 192.0.1.0/8 
<http://192.0.1.0/8> -p tcp --dport 533 -o enp4s0 -j MASQUERADE

But it is failing.

Hope I am doing something simple wrong !

--
Aaron Gray

Independent Open Source Software Engineer, Computer Language Researcher, 
Information Theorist, and amateur computer scientist.

