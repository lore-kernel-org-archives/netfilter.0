From: Christoph Anton Mitterer 
	<christoph.anton.mitterer@physik.uni-muenchen.de>
Subject: miscellaneous netfilter questions
Date: Wed, 03 Mar 2010 16:54:19 +0100
Message-ID: <20100303165419.87692fvlklxfna68@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; delsp="Yes"; format="flowed"
To: netfilter@vger.kernel.org

Hi.


I'd have several questions on netfilter/iptables which I couldn't  
answer myself via the manpages/etc...
I split them up into several mails ;)


1) If I disable conntracking for packets using NOTRACK in raw what  
happens if I e.g. match the state later in filter? Does the rule  
simply not match for such packets or is it INVALID?


2) The addrtype module provides several address types. Where can I  
find which addreses are _exactly_ matched by a given type for a given  
protocol (especially IP4/6).
I'm especiylly (but not only) interested in what LOCAL actually means?
Is it all addresses of a hosts network interfaces PLUS the ALL  
addresses on that networks (like a "localnets")?
Or is it all the addresses which the kernel thinks the host has itself, e.g.
127.x.x.x
:1/128
88.88.88.88 (if that is the address of eth0)
2000:34:ff (if that is the v6 address of eth1)
and perhaps:
10.20.3.5 (if that is the address of ppp0 or wlan0)


3) --fragment
a) It's quite clear what happens if one uses "-f" or "! -f" but what  
happens if neither of the tow is give? Does it mean "! -f" or is it  
like "match not fragmented packets AND fragmented packets (both the  
first AND further fragments).

b) Is it true, that when conntracking is used, that packets are  
automatically defragmented so one doesn't have to care on fragments at  
all?
In that case, what happens to packets for which conntracking was  
disabled (NOTRACK in raw)? Are they also defragmented or not?



Thanks,
Chris.

----------------------------------------------------------------
This message was sent using IMP, the Internet Messaging Program.

