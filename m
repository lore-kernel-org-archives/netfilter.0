From: "D. Prima Prayudi" <prima@arc.itb.ac.id>
Subject: How do thing with this...
Date: Tue, 6 Apr 2004 18:16:43 +0700 (WIT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.BSF.4.50L0.0404061759341.4748-100000@arc.itb.ac.id>
References: <4072150B.8060400@tin.it> <200404052340.23077.Antony@Soft-Solutions.co.uk>
 <4072AFF2.1050007@tin.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4072AFF2.1050007@tin.it>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a gateway with the firewall function, it has 4 interfaces

			OUTSIDE NETWORK
			     ||
			    eth0
			167.205.30.75
	_____________________||________________________
    eth1		     eth2			eth3
167.205.102.0/26	167.205.102.64/27	167.205.102.128/27

the gateway just running SMTP and ssh, i want to log and prevent (as I
can) the port scan from the outside. I was able to slow down the nmap
from about 50 seconds to about 250 seconds from other host (from the
outside network) to my internal box (167.205.102.2)
Does somebody can tell me how to increase this (slow down the nmap), some
suggest will be good too...
Sorry for my english....

Regards, D. Prima Prayudi

IPv6-enabled
ARC-ITB 2001:d30:3:160::2/64


