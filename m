From: "Maxim Veksler" <hq4ever@gmail.com>
Subject: blocking access to port 22 when INPUT policy is ACCEPT
Date: Wed, 1 Aug 2007 01:04:20 +0300
Message-ID: <b400c69a0707311504g653c5bcdv86f100f5278a8fda@mail.gmail.com>
References: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references;
	b=KDLijLw6AhcwLJGfscGWlWFzKa+SI33LbeHpQwDzZCoVtmIYWiZ0Q7PzgRJtuN7m+EEJNuc3DtZ/qeFtVBd8IiyI+Jq03Pb7C9kCYGOMrJofVEIHRKXjAqNWQXG2G18BtrH/Vvwo+vllcUzudnJ0/4f1yk+ks4FjNi9DkRSK99w=
In-Reply-To: <b400c69a0707311002j46a9505du414c2058edbe79e2@mail.gmail.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

Hello,

I have my machine configured to allow all traffic in INPUT table, but
I would like to block access to port tcp22 from all besides several
ip's.

The following rules as the basic of what I'm trying to achieve:

/sbin/iptables -A INPUT -s ! a.b.c.d/29 -p tcp --dport 22 -j DROP
/sbin/iptables -A INPUT -s ! e.f.g.h -p tcp --dport 22 -j DROP

How can I do a "AND" between them as in
 if (-s ! a.b.c.d/29 AND -s ! e.f.g.h) then -j DROP ?

Thank you,
Maxim.

-- 
Cheers,
Maxim Veksler

"Free as in Freedom" - Do u GNU ?

