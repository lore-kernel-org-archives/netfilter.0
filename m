From: Kevin McConnell <kevymac@yahoo.com>
Subject: Re: Static NAT
Date: Thu, 13 Feb 2003 08:08:29 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030213160829.46237.qmail@web40306.mail.yahoo.com>
References: <30cd12e6eb.2e6eb30cd1@student.uml.edu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <30cd12e6eb.2e6eb30cd1@student.uml.edu>
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
Content-Transfer-Encoding: 7bit
To: William Olbrys <william_olbrys@student.uml.edu>, netfilter@lists.netfilter.org


--- William Olbrys <william_olbrys@student.uml.edu>
wrote:
> echo -n "setting nat rules"
> $IPTABLES -t nat -A PREROUTING -s 0.0.0.0/0 -d
> 129.63.106.11 -j DNAT
> --to-destination 192.168.2.2
> $IPTABLES -t nat -A POSTROUTING -s 192.168.2.2 -d
> 0.0.0.0/0 -j SNAT
> --to-source 129.63.106.11
> echo " Done"
> 
> is this really possible?

Those rules look fine. What do you have in your
FORWARD chain?


=====
Kevin C. McConnell --RHCE-- <Red Hat Certified Engineer>

__________________________________________________
Do you Yahoo!?
Yahoo! Shopping - Send Flowers for Valentine's Day
http://shopping.yahoo.com

