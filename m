From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: MARK not working
Date: Fri, 2 Apr 2010 13:26:45 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1004021325420.18189@obet.zrqbmnf.qr>
References: <4BB53BEC.9010709@gmail.com> <20100402065742.23be08f0@catlap>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100402065742.23be08f0@catlap>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: Dennison Williams <dennison.williams@gmail.com>, netfilter@vger.kernel.org


On Friday 2010-04-02 06:57, Marek Kierdelewicz wrote:
>
>>I am having a problem receiving marked packets from the mangle table in
>>my filter table.  I have:
>
>I think packets marked 0x1 in prerouting should never reach LOG &
>ACCEPT rule because of the following rule before them:
>
>>-A INPUT -i eth1 -p udp -m udp --dport 4500 -j ACCEPT

There is no such rule (given in the mail).

>You can clear counters, feed some test traffic to the box and send me
>counter information retrieved with following commands:
>iptables -L -nv -t filter
>iptables -L -nv -t mangle

Use `iptables-save -c`, it's much more complete and better to parse 
because it does not try to make a pretty-print table that always wraps 
in e-mail anyway.
