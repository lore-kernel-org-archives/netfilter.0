From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Multiple source question
Date: Wed, 19 Jun 2002 14:41:51 +0100
Sender: netfilter-admin@lists.samba.org
Message-ID: <200206191342.g5JDg1U30168@vulcan.rissington.net>
References: <000101c21795$aff6d3b0$0205a8c0@maxima>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <000101c21795$aff6d3b0$0205a8c0@maxima>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

On Wednesday 19 June 2002 2:31 pm, Benny Butler wrote:

> Ok, after much hacking together the rule below I finally get the machine
> at 192.168.2.70 to access 10.46.210.5.  Great, but if I run the same
> rule on any more internal IP addresses, still only 2.70 works.
>
> sudo /sbin/iptables -t nat -A POSTROUTING -o eth0 -s 192.168.2.70 -d /
> 10.46.210.5 -p tcp --dport 80 -j MASQUERADE

1. Why do you need to use Source NAT at all in order to access the machine on 
10.46.210.5 ?   What is there in the routing tables which prevents 
192.168.2.70 from accessing 10.46.210.5 and the replies going back again 
without any NAT involved ?

2. I think you should be using -j SNAT --to a.b.c.d instead of -j MASQUERADE.

You must surely have a fixed address on eth0 (ie it's not DHCP) therefore 
SNAT is the way to do it - it's much clearer what the rule is doing, and it's 
(marginally) more efficient in operation.

3. Maybe I've missed something earlier that you've posted (?) but please can 
you explain your network setup what you're trying to do / what doesn't work ?

 

Antony.

