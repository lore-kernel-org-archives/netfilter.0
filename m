From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: "-o" specifier in DNAT definition?
Date: 19 Apr 2003 13:19:29 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1050772769.21700.8.camel@alpha.newkirk.us>
References: <Pine.LNX.4.44.0304190750340.26698-100000@dell>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0304190750340.26698-100000@dell>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: iptables mailing list <netfilter@lists.netfilter.org>

On Sat, 2003-04-19 at 07:54, Robert P. J. Day wrote:
>   in a book i'm reading discussing (among other things),
> setting up DNAT, there is a sample rule:
> 
>   # iptables -t nat -A PREROUTING -i eth0 -o eth1
> 	-d <internal server IP address>
> 	-j DNAT --to-destination 192.168.0.1
> 
> the question: how can the explicit specification of the
> "-o" interface affect this?
>   
>   after all, it's quite possible that the interface that
> would normally be chosen to forward to the internal
> server would not be the one listed with "-o".  (perhaps
> the admin made a mistake.)
> 
>   if there is an obvious conflict here, what happens?
> does this DNAT just go unsatisfied?


Everything before "-j" is matching, the "-j" tells it what you want done
if the packet matches.  So the "-o" is simply testing which interface
the packet is targetted to go out.  

The problem here is that the "-o" match isn't valid in PREROUTING, since
(as the name implies) it takes place before the routing decision, so the
destination (obviously since this is where we can DNAT) and therefore
the outbound interface are still unknown.

So there IS a conflict here, between "-o" and PREROUTING in a sense, and
the result will be that the rule won't even be created.  If you try to
enter this rule manually you will be informed "Can't use -o with
PREROUTING".

> rday

j



