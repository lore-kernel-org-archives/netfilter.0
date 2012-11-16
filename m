From: "Steve \(Telsat Broadband\)" <steve@telsatbb.vu>
Subject: Can't add ff::/8 to ip6tables.
Date: Fri, 16 Nov 2012 21:38:51 +1100
Message-ID: <09f201cdc3e6$91ffb080$b5ff1180$@telsatbb.vu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-au
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi All,

For one of my filtering rules, I'm trying to add the following rules:

ip6tables -t mangle -I AuthCheck 1 -d ff::/8 -j RETURN ip6tables -t mangle
-I AuthCheck 1 -d fc::/7 -j RETURN

However, when I check the rule entries they show up as:

1           0        0 RETURN     all      *      *       ::/0
::/7                
2           0        0 RETURN     all      *      *       ::/0
::/8                

Which obviously doesn't catch the packets as ::/7 or ::/8 is not fc::/7 or
ff::/8

This is with ip6tables version:

ip6tables v1.4.15


Cheers.
Steve.



