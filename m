From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: RE: AW: default policy
Date: Sun, 3 Nov 2002 04:23:13 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0211030420260.14561-100000@dell>
References: <NEENJAPFEAIEMGMNIGFLEEAMCEAA.mrboboo@yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <NEENJAPFEAIEMGMNIGFLEEAMCEAA.mrboboo@yahoo.com>
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

On Sat, 2 Nov 2002, Rob wrote:

> 
> 
> >>> > You should never set any default policy other than ACCEPT on
> >>> > a nat or mangle table.
> >>> >
> >>> > I sometimes think it was a bad idea even to make it possible.
> >>>
> >>> No, I don't think so. It's hard for beginners, yes. But once
> >>you understand
> >>> what iptables is capable of (compared to other commercial products) you
> >>> actually are glad that there is a product giving you control over
> >>> everything.
> >>> Defining the policies for every chain is such a freedom.
> >>
> >>Can you think of a situation where it would be a good idea to set
> >>a default
> >>policy other than ACCEPT for a nat or mangle table ?
> >>
> >>Antony.

perhaps i missed an earlier response to this, but what is the
effect of setting a DROP policy on a nat or mangle chain?
does this mean that any packet that matches a mangle or nat rule
will be, not mangle'd or nat'ed, but dropped?  

sorry if this question has an obvious answer, but assigning a
default policy to anything but the filter table is woefully
under-documented.

rday


