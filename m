From: "semi linux" <linuxsemi@gmail.com>
Subject: Bridge, DNAT, New Tables and ip rules
Date: Mon, 11 Jun 2007 15:35:49 -0700
Message-ID: <e53321d30706111535w3a1ce636we890c7207b3233dd@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=QBC8A50crSxg6OrGZTP2biS5Wb+Tb+X564uLplCW9dNY6CQFmsQZKT/I2aGHKCOtNLq//6vl7OqBtvz10+YTqxpqVr9f+5UenOyAkF3O34Syeo+gmsHdDgLpXi+c+AsLmQhjVjfD1cWdQ95Vr8u6OW067NHES5YpZDM3p827Mbw=
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I've got a rather elaborate setup here that doesn't seem to be working
for me and I was hoping someone here might be able to shed some light
on the problem.

My server (Jose) is a bridged link between two hosts (Jack and Dan).
Jack's messages are NATed to the local bridge interface and then the
local interface will talk to Dan.  The trick here is that I never know
Jack's IP - only Dan's and software on Jose acts as an intermediary.
This has worked fine for quite a while, without problem using the
following rules:

iptables --append PREROUTING -t nat -d $DANS_IP -p tcp --dport
$DEST_PORT -j DNAT --to-destination $BRIDGE_IP:$DEST_PORT

iptables --append PREROUTING -t nat -s $DANS_IP -p tcp --sport
$DEST_PORT -j DNAT --to-destination $BRIDGE_IP

It's an odd setup, I know, but it works.

The problem comes-in when adding a new network card to my server.
Depending on network address, if eth0 ever has a connection problem,
Jack talks to Jose, Jose to Dan and Dan to Jose, but Jose back to Jack
never works.  It always trys to use eth0 for that communication.  The
packets out of eth0 have SRC=Dan and DEST=Jack.  The weird thing is, I
don't see these packets on the Jose<->Dan link... only coming out of
eth0.  How can I route them out BR0 instead of eth0?

I've tried marking the packets using mangle, sending them to a
different routing table but it doesn't seem to have any effect.

In this setup, we want to use eth0 for _everything_ except the traffic
we DNAT.  If eth0 is brought down, br0 should be used as a backup.

Any suggestions, hint, tips, etc?

I've followed Chapter 11 of the LARTC Howto without any luck.

- Gareth

