From: Peter Renzland <peter@dancing.org>
Subject: Why --syn on tcp connlimit?
Date: Fri, 23 Jan 2009 14:24:47 -0500
Message-ID: <1FDE2549-3F21-4BD7-BB37-06C971D32052@dancing.org>
Mime-Version: 1.0 (Apple Message framework v930.3)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"; delsp="yes"
To: netfilter@vger.kernel.org

I have often seen rules such as:

iptables -I FORWARD -p tcp --syn -m iprange --src-range  
192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP

How is this, in effect, different from?:

iptables -I FORWARD -p tcp       -m iprange --src-range  
192.168.1.10-192.168.1.250 -m connlimit --connlimit-above 150 -j DROP

It's seems at best redundant, and at worst risky.  But I am very new  
at this and must be missing something. :-)

Thanks.

Peter

