From: varun_saa@vsnl.net
Subject: Re: IP + MAC + two subnets
Date: Fri, 06 May 2005 20:31:52 +0500
Message-ID: <e834f7e897f6.e897f6e834f7@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jason Opperisano <opie@817west.com>
Cc: netfilter@lists.netfilter.org



> > Is it possible to have two types of rules say :
> > 
> > 1. for 192.168.0.0/24 IP + MAC filtering.
> > 
> > 2. for 192.168.21.0/24 IP filtering.
> 
> yes.
> 
> > Thanks in advance
> 
> you're welcome in perpetuity.
> 
> -j

Sorry for the repost. While replying I din't
check the mail address.

Are the following rules OK :

1. Allow 192.168.0.5 ( IP + MAC filter )

A FORWARD -i eth1 -o eth0 -s 192.168.0.5 \
 -m mac --mac-source XX:XX:XX:XX:XX:XX -j ACCEPT


2. Allow 192.168.21.5 ( IP filter )

A FORWARD -i eth1 -o eth0 -s 192.168.21.5 -j ACCEPT


DROP all other IPs

iptables -t filter -A FORWARD -i eth1 -o eth0 -s 192.168.0.0/24 -j DROP
iptables -t filter -A FORWARD -i eth1 -o eth0 -s 192.168.21.0/24 -j DROP

Varun






