From: "Saeed Zamani" <szamani@concept.ae>
Subject: RE: Need help on NAT
Date: Wed, 11 Feb 2004 00:04:32 +0330
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000501c3f015$54460400$3c23d9d5@Zamani>
References: <1076414843.4028c97b900c7@www.realdealz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076414843.4028c97b900c7@www.realdealz.ch>
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
To: 'Fabian Hartmann' <realdeal@realdealz.ch>
Cc: netfilter@lists.netfilter.org


   Thank you all for alternative solutions. Good help for me.
Thanks,
Saeed Zamani.
-----Original Message-----
From: Fabian Hartmann [mailto:realdeal@realdealz.ch] 
Sent: Tuesday, February 10, 2004 3:37 PM
To: Saeed Zamani
Cc: netfilter@lists.netfilter.org
Subject: Re: Need help on NAT


hi Saeed
There is an iptables patch called "nth" which allows you to match every
Nth packet encountered. 
That includes load-balancing such as you desire like every 4 received
packet, 
SNAT first to the ip of ISP1, the other three to the ip of ISP2.

i. e.:  iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
             --every 4 --packet 0 -j SNAT --to-source $ISP1
        iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
             --every 4 --packet 1 -j SNAT --to-source $ISP2
        iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
             --every 4 --packet 2 -j SNAT --to-source $ISP2
        iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
             --every 4 --packet 2 -j SNAT --to-source $ISP2

have a look at this
http://cvs.netfilter.org/patch-o-matic-ng/nth/help?rev=1.2

It is available in the netfilter patch-o-matic base repository

---
Fabian Hartmann

realdeal@realdealz.ch
www.realdealz.ch




