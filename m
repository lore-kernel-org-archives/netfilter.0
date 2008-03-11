From: Justin Piszcz <jpiszcz@lucidpixels.com>
Subject: Question relating to ESTABLISHED,RELATED rule.
Date: Tue, 11 Mar 2008 14:43:35 -0400 (EDT)
Message-ID: <alpine.DEB.1.00.0803111442040.19106@p34.internal.lan>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; format="flowed"; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

Question relating to ESTABLISHED,RELATED rule.

Obviously at a minimum you need this for the INPUT chain.
It also seems to help a bit with the FORWARDING chain as well.

Is it necessary for the OUTPUT chain?  Will it help problems with e.g.,
sometimes I see blocks when I visit a lot of websites (TCP/port 80) from
banner ads and such, would output help here, or?

This is the rule I am asking about, currently I do not use it and I 
generally do not see any problems but I am curious how come some people 
use this and others do not, what are the pros/cons each way?

iptables -I OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

Thanks,

Justin.

