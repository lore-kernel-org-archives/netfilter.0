From: "Robert P. J. Day" <rpjday@mindspring.com>
Subject: Re: counting packets and bytes
Date: Mon, 28 Oct 2002 12:22:27 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0210281220220.9215-100000@localhost.localdomain>
References: <200210281340.g9SDdxe08458@vulcan.rissington.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210281340.g9SDdxe08458@vulcan.rissington.net>
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

On Mon, 28 Oct 2002, Antony Stone wrote:

> If you want to put all your "targetless" rules in a single user-defined chain 
> (for example, called "counters"), and then jump to that chain from INPUT, 
> OUTPUT or FORWARD, it will not change the logic of your ruleset (no packets 
> will get ACCEPTed, DROPped or REJECTed - they will simply all fall out of the 
> end of your user-defined chain and then contineu as before), and you can get 
> a display only of these packets by listing only that chain, eg:
> 
> iptables -L counters -n -v -x

ah, it occurs to me to wonder -- if i create a separate user-defined chain
for a bunch of rules just for the purpose of counting packets for each 
rule, i don't *need* to have a target for those rules -- processing will
just continue until i run out of rules.

but if i *know* that the rules are mutually exclusive and that there will
be no overlap between them, i can add a RETURN jump at the end of each to
speed up the processing, right?

rday


