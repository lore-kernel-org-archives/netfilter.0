From: Ralf Spenneberg <lists@spenneberg.org>
Subject: Re: port 113 ?
Date: Thu, 13 Jan 2005 09:20:53 +0100
Message-ID: <1105604452.3624.11.camel@bibo.spenneberg.de>
References: <41E62A5A.9000106@eccotours.biz>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E62A5A.9000106@eccotours.biz>
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
To: Brent Clark <bclark@eccotours.biz>
Cc: iptables <netfilter@lists.netfilter.org>

Am Do, den 13.01.2005 schrieb Brent Clark um 8:59:
> Soo I would like to know, if it is advisable to stop identd. I have
> googled abit and from what I gather, its considered as dangerous and
> basically pointless to run. By removing / stopping this service, will it
> hamper hinder my users, other servers in any other way. I only run a
> mail and ftp server.
Yes you can stop it. It is not used by your ftp or mail server. Since it
might be used by remote ftp or mailservers you are connecting to, you
should take care that the packets destined at port 113 are not dropped
but rejected (default, if no firewall is running). Otherwise you can
experience delays.

Ralf
-- 
Ralf Spenneberg <lists@spenneberg.org>


