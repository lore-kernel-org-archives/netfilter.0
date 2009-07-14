From: Anatoly Muliarski <x86ever@gmail.com>
Subject: Re: Rate-Limiting (tc/CBQ) & Load Balancing Question
Date: Tue, 14 Jul 2009 09:07:36 +0300
Message-ID: <38db14850907132307p2fa82469k7a48dc3d021ff999@mail.gmail.com>
References: <ba0063890907131239m1a883373yc31ad66241a5e1c8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:in-reply-to:references
         :date:message-id:subject:from:to:content-type
         :content-transfer-encoding;
        bh=rq9v0A4wTDQ6BCQznsfnl2gKi387JHddU1yB5/HQ1Eg=;
        b=uuILsajGTqiKf8L6fOcZQcfRhYWqn++aMGHdx+BmeFMTWZSY9Vb8Zca4cKHi5BwJqn
         ET6DypWN3n5vU8WkEAJyMMa6cP9MnITTLrMFd3LFRRJkXIANA+rdjEZxn2tDJPEqWF6l
         MTjnDcMV7Id9T5umkplW5riV8m6Z3HI/cTpFM=
In-Reply-To: <ba0063890907131239m1a883373yc31ad66241a5e1c8@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi Chris,

The way I am using now is to create ifb0 interface on input of the
inside interface( I call it downlink ). So you can shape all upstream
traffic on a single interface. Suppose eth0 is your downlink
interface. Here is a piece of my perl script:


  system("$ETC qdisc add dev $dev ingress");
# Filter local traffic( INPUT ) - to distinguish the Global one by IP!
  system("$ETC filter add dev $dev parent FFFF: protocol ip prio 1 u32
match ip dst $ip flowid :1");
  system("$ETC filter add dev $dev parent FFFF: protocol ip prio 1 u32
match ip dst $bcast flowid :1");
# Redirect FORWARDING traffic( not destined to us ) - to shape by ifb0 rules
  system("$ETC filter add dev $dev parent FFFF: protocol ip prio 2 u32
match u8 0 0 flowid :1 action mirred egress redirect dev ifb0

where $dev is eth0, $ETC means tc :), $ip is IP of downlink interface,
$bcast is its broadcast( ip & broadcast rules need only to separate
router destined traffic from forwarding one ).

Then you can use any qdisc you need on ifb0 device.
-- 
Best regards
Anatoly Muliarski
