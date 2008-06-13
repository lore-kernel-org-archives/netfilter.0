From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: iptables 1.4.1 + iprange fails for me
Date: Fri, 13 Jun 2008 10:52:06 +0200
Message-ID: <B2A331E1C46C49629667CBB4CFC600AD@dcyb.net>
References: <20080613090236.417411cd@maxim.office.modum.by><1F393B3797D94F30B6D3A7C823AC4BCD@dcyb.net> <20080613104908.048fe98b@maxim.office.modum.by>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080613104908.048fe98b@maxim.office.modum.by>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Maxim Britov <mailto:maxim.britov@gmail.com> wrote on Friday , 13 June 2008
09:49:

Please post answers to the list so others can answer too.

>>> I updated yesterday kernel + iptables on my router (into Internet)
>>> box. Kernel from kernel.org 2.6.25.6 + iptables 1.4.1-1 from fedora
>>> rawhide. I'm use kernel without modules on that box.
>>> 
>>> I found troubles with iprange:
>>> # iptables -A INPUT -m iprange --src-range 1.1.1.1-2.2.2.2 -j DROP
>>> # iptables-save |fgrep range -A INPUT -m iprange -j DROP
>>> 
>>> iptables -L -n show it as:
>>> DROP       all  --  0.0.0.0/0            0.0.0.0/0
>> 
>> And what does "iptables -nvL" say?
> 
>     0     0 DROP       all  --  *      *       0.0.0.0/0
>       0.0.0.0/0

Perhaps the -v would have shown the info you were looking for but in this
case I don't know, perhaps someone does.


Grts,
Rob


