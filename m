From: Chris Brenton <cbrenton@chrisbrenton.org>
Subject: Re: iptables scripts
Date: 31 Oct 2003 08:11:13 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067605873.1137.62.camel@valhalla>
References: <Pine.LNX.4.44.0310310723500.6263-100000@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0310310723500.6263-100000@localhost.localdomain>
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
To: "Robert P. J. Day" <rpjday@mindspring.com>
Cc: Gilles Yue <gyue@novelgmt.intnet.mu>, iptables mailing list <netfilter@lists.netfilter.org>

On Fri, 2003-10-31 at 07:26, Robert P. J. Day wrote:
>
> for the iptables tutorial i was talking about that i'm giving on monday,
> here's the first part of my script, just to show folks what they can do:

This is *totally* cool. Thank you for sharing this with the list! :)

The only thing I would add would be:
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables --table nat --flush

or what ever you need. This way you can run it from the command line and
clear out all existing rules before you write everything back in.

HTH,
C



