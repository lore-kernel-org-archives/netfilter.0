From: "Peter Kaagman" <P.Kaagman@atlascollege.nl>
Subject: Problems with mms-conntrack-nat
Date: Tue, 13 May 2008 16:06:11 +0200
Message-ID: <6BEC0BC0C32DBE4480920A1A1DA06D25016DAC8F@MERCURIUS.atlas.atlascollege.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi there list,

Sure hope this is the correct list and you guys can help me. Seing the
topics go by here I am wondering if this is the place to ask questions
like this.... but anyway.... here it is...

I am having problem trying to apply mms-conntrack-nat

This is my setup:


root@sentry2:/usr/src# ls -l
total 12
lrwxrwxrwx  1 root root   15 2008-04-25 12:51 iptables ->
iptables-1.3.8//
drwxr-xr-x  6 1000 1000 4096 2007-06-25 01:29 iptables-1.3.8/
lrwxrwxrwx  1 root root   14 2008-04-23 16:46 linux -> linux-2.6.21.5/
drwxr-xr-x 19 root root 4096 2008-04-25 13:34 linux-2.6.21.5/
drwxr-xr-x  5 root root 4096 2008-04-25 12:46 patch-o-matic-ng-20080424/
root@sentry2:/usr/src# uname -a
Linux sentry2 2.6.21.5-smp #2 SMP Tue Jun 19 14:58:11 CDT 2007 i686
Intel(R) Pentium(R) 4 CPU 2.80GHz GenuineIntel GNU/Linux
root@sentry2:/usr/src# cat /etc/slackware-version
Slackware 12.0.0
root@sentry2:/usr/src#      


When I try to apply the mms-conntrack-nat patch I get the following
error:

Do you want to apply this patch [N/y/t/f/a/r/b/w/q/?] y
unable to find ladd slot in src
/tmp/pom-2986/net/ipv4/netfilter/Makefile
(./patchlets/mms-conntrack-nat/linux-2.6.12/./net/ipv4/netfilter/Makefil
e.ladd)

Did not have this problem in the past... it applied just fine than.

Tried googling on that but what I found did not really make sense to me.

Regards

Peter
