From: "ctg60 ctg60" <ctg60@msn.com>
Subject: RE: Combination of state match and source/destination match problem.
Date: Thu, 05 Aug 2004 22:01:57 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY11-F16bOmQwKLAff0000e733@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org




>From: "Jason Opperisano" <Jopperisano@alphanumeric.com>
>To: <netfilter@lists.netfilter.org>
>Subject: RE: Combination of state match and source/destination match 
>problem.
>Date: Wed, 4 Aug 2004 08:49:34 -0400
>
> > I just want to figure out the relation between state match and IP 
>address
> > (source and destination ) match of iptables.  And my Redhat 9.0 box 
>which
> > has a static IP address of 192.168.220.8 has a ssh service runing on tcp
> > port 22.  And my client Linux box with
> > IP address 192.168.220.6 try to ssh my RH9 box.
> >
> > Here is my simple iptables rule on 192.168.220.8.
> >
> > #iptables -F
> > #iptables -F -t nat
> > #iptables -F -t mangle
>
>Flushes the filter, nat and mangle tables.  Note that flushing does not 
>reset the POLICY setting of any chain.
>
> > #iptables -P INPUT DROP
>
>Sets the POLICY of the INPUT chain to DROP, meaning:  if a packet goes 
>through this chain and never matches any rule, it will be dropped.
>
> > #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
>
>Any packet that is part of an ESTABLISHED conenction will be accepted.
>
> > #iptables -A INPUT -s 192.168.220.6 -j ACCEPT
>
>Any packet with a source IP of 192.168.220.6 will be accepted.
>
> > To my understanding, the INPUT chain of 192.168.220.8 box here deny all 
>the
> > external NEW connetions INCLUDING connetions from 192.168.220.6. And the
> > result is exact what
> > I expected. I can't ssh my RH9 box from 192.168.220.6 as well as other
> > boxes.
>
>Not really--the rules you have specified should allow 192.168.220.6 to 
>initiate a connection to any >port on any IP address local to any interface 
>of the netfilter machine.  The fact that it's not >working would lead me to 
>believe that there's something else going on in your OUTPUT chain, or >the 
>source of your connection is not actually 192.168.220.6.  Remember--just 
>because you allow a >packet in--doesn't necessarily mean that it has a way 
>out.
>
> > But when I change the iptables to:
> > #iptables -F
> > #iptables -F -t nat
> > #iptables -F -t mangle
> > #iptables -P INPUT DROP
> > #iptables -A INPUT -m state --state ESTABLISHED -j ACCEPT
> > #iptables -A INPUT -d 192.168.220.8 -j ACCEPT
> >
> > This time it works, I can ssh 192.168.220.8 from 192.168.220.6. Even 
>when I
> > replace the last rule with
> > #iptables -A INPUT -p tcp --dport 22 -j ACCEPT
> > it also works.
>
>This would lead me to believe that somehow--the source IP of your SSH 
>packets are not actually 192.168.220.6.  If they were the previous ruleset 
>should have worked too.  So it probably does not have anything to do with 
>the OUTPUT chain.


Yes , you are right. My source IP address was not 192.168.220.6. When I 
netstat it I ultimately found it's not 192.168.220.6! It's 192.168.220.1! I 
realized this was a problem of my VMware. My redhat 9 is a client OS with IP 
address 192.168.220.8. My VMware SNAT my host OS IP to 192.168.220.1 when it 
try to connect RH9 box. (Indeed my host OS doesn't have a IP of 
192.168.220.6. I use this just because it explain easy).


>
> > So this time it means INPUT chain of 192.168.220.8 box here deny all the
> > external NEW connetions EXCEPT connetions to 192.168.220.8 OR 
>destination
> > port 22.
> > But this conflicts with previous one. According to the previous example 
>this
> > doesn't work.
> >
> > So my question is what's the relation between state match and
> > source/destination match?
> > Or maybe which one comes first or who's seting overwrite the other?
>
>The relation is this:  the rules for each chain are process in order, one 
>by one, first match wins.  If no rule matches--the chain POLICY is 
>enforced.
>
>-j
>

Thanks very much
Regards.

_________________________________________________________________
MSN 8 helps eliminate e-mail viruses. Get 2 months FREE*. 
http://join.msn.com/?page=features/virus


