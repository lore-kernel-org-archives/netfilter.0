From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: Forward with IPTABLES
Date: Thu, 13 Jan 2005 09:38:05 +0100
Message-ID: <1105605485.3624.14.camel@bibo.spenneberg.de>
References: <001a01c4f8f9$9de78f00$0100a8c0@betasvr.noip.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <001a01c4f8f9$9de78f00$0100a8c0@betasvr.noip.org>
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
To: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Hi,

Am Mi, den 12.01.2005 schrieb Guillermo Javier Nardoni um 23:54:
> we have 2 domains hosted by our servers (www.domainA.com and
> www.domainB.com)
> when a customer asks for a webpage (through ppp0) port 80 at www.domainA.com
> i want to redirect it to our Windows 2000 server (it domain is written in
> ASP), but when some customers ask for a webpage from the other one (domainB)
> the page must flow-back  to the customer from linux server instead of
> Windows.
If both domain have different IP adresses you can do it with DNAT using
iptables.
If both domain share the same IP address you need a reverse proxy.

Ralf
-- 
Ralf Spenneberg <lists@spenneberg.org>


