From: Jason Opperisano <opie@817west.com>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 08:47:15 -0500
Message-ID: <1105537635.3751.22.camel@hubcap.ljm.dom>
References: <20050112083023.42281.qmail@web26109.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050112083023.42281.qmail@web26109.mail.ukl.yahoo.com>
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

On Wed, 2005-01-12 at 03:30, Roland Kaeser wrote:
> Hi all
> 
> I know this was subject of many conversations, but I need this feature very
> urgently!

1) the string match is a toy for firewall kiddies to play with.  it
offers nothing of any value to real packet data inspection situations. 
the lack of effort to port it to 2.6 is a reflection of this fact.

2) if this a mission-critical need (definition:  without the string
match on a 2.6 kernel, people will die), you are certainly free to port
it or rewrite yourself--the code is there.  if you don't have the skill
to code it yourself--pay someone who does; after all, people's lives are
at stake here.

since i don't want to be partly responsible for the spilling of innocent
blood--have you looked at snort-inline [1]?  snort offers the things
that real packet data inspection requires:  fragment reassembly,
matching across packets, matching at a specific locations in a packet,
matching multiple strings within a packet, understanding of connection
flow, context-specific matching, layer 7 protocol decoding and
normalization, pcre matching...and those are the ones i can think of off
the top of my head.

the string match is rice [2].

-j

[1] http://snort-inline.sourceforge.net/index.html
[2] http://funroll-loops.org/

--
"Ah, beer, my one weakness. My achilles heel, if you will."
	--The Simpsons


