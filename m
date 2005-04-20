From: Filipe Abrantes <fla@inescporto.pt>
Subject: Re: UDP nat question
Date: Wed, 20 Apr 2005 17:11:49 +0100
Message-ID: <42667F45.5000502@inescporto.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

First of all, thanks for replying, it's clear now.

I have one more question related to this:

Imagine a host behind NAT with IP 192.168.22.33 which has an application 
on port 5060 ( a sip client) and opens a connection to a server outside 
the NAT (the sip registrar with IP 130.11.22.33 on port 5060), and 
consider that the NAT box translates the SIP client src_ip to 
129.11.22.33 and src_prt to 5054, for this communication.

The SIP registrar is able to reach the SIP client running on 
192.168.22.33:5060 by using 129.11.22.33:5054, but what about other 
hosts on the Internet? Will they also be able to reach the SIP client 
using the pair 129.11.22.33:5054, or only packets coming from the SIP 
registrar be accepted?

Thanks again

Filipe Abrantes

-- 
Filipe Lameiro Abrantes
INESC Porto
Campus da FEUP
Rua Dr. Roberto Frias, 378
4200-465 Porto
Portugal

Phone: +351 22 209 4266
E-mail: fla@inescporto.pt


