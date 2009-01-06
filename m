From: =?UTF-8?B?QXJ0xatyYXMgxaBsYWp1cw==?= <x11@arturaz.net>
Subject: Mystics of packet forwarding
Date: Tue, 06 Jan 2009 21:41:31 +0200
Message-ID: <4963B3EB.6090806@arturaz.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello fellow netfilter users,

I have a strange problem and I think I should blame my ISP for that...

Recently I lost connectivity to some sites (i.e. digg.com, yahoo). The best part 
is that I can regain connectivity by clearing out all the rules from iptables.

So if I have empty chains - I can connect to digg. After I add one rule:

iptables -t nat -A POSTROUTING -s 192.168.0.0/16 -j MASQUERADE (or SNAT, doesn't 
make a difference)

and bam! in 3-5 seconds I lose connectivity to these sites. Others work just fine.

The delay of impact is one thing that bothers me and makes me wonder about magic 
in ISP side.

Other thingie is if I do:

iptables -t nat -I POSTROUTING -s 192.168.0.0/16 -j DROP

After 3-5 seconds I regain connectivity... It seems that my ISP is somehow 
monitoring nat'ing and dropping access to some sites...

Any ideas why could this be happening and what is so special about digg.com and 
some of yahoo servers that they connectivity to them get affected like this?

Any ideas welcome.

Thanks, Arthur.
