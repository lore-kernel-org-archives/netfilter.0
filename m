From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: Generating TCP traffic!!
Date: Sat, 04 Jun 2005 16:34:23 -0400
Message-ID: <1117917263.2143.18.camel@grendel>
References: <42a05192.138faab2.0b46.6bc8SMTPIN_ADDED@mx.gmail.com>
	<9927912d050604105027288759@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050604105027288759@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sat, 2005-06-04 at 13:50, Visham Ramsurrun wrote:
> Hi to all,
> 
> I would like to know if there's any tool or software that can be used
> to generate packets of different protocols like TCP, UDP, ARP ....

For basic stuff (TCP/UDP) nmap is probably the easiest. For hard core
packet crafting, my personal favorite is hping:
http://www.hping.org/

HTH,
Chris



