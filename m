From: "Sam Chan" <sam@mosmsg.com.sg>
Subject: Https website is not accessible once transparent proxy is set up
Date: Tue, 16 Sep 2008 14:49:06 +0800
Message-ID: <A42989E6EE1BCE4C9C1FF7DE428FF3C6630F@mos-exchange.mosmsg.com.sg>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have just set up a transparent proxy (Squid 3.0 on Debian etch).

Http redirect to port 3128 is ok and I can see http traffic in
access.log.

Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
REDIRECT   tcp  --  anywhere             anywhere            tcp dpt:www
redir ports 3128


But I cannot access https website even though I have enable port 443 to
be forwarded.

Chain FORWARD (policy DROP)
target     prot opt source               destination
LOG        0    --  anywhere             anywhere            state
INVALID LOG level warning tcp-options ip-options prefix `DROP INVALID
FORWARD'
DROP       0    --  anywhere             anywhere            state
INVALID
ACCEPT     0    --  anywhere             anywhere            state
RELATED,ESTABLISHED
ACCEPT     tcp  --  localnet/24          anywhere            tcp
dpt:https flags:FIN,SYN,RST,ACK/SYN state NEW
LOG        0    --  anywhere             anywhere            LOG level
warning tcp-options ip-options prefix `DROP '

Base on what I see on my syslog, whenever I browse any https site, the
packet falls under INVALID and hence drop base on my second rule above.

Can anybody help me?

