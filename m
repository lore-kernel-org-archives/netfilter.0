From: Satish Patel <satish.txt@gmail.com>
Subject: block ip fragmented packet
Date: Thu, 10 Dec 2015 17:38:04 -0500
Message-ID: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=IWdCioNQB96jSqjFyDGgXdiRiTxfsoXI6ezNMfyitsU=;
        b=owtUILsPjtDjarn0Kf/xDZXx6Nkx83ylY2CRZovckMMFEyFcAinPNfQs6148z3SLdL
         4uzdRjwcOpN0p83DduglI4fcS86Okh1ULrDKh1DElH9a+vnh0ywlUf3M5bqz8gdNN4rd
         0R5eLQp+J4eASUtPWRUnk1RizhhPiUTma72+msVuObVWa/lCHKJHx/33ZKOcarF00+7s
         UDhUxsBMUUQ76cqX59/KHUUB1PQ8+2LMlfw4rYl6XodmQO5aPV7o6AsO4ZgN53477d7K
         DyCd3dBnmiCwL9Lxp2v48+ZEb1JHrphz5/pl8nCP+Ff2byxFnMkTdi/NHPtzs45shJTI
         vswg==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

We have iptables v1.4.21 running and i am trying to stop all
fragmented packet but following rules doesn't working what is wrong
here?



iptables -t raw -A PREROUTING -m u32 ! --u32 "0x4&0x3fff=0x0" -m
comment --comment "Fragmented" -j DROP

To test rules i am doing following:

ping -M want -s 3000 192.168.1.1
