From: Jason Opperisano <opie@817west.com>
Subject: Re: FAQ about Firewall
Date: Mon, 10 Jan 2005 09:59:56 -0500
Message-ID: <1105369195.12623.8.camel@hubcap.ljm.dom>
References: <41E29642.87D02987@ita.org.mo>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <41E29642.87D02987@ita.org.mo>
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

On Mon, 2005-01-10 at 09:50, edwardspl@ita.org.mo wrote:
> Dear All,
> 
> Can we setup Server behind Firewall ( actually, it is the same machine :
> Server + Firewall ) by using iptables ?

yes.  if the server/firewall is the same machine, you will make use of
the INPUT chain to allow connections in to the machine.

-j

--
"Oh, people can come up with statistics to prove anything, Kent. 14%
 of people know that."
	--The Simpsons


