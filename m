From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: new nat target extension --jump rt_lookup
Date: Mon, 28 Jul 2003 09:44:44 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030728134444.GA16640@cannon.eng.us.uu.net>
References: <1059223007.1604.11.camel@drs0.manchotnetworks.net> <20030727004019.GB2152@cannon.eng.us.uu.net> <1059335645.1447.6.camel@drs0.manchotnetworks.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1059335645.1447.6.camel@drs0.manchotnetworks.net>
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
To: "lartc@manchotnetworks.net" <lartc@manchotnetworks.net>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter <netfilter@lists.netfilter.org>

Hello Charles,

> > > can anyone comment on potential problems/dangers/issues from such a
> > > --jump?
> > 
> > An infinite loop, maybe? Also, OUTPUT is before routing anyway...
> Actually it is not [1], and thusly, the source of many of my problems. I

OK. According to Stef's diagram it is after routing (it might explain why
DNAT in OUTPUT was broken in the beginning). Unless there is some hack
for DNAT in OUTPUT to make it work, I don't understand how the routing
of the new DNAT'ed packet works then...

> am very curious though, about your thought of a loop -- could you give a
> bit more detail? i *thought* that a lookup would have been independant
> from netfilter

Well, what I said about the infinite loop, is just a thought. I have
actually not looked in the code to see whether your assumption is correct.

I think your best bet would be the devel mailing list (where the people
with a good insight of the actual code and the internals could help you).

Good luck and please let us know your findings.

Ramin


> -- that is -- that the packet would be checked with its
> fwmark, src ip, dst, ip, etc, and an interface determined (and perhaps a
> new src ip) ...
> 
> many thanks for your thoughts
> 
> charles
> 
> [1] http://www.docum.org/stef.coene/qos/kptd/
> 

