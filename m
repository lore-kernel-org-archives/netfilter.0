From: Javier Govea <jgovea@magma.ca>
Subject: LOAD BALANCING
Date: Sat, 12 Jul 2003 15:05:10 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307121905.h6CJ5ALc022359@webmail1.magma.ca>
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi everybody,

I'm trying load balance the traffic on four ppp interfaces using iproute-2.4.7-9 but i'm
always getting a "dead pervasive" error message on my third interface (see below.) I'm
running redhat 9 with kernel 2.4.20-8. 

I read some messages posted on this mailing list and they said the problem can be fixed by
getting the iproute source code, compiling it, and installing it. But i already did that
and i'm still getting the same problem. Any suggestions or ideas????

Here is what i'm typing:

ip route add default equalize \
   nexthop via nexthop xxx.xxx.xxx.xxx dev ppp0 weigth 1 \
   nexthop via nexthop xxx.xxx.xxx.xxx dev ppp1 weight 1 \
   nexthop via nexthop xxx.xxx.xxx.xxx dev ppp2 weight 1 \
   nexthop via nexthop xxx.xxx.xxx.xxx dev ppp3 weight 1

Here is what i'm getting:

default equalize
     nexthop via xxx.xxx.xxx.xxx dev ppp0 weight 1
     nexthop via xxx.xxx.xxx.xxx dev ppp1 weight 1
     nexthop via xxx.xxx.xxx.xxx dev ppp2 weight 1 dead pervasive
     nexthop via xxx.xxx.xxx.xxx dev ppp3 weight 1

Thanx to all
X

