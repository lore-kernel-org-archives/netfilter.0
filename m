From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= <leolistas@solucoesip.net>
Subject: blocking MSN Messenger: my experiences ( almost long )
Date: Thu, 17 Jul 2003 10:41:28 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00b101c34c69$1fc83f40$3200a8c0@ESTACAO>
References: <09B04A55822EFF4DA48D2E0BB2941D4A15BF2B@wardrive.citadelcomputer.com.au>
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


    I've tried for a long time block MSN Messenger using only iptables
rules. I couldnt get that working. I've seen some 'crazy' rules blocking
lots of IP blocks which, teorically, are the MSN Servers, but I really dont
like this kind of rules.

    I could successfully block MSN Messenger using the following approach:
    - all ports in my firewall are blocked, expect those I really want (
specified one by one ) which are allowed in FORWARD and POSTROUTING;
    - even with this approach, MSN works because of the HTTP tunneling
stuff;
    - for blocking the HTTP tunneling stuff, I've configured squid ( which
works in transparent proxy mode, which means ALL 80/tcp traffic goes there )
to block the expression 'gateway.dll'. Seems that all access done by MSN
Messenger using HTTP protocol uses this file.

( squid.conf relevant entries )

acl msnmessenger url_regex -i gateway.dll
http_access deny msnmessenger ( and this deny should be placed BEFORE your
ALLOW rules, are they're parsed linearly )


    Here are some squid log entries that 'proves' my theory about
'gateway.dll'. In this firewall access to MSN Messenger is DENIED in squid,
so we'll see only DENYs here .... This DENYed entries represents MSN
Messenger trying to login ........

[root@correio squid]# cat /var/log/squid/access.log | grep gateway.dll
1058182392.455    147 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058182397.640      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058194534.786     29 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058206234.395      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058206492.547      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058206498.132      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058268737.709      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058268744.993      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058296167.865      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058297215.332      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058304370.039      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058355175.908      7 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058361247.628      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058362187.640      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058364639.802      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com - NONE/- text/html
1058440598.704      1 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
1058440604.017      4 10.0.1.25 TCP_DENIED/407 2070 POST
http://gateway.messenger.hotmail.com/gateway/gateway.dll?Action=open&Server=NS&IP=messenger.hotmail.com -
NONE/- text/html
[root@correio squid]#




    In my case, access using 'random' ports wont happen, because I allow
only ports I want. And HTTP traffic is controled by squid which blocks
'gateway.dll' URLs. Using this, I could successfully block MSN Messenger
usage.

    This is not a squid mailing list, I know. But i've tried for several
weeks block MSN Messenger using only iptables but I couldnt. I found
interesting to share my experiences in this subject with the list because I
know that a lot of people that are using iptables are also using squid, so I
think these comments and this 'solution' is relevant.


    Sincerily,
    Leonardo Rodrigues


