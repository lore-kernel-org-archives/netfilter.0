From: Jim Laurino <JimLaur@acm.org>
Subject: Re: icmp messages to spoofed address acceptedby -m conntrack --ctstate ESTABLISHED,RELATED
Date: Fri, 19 Mar 2004 19:22:14 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040320002214.GA3373@salty>
References: <20040319204142.GA3294@salty> <200403192125.45552.Antony@Soft-Solutions.co.uk>
Reply-To: JimLaur@acm.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200403192125.45552.Antony@Soft-Solutions.co.uk> (from +nfcan+jimlaur+0fd5a9955d.Antony#Soft-Solutions.co.uk@spamgourmet.com on Fri, Mar 19, 2004 at 16:25:45 -0500)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter list <netfilter@lists.netfilter.org>

Hi,

Well, yes, but my question is not whether
someone is spoofing my ip, but whether
the iptables connection tracking code
should match the icmp packet if there
was no packet sent out.

Will someone explain whether the
match is the expected behavior of this rule,
or if this match is a misuse of the conntrack
module by me.

Or is this possibly a bug in connection tracking?

What is this icmp packet related to?
What established connection does it match?
Could this rule match other protocols?
Could this be a risk?

If it is a bug,
or if no one knows,
I will report it.

I am grateful for the effort that the developers
have put into creating and maintaining iptables,
and I am simply trying to do my part to help
with the maintainence.

By the way, Antony, thanks for the jokes.
I have been trying to recall that last one
for years. It never gets old, only I do.

Jim Laurino

