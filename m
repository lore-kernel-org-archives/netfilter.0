From: Jan Du Caju <Jan.DuCaju@kuleuven.net>
Subject: Re: Performance isues related to a large number of iptables rules
Date: Fri, 14 Jan 2005 00:14:55 +0100
Message-ID: <20050113231455.GA17451@kuleuven.net>
References: <41E6FA0E.2060707@intellitree.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <41E6FA0E.2060707@intellitree.com>
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
Content-Transfer-Encoding: 7bit
To: henry <info@intellitree.com>
Cc: netfilter@lists.netfilter.org

Hi,

On Thu, Jan 13, 2005 at 05:45:34PM -0500, henry wrote:
> I am curious what is the maximum number of iptable rules that can be 
> installed in a config before performance starts to be a problem. I have 
> looked into the possibility of using firewall rules to block "bad" 
> networks, but I have been told by most people that I have asked that 
> this is bad idea.
> 
> Here are my thoughts. If a packet matches the 3rd rule, does it matter 
> if there are 100,000 rules below it? 1,000,000 rules below it? If it 
> doesn't, then does the number of allowable rules really have to do with 
> how intelligently the rules are written, and more specifically, in what 
> order?

If you want to deal with large rule sets and/or high bandwidth you should
definitely consider hipac (http://www.hipac.org)

Quoted from the hipac web-site:
 iptables, like most packet filters, uses a simple packet classification
 algorithm which traverses the rules in a chain linearly per packet
 until a matching rule is found (or not). Clearly, this approach lacks
 efficiency. As networks grow more and more complex and offer a wider
 bandwidth linear packet filtering is no longer an option if many rules
 have to be matched per packet. Higher bandwidth means more packets per
 second which leads to shorter process times per packet.

 With nf-HiPAC we offer a novel framework for packet classification
 which uses an advanced algorithm to reduce the number of memory lookups
 per packet. It is ideal for environments where large rulesets and/or
 high bandwidth networks are involved. Thereby, the iptables' semantics
 of the rules is preserved, i.e. you can construct your rules like
 you're used to. From a user's point of view there is no need to
 understand anything about the HiPAC algorithm.

At the hipac site you will find a comparison with iptables. The central
firewall of our university ( http://www.kuleuven.ac.be/english/ ) uses 
hipac and we are very pleased with it. At the moment there is only an 
implementation for a 2.4 kernel but the developers are working on a 
2.6 version :-)

Hope this helps,
Jan
--------------------------------------------------- KULeuvenNet -------
Jan.DuCaju@kuleuven.net         http://www.kuleuven.net/e_index.html
K.U.Leuven                      http://www.kuleuven.ac.be/english/
LUDIT - KULeuvenNet             http://ludit.kuleuven.be/index_en.html
de Croylaan 52A                 3001 Leuven                     Belgium
-----------------------------------------------------------------------

