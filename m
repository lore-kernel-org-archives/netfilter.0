From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack and PREROUTING
Date: Fri, 20 Jun 2008 16:18:14 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0806201617410.11250@fbirervta.pbzchgretzou.qr>
References: <624017.96549.qm@web52002.mail.re2.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <624017.96549.qm@web52002.mail.re2.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Doug Kehn <rdkehn@yahoo.com>
Cc: netfilter@vger.kernel.org


On Friday 2008-06-20 14:49, Doug Kehn wrote:
>
>The connections do hang if I change the rule to:
>
>iptables -t raw -A PREROUTING -d ! 192.168.2.0/255.255.255.0 -i eth0
>-p tcp -m tcp --tcp-flags FIN,SYN,RST,ACK ACK -m tcp --dport 80 -j
>NOTRACK
>
>This makes sense, I believe, because the ACK to the SYN-ACK wouldn't
>be tracked and the connection state would never reach ESTABLISHED.

The connection is established once conntrack sees the SYNACK.
