From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 11:50:01 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030916155001.GE16559@cannon.eng.us.uu.net>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew> <200309161256.15286.gdh@acentral.co.uk> <1063716386.31093.160.camel@raylinux.internal> <20030916131153.GA16559@cannon.eng.us.uu.net> <1063720447.31093.166.camel@raylinux.internal> <20030916141505.GB16559@cannon.eng.us.uu.net> <plopm3isnshj1n.fsf@drizzt.kilobug.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <plopm3isnshj1n.fsf@drizzt.kilobug.org>
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
To: =?iso-8859-1?Q?Ga=EBl?= Le Mignot <kilobug@freesurf.fr>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

>  > OK. If you recompile without conntrack, can you do NAT? I'm just wondering?
> 
> no, Netfilter's NAT relies upon the conntrack.
> 
> Can I ask you why do you want  to turn off the conntrack?

I don't. I just wanted to learn from the people who were saying "just don't
load the ip_conntrack..."

Ramin

> If it's for
> speed or memory  reasons, then using NAT will  have a similar overhead
> (maybe  not exactly  the same,  but similar)  anyway. When  you  NAT a
> connection, you're  forced to  keep track of  the connection a  way or
> another, to NAT further packets of the connection the same way.

