From: Shane Hickey <shane@howsyournetwork.com>
Subject: Need help with rate-limiting NTTP traffic
Date: Wed, 31 Mar 2004 16:54:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040331165409.0d498074@daneel.volumen.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Howdy all,
	Recently, with the help of this list, I migrated my firewall from a
FreeBSD box running ipfilter, ipnat and dummynet to a Gentoo Linux box
running netfilter and tc.  I have to admit that I'm having problems
visualizing tc in my head.  So, I was wondering if I could get an
assist.	
	Basically, I have a fat upstream pipe and I can use it basically
all I want, except that my NNTP traffic seems to really clobber
everything else.  Also, since my NNTP traffic is pretty much constantly
ongoing, I'd like to limit it to 800kbit.  This was a breeze with
dummynet, but I'm not getting how to do it correctly with netfilter.  

Here's what I tried:

$IPT -t mangle -N SHAPE-NNTP
$IPT -t mangle -I PREROUTING -i $WANIFACE -j SHAPE-NNTP
$IPT -t mangle -A SHAPE-NNTP -p tcp --sport 119 -j MARK --set-mark 119

My thoughts on placing it in PREROUTING is that I'd like to shape the
traffic as soon as possible so that my firewall gets the benefit of
dealing with the reduced load as soon as possible.  But, maybe that's
just foolishness?

Here's the tc rules I tried.

tc qdisc add dev $WANIFACE root handle 1: htb default 60
tc class add dev $WANIFACE parent 1: classid 1:1 htb rate 10Mbit
tc class add dev $WANIFACE parent 1:1 classid 1:119 htb rate 800kbit
tc filter add dev $WANIFACE parent 1:1 protocol ip handle 119 fw flowid
1:119

The one weird thing is that when I do a 'tc filter show dev $WANIFACE'
nothing comes back.  But 'tc class show dev $WANIFACE' and 'tc qdisc
show dev $WANIFACE" return useful information.

Thanks,

Shane


-- 
Shane Hickey <shane@howsyournetwork.com>: Network/System Consultant
GPG KeyID: 777CBF3F
Key fingerprint: 254F B2AC 9939 C715 278C  DA95 4109 9F69 777C BF3F
Listening to: american analog set - you own me

