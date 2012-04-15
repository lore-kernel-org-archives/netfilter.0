From: Ed W <lists@wildgooses.com>
Subject: ipset causes reverse dns lookups?
Date: Mon, 16 Apr 2012 00:26:29 +0100
Message-ID: <4F8B5925.5020307@wildgooses.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

Hi, ipset appears to require a reverse dns lookup for say:

     ipset create cp bitmap:ip,mac range 192.168.111.0/24

Why?

In particular if I lock down iptables (-P DROP), then the above command 
takes quite some seconds to complete, rather than instantly if I open up 
iptables.  This is causing me some problems with startup scripts

Am I missing some configuration option? Is this a bug? Why is a reverse 
DNS lookup needed?

ipset 6.9.1, kernel 3.2.13

Thanks

Ed W
