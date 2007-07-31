From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Multiple PPTP connections from same public IP ?
Date: Wed, 01 Aug 2007 00:12:51 +0200
Message-ID: <46AFB3E3.4050505@plouf.fr.eu.org>
References: <46AFAB54.5020602@pason.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46AFAB54.5020602@pason.com>
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

Hello,

Michael Gale wrote :
> 
> Am I correct that mutliple GRE (proto 47) tunnels would be a problem 
> when the clients have the same IP address ?

Yes, unless the NAT in "firewall A" has PPTP support.

> We are running the standard kernel 2.6.9-42.0.3.EL.

On "firewall A" ? If so, can't you use a more recent kernel ? PPTP 
conntrack and NAT support, formerly in the patch-o-matic-ng, was added 
in the mainline kernel in version 2.6.14.

