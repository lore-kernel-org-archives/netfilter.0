From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: iptables -m time does not work
Date: Fri, 1 Nov 2002 08:20:48 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211010819590.19483-100000@localhost.localdomain>
References: <E187c2V-0001ft-00@kashyyyk.netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <E187c2V-0001ft-00@kashyyyk.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter mailing list <netfilter@lists.netfilter.org>

On Fri, 1 Nov 2002, Torsten Puls wrote:

> Hello	
> 
> My Problem
> After input of dis order I get the following error message:
> 
> iptables -A INPUT -m time --timestart 08:00 --timestop 16:00 --days Mon -j ACCEPT
> iptables: No chain/target/match by that name

ok, this is a new one -- i've never heard of the "-m time" match.
it's not documented anywhere in the man page that i can see.
is this part of a new release?

rday


