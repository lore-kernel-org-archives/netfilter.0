From: "Ming-Ching Tiew" <mingching.tiew@redtone.com>
Subject: SNAT leaks on kernel 2.6.22 ?
Date: Wed, 9 Jan 2008 15:44:28 +0800
Message-ID: <01a201c85293$76aedaa0$8119fea9@MingChing>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org


I hope you can bear with me as this is a little long.

I have a system with linux 2.6.22.15 without any patch, and iptables 1.3.8 also
without any patch ( I have done a great deal of problem isolation, therefore all
the patches I added have been removed and so now it's left as a vanilla system). 

In the system I happened to configure a bridge br0  and  is assigned an IP. 
In the bridge there is also a  connection to internet using pppoe via an 
additional interface. The outgoing interface is natted.

I have a client on the side A of the bridge which default route to the IP 
of br0 of the bridge. And on the bridge, there are two routing paths, 
one via NAT to the internet and one is without NAT, another to a router 
on the side B of the bridge. And the bridge is doing multipath weight 
routing of equal weight on both the uplinks.

What I noticed is that certain times I would get to have private IP
leaks to the natted interface. I have been trying very hard to
figure out how to repeat this problem and it does not happen
all the time but which it happens, I don't know how to normalize
it. I tried re-run iptables scripts and flush the routing cache, it
does not bring the system back. And it does not happen to all 
packets, only some.

I am pretty sure I do SNAT or MASQUERADE on the natted
interface, but this rule seems to be skipped or ignored at certain time.

I have finally figured out a consistent way to repeat the problem
but now I am still short of an answer. The detail of how I could
repeat it is again quite long, and so I am skipping it for now.

Also I have not been able to repeat this problem without using a bridge
I tried multipath routing, one leg is natted, and another is routed without NAT
and without bridge, but I don't see the problem.

But since the problem comes out intermittently, I am at this moment
unable to say for sure it does not happen without a bridge. 

I know it probably a long shot now, anyone has a clue ?

Best regards.

--------------------------------------------
Important Warning! 

*************************** 

This electronic communication (including any attached files) may contain confidential and/or legally privileged information and is only intended for the use of the person to whom it is addressed. If you are not the intended recipient, you do not have permission to read, use, disseminate, distribute, copy or retain any part of this communication or its attachments in any form. If this e-mail was sent to you by mistake, please take the time to notify the sender so that they can identify the problem and avoid any more mistakes in sending e-mail to you. The unauthorised use of information contained in this communication or its attachments may result in legal action against any person who uses it.

