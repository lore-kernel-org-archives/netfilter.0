From: "Andres Baravalle" <andres.baravalle@gmail.com>
Subject: problems with port forwarding
Date: Fri, 23 Feb 2007 16:07:32 +0000
Message-ID: <45992f580702230807p39f8fcacr914ef910270ae2ba@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=lSa4e4Xp04e/KsE7otLj6iMkWkn4puuk3w1PLt670W9GBK0KHJiFdYMcKRc2qQZPxTI0eP9P1XQlT8CCn20AHbEXCqw9sRsTKpgJOxQ3sIza93cT/LbTktlJ+W/Eb9PC8FRRCU3jLXTE32HBhpfIUt5nG4E0/Q61bskS0/3f2rU=
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

Hi,
I need to forward a port from one server to another - and I'm having
some trouble.

I have a server (A) and I want connections to port 10022 in server A
to be forwarded to port 22 in server B.

I tough I got the procedure correctly, because it's working using
another server (C) and server B.

Anyway, here are the relevant tables:

iptables -L --line-numbers -t nat

Chain PREROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    DNAT       tcp  --  anywhere             anywhere            tcp
dpt:ftp to:SERVER_B:22
2    LOG        all  --  anywhere             SERVER_B    LOG level debug

Chain POSTROUTING (policy ACCEPT)
num  target     prot opt source               destination
1    SNAT       tcp  --  anywhere             SERVER_B    tcp dpt:ssh
to:SERVER_A
2    LOG        tcp  --  anywhere             SERVER_B    LOG level debug

iptables -L FORWARD

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state
RELATED,ESTABLISHED
REJECT     tcp  --  anywhere             anywhere            tcp
flags:!SYN,RST,ACK/SYN reject-with tcp-reset
DROP       all  --  anywhere             anywhere            state INVALID
ACCEPT     tcp  --  anywhere             SERVER_B    tcp dpt:10022
ACCEPT     all  --  anywhere             anywhere
LOG        tcp  --  anywhere             SERVER_B    LOG level warning

If I connect from server A to localhost, port 10022, it works. If I
connect from any other machine to server A, port 10022, it doesn't.

Any suggestions? I've been looking at this and making tests for a long
time today and I can't find the error.

By the way, I can't see any entries in the log...

   Andres

