From: Lindsay Snider <lindsay@pa.net>
Subject: Re: Resource temporarily unavailable
Date: Tue, 16 Nov 2004 17:03:45 -0500
Message-ID: <200411161703.45423.lindsay@pa.net>
References: <200411161629.00497.lindsay@pa.net>
	<1100641070.3695.44.camel@hubcap.ljm.dom>
Reply-To: lindsay@pa.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1100641070.3695.44.camel@hubcap.ljm.dom>
Content-Disposition: inline
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

> > Addition info:
> > iptables add/remove rate is averaging 64.5 / minute
> >
> >
> > Lindsay
>
> save your rules via ipables-save and load your rules via
> iptables-restore.
>
> refer to this previous post on the efficiency gains:
>
>   http://marc.theaimsgroup.com/?l=netfilter&m=109897603213467&w=2


Using save and load works to get started but the the rules change at about 1 
per second as the program tracks people attacking our mail system.  Perhaps I 
could insert and delete rules in groups commiting every n seconds.  Do you 
know if the iptables rules gained more overhead in the 2.6 kernel?

Maybe splitting the rules among multiple chains would help.  There seems to be 
an increasing insertion time depending on a chain length.  -I <chain> 1 and 
-A <chain> seemed to have the same runtimes but does anyone know if one 
performs better then the other?

