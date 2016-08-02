From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: CONNTRACK and pppoe interfaces - marking does not work
Date: Tue, 2 Aug 2016 02:09:49 +0200
Message-ID: <fb55d688-ed21-819b-2028-db08f3224959@plouf.fr.eu.org>
References: <036276d0-5efe-6c08-5a49-faf6520b195b@seiner.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <036276d0-5efe-6c08-5a49-faf6520b195b@seiner.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Yan Seiner <yan@seiner.com>
Cc: netfilter@vger.kernel.org

Le 01/08/2016 à 22:28, Yan Seiner a écrit :
> This is driving me nuts.  I've spent most of the day trying to figure
> out why marking packets does not work.  I've now isolated the problem to
> where I believe that neither MARK nor CONNMARK targets work on a pppoe
> interface.

This assumption is of course wrong. iptables and conntrack don't care 
about the interface type.

> Here's what I have:
>
> eth0.9 - cable interface with DHCP: xxx.158.166.12
> eth0.8 - DSL interface with pppoe: xxx.251.62.82
>
> and here's how I mark them (I've also tried marking on PREROUTING):
>
> iptables -t mangle -A INPUT -i ${dsl_if} -j CONNMARK --set-mark 0x02/0x02
> iptables -t mangle -A INPUT -i ${cable_if} -j CONNMARK --set-mark 0x01/0x01

What is the value of ${dsl_if} ? It should be pppN, created by pppd with 
N=0, 1, 2...
