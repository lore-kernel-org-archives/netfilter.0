From: =?UTF-8?B?6LW15pum?= <pagonz@gmail.com>
Subject: HELP: how to block faked RST packet
Date: Tue, 8 Jun 2010 23:26:31 +0800
Message-ID: <AANLkTin10l7SVMgOS6SUU8IZruGsbjrJoopVqn6uZtCP@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:received:date:message-id
         :subject:from:to:content-type;
        bh=l6ddZ/edRfKFYhVLfigDAHd8UnSuqcpmkdagI94lvbY=;
        b=C6e/7dRrjyxa0musLpQfWjclgdkUFLsGd7f3rcWCwuOWtLMgI9fMayP8m5N1M94MJ8
         +Gj9b9dSpaBVyOmQphB0y8DrIqYfHXE0OvJQjHs7+hO3wBt4dwV/5eBVqR0g1BTPUL4T
         8OPym1vyhu/9cTKM8Elc2ug8HlVDR9+gF5kps=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

My web server recently received lot of fake RST packets, these packets
faked normal client src addr and mac addr but with different TTL.

I added one iptables rule as below to filter these packets:


iptables -A INPUT -p tcp -i eth0 --tcp-flags ACK,SYN,FIN,RST,URG,PSH
RST -j DROP


This rule works, but client ofter can not view a complete webpage
unless refresh the page a few times.


Is there any way that i can find where these packet from? i can trace
to one router according to the TTL value, but that's all i can do now.


Or how can i filter these RST packet with iptables or something else
without interfere normal http communication?
