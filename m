From: Maximilian Wilhelm <max@rfc2324.org>
Subject: Re: Problems with the ROUTE extension on a 2.6.18 or 2.6.19 Kernel
Date: Wed, 17 Jan 2007 17:27:08 +0100
Message-ID: <20070117162708.GD14333@outback.rfc2324.org>
References: <87ABB5B9BD11A240B9CBB3F0485AEC8901509E2F@IMCSRV4.MITRE.ORG>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <87ABB5B9BD11A240B9CBB3F0485AEC8901509E2F@IMCSRV4.MITRE.ORG>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Am Mittwoch, den 17 Januar hub Feighery, Patrick D. folgendes in die Tasten:

> I have an application that makes use of the ROUTE extension which has
> been running on a 2.6.17 kernel for some time now.  I am trying move
> this app to either a 2.6.18 or a 2.6.19 based kernel.  This requires
> getting the ROUTE extension to work with that kernel. 
 
> I started with a 2.6.18.2 kernel and iptables version 1.3.6 after I
> applied patch-o-matic and rebuilt the kernel, I tried something simple
> like

> 	iptables -t ROUTE -F
[...]

Are you sure that this has worked before?
As far as I know ROUTE is a target (to be used via -j ROUTE) and *not*
an iptables *table* like filter, nat, mangle or raw.

Maybe 
$ iptables -j ROUTE --help
is a starting point?

So the question is what have you done with older kernels regarding the
ROUTE target and if *that* is still working.

Ciao
Max
-- 
	Follow the white penguin.

