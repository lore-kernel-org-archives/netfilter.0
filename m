From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: MARK not working
Date: Fri, 2 Apr 2010 06:57:42 +0200
Message-ID: <20100402065742.23be08f0@catlap>
References: <4BB53BEC.9010709@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BB53BEC.9010709@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Dennison Williams <dennison.williams@gmail.com>
Cc: netfilter@vger.kernel.org

>Hello,

Hi,

>I am having a problem receiving marked packets from the mangle table in
>my filter table.  I have:

I think packets marked 0x1 in prerouting should never reach LOG &
ACCEPT rule because of the following rule before them:

>-A INPUT -i eth1 -p udp -m udp --dport 4500 -j ACCEPT

You can clear counters, feed some test traffic to the box and send me
counter information retrieved with following commands:
iptables -L -nv -t filter
iptables -L -nv -t mangle

Regards,
Marek
