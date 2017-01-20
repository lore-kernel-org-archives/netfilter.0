From: Mark Coetser <mark@pkfnet.co.za>
Subject: intermittent nat issue
Date: Fri, 20 Jan 2017 08:24:58 +0200
Message-ID: <6a6cc500-9c8a-4075-f856-fb5d90f0571b@pkfnet.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi All

kernel 3.16.0-4-686-pae
iptables 1.4.21-2+b1

I have a few different firewalls that are exhibiting the same issue

basic rule iptables -t nat -I POSTROUTING -o $external_iface -j MASQUERADE

when running tcpdump on $external_iface I am seeing SOME packets from 
the private_network not being masqueraded/natted.

-- 
Thank you,

Mark Adrian Coetser
mark@pkfnet.co.za

"Help save the world!"              -- Larry Wall in README

