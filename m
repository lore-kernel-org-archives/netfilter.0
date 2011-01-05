From: "Gurpreet Kaur" <G.Kaur@globallogic.com>
Subject: iptables hashlimit behaviour
Date: Wed, 5 Jan 2011 17:06:10 +0530
Message-ID: <C6BC71B0FE52F34DB131AA6993A023F6011997F5@ex2-del1.synapse.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I am new to iptables and currently working on hashlimit option.
Recently, I found a behaviour of iptables which is quite strange. When I
issue the following command :

iptables -A I_UDP_def_realm_4000 -m hashlimit --hashlimit-upto 6000
--hashlimit-burst 40 --hashlimit-mode srcip --hashlimit-name test -j
I_SYS_RATELIMIT_CHAIN

it take limit as 10000/s instead of 6000/s and this behaviour is for any
value greater than 5000. 

Also I have some observations like if I give 2000/s or 2500/s, it takes
the value as such but if I give 3000/s, it takes the value as 3333/s.
And any value above it, it takes it as 5000/s.

Please explain why iptables is behaving like this. Is it in algorithm
and the purpose for the same.

Thanks,
Gurpreet
