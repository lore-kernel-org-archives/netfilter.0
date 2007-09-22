From: "Eljas Alakulppi" <Buzer@buzer.net>
Subject: Re: Iptables rules.
Date: Sat, 22 Sep 2007 22:32:25 +0300
Message-ID: <op.ty2lwbujrtqp7s@hagumi.lan>
References: <46F56591.7010905@snurf.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <46F56591.7010905@snurf.info>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="us-ascii"
To: Shams Fantar <sfantar@snurf.info>, netfilter@vger.kernel.org

Add:
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT

Reason: You aren't allowing the incoming packets from the host you are  
connected to (you send a packet, server recieves the packet, server sends  
reply, your iptables rules drop it).

Shams Fantar <sfantar@snurf.info> kirjoitti Sat, 22 Sep 2007 21:57:21  
+0300:

> Hello,
>
> I am writing iptables rules. Here is the rules, they are in a script :  
> http://jumble.snurf.info/iptables-start
>
> When I use it, It blocks all access to the network. Why ?
>
> Do you have suggestions for my rules ?
>
> Regards,
>


