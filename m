From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: How would I go about doing this?
Date: Mon, 17 Oct 2005 15:33:20 -0400
Message-ID: <1129577600.2583.62.camel@localhost>
References: <20051017133705.00001114@mwc-acomputer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051017133705.00001114@mwc-acomputer>
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
To: "Zane C. B." <zanecb@midwest-connections.com>
Cc: netfilter@lists.netfilter.org

On Mon, 2005-10-17 at 13:37 -0500, Zane C. B. wrote:
> I have two routers. The main router than everything goes through and a
> second router that I want to route some traffic through depending on the
> originating IP#.
> 
> The second router has filtering and the like running on it.
> 
> For traffic coming from a specific IP# and hitting the main router, I
> want it then to be routed out through the second router.
> 
> Currently I got it working for port 80, using iptables, since squid is
> setup transparently on the filtering router. The command I am using is
> this... iptables -t nat -A PREROUTING -s <machine to filter for> -p tcp
> --destination-port 80 -j DNAT --to-destination <filtering router>. This
> works, but only for like web or the like which has a transparent squid
> setup to take care of it.
> 
> That works for right now, but what I want to accomplish is to have the
> main router kick packets, from specified IP#, out to the secondary
> router.
> 
If I understand you correctly, iproute2 is your friend.  You can
probably find the documentation on it in a file in your distribution
named ip-cref.ps.  You can also find a training slide show in the
training section of the ISCS open source network security management web
page (http://iscs.sourceforge.net).  Hope this helps - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


