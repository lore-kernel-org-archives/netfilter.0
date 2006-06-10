From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: can i have boolean OR between multiple addresses in	iptables
	expression?
Date: Sat, 10 Jun 2006 06:56:21 -0400
Message-ID: <02b001c68c7c$837bf490$0419a8c0@fly>
References: <448A7604.6040701@plouf.fr.eu.org>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <448A7604.6040701@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 

> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org 
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
> Pascal Hambourg
> Sent: Saturday, June 10, 2006 3:34 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: can i have boolean OR between multiple addresses 
> in iptables expression?
> 
> I think that using a user defined chain is not only a matter of 
> obviousness, in some case the result may be different from using two 
> separate rules. For example :
> 
> iptables -A INPUT -s 127.0.0.1 -m limit -j ACCEPT
> iptables -A INPUT -s 172.16.0.0/24 -m limit -j ACCEPT
> 
> and :
> 
> iptables -A INPUT -s 127.0.0.1 -j user_chain
> iptables -A INPUT -s 172.16.0.0/24 -j user_chain
> iptables -A user_chain -m limit -j ACCEPT
> 
> behave differently because, if I understand correctly, each 'limit' 
> match has its own counters and timers. Am I right ?

Absolutely.  You do have to be certain to 'play computer' correctly when you
write the rules.  Know that each rule is an AND and apply OR's correctly
with judicious use of the -j ACCEPT target.
---
Pablo Sanchez - Blueoak Database Engineering, Inc
Ph:    819.459.1926          Toll free:  888.459.1926
Cell:  819.918.9731                Pgr:  pablo_p@blueoakdb.com
Fax:   603.720.7723 (US)           Fax:  514.371.1255 (Canada)


