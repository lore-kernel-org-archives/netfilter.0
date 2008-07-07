From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Port Forwarding .
Date: Mon, 07 Jul 2008 17:10:03 -0500
Message-ID: <4872943B.2060309@riverviewtech.net>
References: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5078d3df0807071449k730a33cxe31e0b34078f5794@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 07/07/08 16:49, Charles Romestant wrote:
> on C there is a web server, running on port 80, I want to be able to 
> access it through B from A.
> 
> So basically the ruleset should be on B if its port 80, forward to 
> port 80 on C.

These two rules should do the trick to get the traffic forwarded on 
through B to C.

iptables -t nat -A PREROUTING -i eth0 -d 10.0.1.192 -p tcp --dport 80 -j 
DNAT --to-destination 10.0.10.1
iptables -t filter -A FORWARD -i eth0 -o eth1 -d 10.0.10.1 -p tcp 
--dport 80 -j ACCEPT

You will need to make sure that the reply traffic back from C is allowed 
and appears to be from B.

iptables -t filter -A FORWARD -i eth1 -o eth0 -s 10.0.10.1 -p tcp 
--sport 80 -j ACCEPT
iptables -t nat -A POSTROUTING -o eth0 -s 10.0.10.1 -p tcp --sport 80 -j 
SNAT --to-source 10.0.1.192

> Any help would be appreciated, thank you in advance,

You are welcome.



Grant. . . .
