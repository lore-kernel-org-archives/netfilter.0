From: Stephen Satchell <list@satchell.net>
Subject: Re: Macimum number of rules?
Date: Tue, 02 Mar 2004 06:29:57 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078237796.11375.3.camel@ssatchell1.pyramid.net>
References: <47D438A0510BD611B9470002A58EDAE704DE64CF@mchh2a6e.mchh.siemens.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <47D438A0510BD611B9470002A58EDAE704DE64CF@mchh2a6e.mchh.siemens.de>
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
To: Stindl Wolfgang EXT <Wolfgang.Stindl.extern@icn.siemens.de>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Why so many rules?  Are you using a single rule per IP address to
implement a blocking filter?

My logic for dealing with the problem is simple:

Allow up to three rules per /24
On the fourth rule applied to a particular /24, assume that the whole
neighborhood has gone to pot and collapse four rules to one /24 rule.

As you find multiple rules blocking adjacent /24 rules, consolidate
them.

Pretty soon you will find you have ONE rule for 200.0.0.0/8, or perhaps
even 200.0.0.0/7.  There are other large blocks that will come out of
the process.

And you won't miss 'em, either.

On Tue, 2004-03-02 at 01:35, Stindl Wolfgang EXT wrote:
> Hi,
> 
> We are running a quite big iptables-Firewall with about 34000 rules.
> Since today we cannot add any new rules.
> All we get is a Memory allocation Problem.
> 
> When we delete a rule, we can add 1 new rule. So is there a maximum
> number?
> 
> The firewall box is an dual xeon with 1 GB memory (most is still free)
> 
> So is there anything we can do?
> 
> Thanks a lot
> Wolfgang
> 


