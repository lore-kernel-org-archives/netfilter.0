From: Kirk Hoganson <kirkhoganson@gmail.com>
Subject: Round Robin or Random Source NATing
Date: Thu, 17 Feb 2011 22:38:49 -0800
Message-ID: <4D5E13F9.1050608@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:message-id:date:from:user-agent:mime-version:to
         :subject:content-type:content-transfer-encoding;
        bh=srgxV7ohAQ/5x1VtJo2q6tbOr0YZQdsUZyszPwMS6bA=;
        b=s/8mbLJuogLXLsQBshHDUNLp368UqFBtvJlOFRO9UhYj0uUBM/D0bjPsvMF057NONz
         71B56zCRaOwFaSWl3/o8POpzORfgqiCmwAAUvWioZe+5mIGjoS2jQcucVHB/C8mYjzOb
         kGtnpllxkr3NXidv8ZDleVk7xGjdGWgVuC+f0=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

I am attempting to create a series of rules that source nat web traffic 
amongst a pool of IP addresses.  I have used the nth mode to cycle 
through the IP address in a round robin fashion.  I am using the 
following rules:

$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 0 
-j SNAT --to-source 1.104.126.216
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 1 
-j SNAT --to-source 1.104.126.217
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 2 
-j SNAT --to-source 1.104.126.218
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 3 
-j SNAT --to-source 1.104.126.219
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 4 
-j SNAT --to-source 1.104.126.220
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 5 
-j SNAT --to-source 1.104.126.221
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 6 
-j SNAT --to-source 1.104.126.222
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 7 
-j SNAT --to-source 1.104.126.223
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 8 
-j SNAT --to-source 1.104.126.224
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 9 
-j SNAT --to-source 1.104.126.225
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 10 
-j SNAT --to-source 1.104.126.226
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 11 
-j SNAT --to-source 1.104.126.227
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 12 
-j SNAT --to-source 1.104.126.228
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 13 
-j SNAT --to-source 1.104.126.229
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 14 
-j SNAT --to-source 1.104.126.230
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 15 
-j SNAT --to-source 1.104.126.231
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 16 
-j SNAT --to-source 1.104.126.232
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 17 
-j SNAT --to-source 1.104.126.233
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 18 
-j SNAT --to-source 1.104.126.234
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 19 
-j SNAT --to-source 1.104.126.235
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 20 
-j SNAT --to-source 1.104.126.236
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 21 
-j SNAT --to-source 1.104.126.237
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 22 
-j SNAT --to-source 1.104.126.238
$IPTABLES -t nat -A POSTROUTING -o $EXT -m state --state NEW -p tcp -m 
multiport --dport 80,443 -m statistic --mode nth --every 24 --packet 23 
-j SNAT --to-source 1.104.126.239

At first glance the rules appear to work.  However when I look at the 
traffic on the receiving host, I see a number of connections from the 
primary eth0 address of the source system.  I see approximately 10x as 
many connections from the primary IP address (which isn't in the round 
robin rotation) as I do from any of the addresses in the round robin 
pool.  The addresses in the pool all have approximately the same number 
of connections to the remote host.

How can I create a round robin, or random source nat pool for web 
connections, without using the primary IP address of the source system 
to connect to the remote host?

Thanks.

