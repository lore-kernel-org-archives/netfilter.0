From: Ryan Kruse <rkruse@alterpoint.com>
Subject: RE: simple port translation on the localhost / local loopback
Date: Thu, 27 Mar 2008 18:17:18 -0500
Message-ID: <B48CB61665A101419E226D4D141D540E03035231CC@mail-server.inside.eclyptic.com>
References: <20080327211643.B37CA78C86@gam.mel.teaser.net>
Mime-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080327211643.B37CA78C86@gam.mel.teaser.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

This is how I redirect 10443 to 443.  You have to NAT it back to another host, which will just be your machines IP.  You should be able to sub in your server IP and DNS ports.

host=10.100.32.53
/usr/sbin/iptables -t nat -A OUTPUT -d localhost -p tcp --dport 443 -j REDIRECT --to-ports 11443
/usr/sbin/iptables -t nat -A OUTPUT -d $host -p tcp --dport 443 -j REDIRECT --to-ports 11443
/usr/sbin/iptables -t nat -A PREROUTING -d $host -p tcp --dport 443 -j REDIRECT --to-ports 11443

Ryan Kruse
www.ziptie.org

-----Original Message-----
From: netfilter-owner@vger.kernel.org [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Noino
Sent: Thursday, March 27, 2008 4:17 PM
To: netfilter@vger.kernel.org
Subject: simple port translation on the localhost / local loopback

Hi, List !

I wish to submit to you experts an apparently simple problem involving port address translation on the localhost/local loopback, which I've tried and tried and read and couldn't find an authoritative answer for.

Setup: Linux SUSE w/ kernel 2.6.5. Iptables v. 1.2.9.
Have a relay DNS listener on UDP port 10053.
Most DNS clients only know to contact a DNS server on port 53 though.

Problem: using netfilter/ip divert packets from local clients to hit port
10053 instead of 53, and of course responses should come back to requesters appearing as though coming from port 53. This is very elementary PAT, but ... whatever I've tried using iptables, either one of two equally incorrect things happen :

 - (DNAT) requests hit the server, but the port number in replies in untouched hence replies are ignored, or
 - (SNAT) replies disappear in the ether & requesoer times out...

Searching found that, maybe, a kernel option : CONFIG_IP_NF_NAT_LOCAL should be necessary for PAT to work on the local host; can you confirm that it would indeed work if I were to recompile my kernel with that option set ?
Further search seemes to imply that this option was removed from later kernels altogether, which gets even more confusing...

Can you help me set up the very basic port translation I need, using my existing software if at all possible ?

What alternative options exist ? I've read about a thing called "Fast-NAT", which unfortunately also seems to have been broken even before the 2.6 kernels. Is linux following the lead of the "other" OS in carelessly breaking things along the road? \\\\\\\\\rub-out last question.

Regards,

--
Noino

--
Noino

--
To unsubscribe from this list: send the line "unsubscribe netfilter" in the body of a message to majordomo@vger.kernel.org More majordomo info at  http://vger.kernel.org/majordomo-info.html
