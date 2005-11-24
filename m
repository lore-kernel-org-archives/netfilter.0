From: Bhavatosh <bhavatosh@gmail.com>
Subject: Re: IP issue
Date: Thu, 24 Nov 2005 12:52:34 +0530
Message-ID: <1132816954.25543.16.camel@bbhavatosh.blr.novell.com>
References: <20051123205900.47993.qmail@web30007.mail.mud.yahoo.com>
	<1132782410.5346.35.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1132782410.5346.35.camel@localhost>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: nnampoothiri@novell.com, netfilter@lists.netfilter.org

On Wed, 2005-11-23 at 16:46 -0500, John A. Sullivan III wrote:
> On Wed, 2005-11-23 at 12:58 -0800, Thamara Wanigatunga wrote:
> > Dear Gurus,
> > 
> > I need to have 4 web servers behind a iptables packet
> > filter, could i achive this through alised ips. Or
> > what could you recomend. Please help ..
> > 
> <snip>
> I assume you want each to have a unique public IP and perform NAT on the
> iptables firewall.  If that is the case, One typically adds the NAT
> rule(s), the access control rules in the FORWARD chain and binds the IP
> address to the public interface of the iptables firewall using iproute2.
> There is a slide show training session about using iproute2 in the
> training section of http://iscs.sourceforge.net
> Hope this helps - John

You can use the reverse proxy functionality of squid also.

With that create the acceleration services for all the web servers in
reverse proxy.

Regards,
Bhavatosh



