From: "Alexander Y. Tiurin" <alexanderyt@gmail.com>
Subject: SNATing w/o SNAT rule
Date: Mon, 19 Nov 2012 17:34:10 +0400
Message-ID: <50AA3552.6000609@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject
         :content-type:content-transfer-encoding;
        bh=Mbq7Pew99Siox41WXn0TNgoASuFeZHlVrBVyBeaGn2A=;
        b=ZbGBYkF0+rTpKJZPB91RGj2rWk6+2sqlfCxmtf2vMrfXdLoEmlz7HDT04aycWXAgdd
         wDSzzl8Wxk4E7p0yfWcxI9QxAblxX2eSpZTbApDfrXnxkL6bQobu27JGbCEoHSrybxql
         YCV9lm0nLQ3k7sbhbW781zzK5cJTlivIAOyNBNmbxwaiektHvR7jKC4AcwuVTs+8WzxR
         foNH6oXjge42hxA64PPHIxo+YXBhlXo+RJDa6HJL37PW3O6skZ4PwEpKWnWqT4WdCca2
         rQ/TVyEqJ188+sa2JwCaOhAs34Z3UKmkcmGDFXDQ671XMo9jsHXsn7Q3szwHByyRMdj4
         BflA==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello.

host(10.11.110.67) ->gw (10.11.110.224) -> world(95.26.248.143)


From host:

$ ping -n world
PING world (95.26.248.143) 56(84) bytes of data.
64 bytes from 95.26.248.143: icmp_req=1 ttl=53 time=64.1 ms
64 bytes from 95.26.248.143: icmp_req=2 ttl=53 time=63.7 ms
64 bytes from 95.26.248.143: icmp_req=3 ttl=53 time=65.2 ms



From world:

# tcpdump -i ppp0 icmp
16:10:21.285647 IP 1.1.1.7 > 95.26.248.143: ICMP echo request, id 17110,
seq 1, length 64
16:10:21.285730 IP 95.26.248.143 > 1.1.1.7: ICMP echo reply, id 17110,
seq 1, length 64
16:10:22.286347 IP 1.1.1.7 > 95.26.248.143: ICMP echo request, id 17110,
seq 2, length 64
16:10:22.286402 IP 95.26.248.143 > 1.1.1.7: ICMP echo reply, id 17110,
seq 2, length 64
16:10:23.287056 IP 1.1.1.7 > 95.26.248.143: ICMP echo request, id 17110,
seq 3, length 64
16:10:23.287097 IP 95.26.248.143 > 1.1.1.7: ICMP echo reply, id 17110,
seq 3, length 64



But all SNAT gw  rules:

$ iptables -n -L -t nat -v --line-number | grep 1.1.1.7
15       0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
1.1.1.7        tcp dpt:443 /* Port forwarding */ to:10.11.110.27
16       0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
1.1.1.7        tcp dpt:6661 /* Port forwarding */ to:10.11.110.87
17       0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
1.1.1.7        tcp dpt:3390 /* Port forwarding */ to:10.11.119.200
20       0     0 DNAT       tcp  --  *      *       0.0.0.0/0           
1.1.1.7        tcp dpt:3389 /* Port forwarding */ to:10.11.110.248
3      187 11220 SNAT       all  --  *      *       10.11.110.14        
0.0.0.0/0            to:1.1.1.7
4        0     0 SNAT       all  --  *      *       10.11.110.9         
0.0.0.0/0            to:1.1.1.7
5      864 78615 SNAT       all  --  *      *       10.11.110.111       
0.0.0.0/0            to:1.1.1.7
6        1    76 SNAT       all  --  *      *       10.11.110.26        
0.0.0.0/0            to:1.1.1.7
7        0     0 SNAT       all  --  *      *       10.11.110.170       
0.0.0.0/0            to:1.1.1.7
8        0     0 SNAT       all  --  *      *       10.11.110.6         
0.0.0.0/0            to:1.1.1.7
9        0     0 SNAT       all  --  *      *       10.11.110.107       
0.0.0.0/0            to:1.1.1.7
26       0     0 SNAT       all  --  *      *       10.11.110.57        
0.0.0.0/0            to:1.1.1.7
27       0     0 SNAT       all  --  *      *       10.11.110.87        
0.0.0.0/0            to:1.1.1.7
30       0     0 SNAT       all  --  *      *       10.11.110.248       
0.0.0.0/0            to:1.1.1.7
31       0     0 SNAT       all  --  *      *       10.11.119.200       
0.0.0.0/0            to:1.1.1.7
32       0     0 SNAT       all  --  *      *       10.11.110.27        
0.0.0.0/0            to:1.1.1.7
37      75  4940 SNAT       all  --  *      *       10.11.108.251       
0.0.0.0/0            to:1.1.1.7

This is strange, because a rule for host(10.11.110.67) isn't present.

And on gw:

$ iptables-save | grep -i masquerade
$

Why 10.11.110.67 change to 1.1.1.7?





