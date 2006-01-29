From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: Completely Bypassing a Firewall?!
Date: Sat, 28 Jan 2006 23:31:13 -0500
Message-ID: <1138509073.2883.45.camel@localhost>
References: <1138198038.16454.73.camel@localhost.localdomain>
	<33402.138.106.11.116.1138351847.squirrel@intern.southpole.se>
	<43DA3441.5090901@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DA3441.5090901@gmx.net>
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
To: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Cc: netfilter@lists.netfilter.org, Jimmy Hedman <jimmy.hedman@southpole.se>

On Fri, 2006-01-27 at 15:54 +0100, Carl-Daniel Hailfinger wrote:
> Jimmy Hedman schrieb:<snip>
> > 
> > If you have someone at the "inside" there is no problem to create tunnels
> > with for example OpenVPN that completly "bypasses" the firewall. If you
> > create a tunnel with OpenVPN over https and bridge the networks together
> > you could get everything through with the traffic looking just like
> > ordinary https-traffic.
> > But with only access from the outside it is very vary hard, if not
> > impossible.
> 
> Yes, but finding a sufficiently naive user will probably be easy. I wrote
> such a tool myself (but it used a few java quirks), so if you can get
> somebody inside to click on something you present him, every other defense
> (except cutting the wire physically or logically) is worthless. Hey, you
> could even use the WMF exploit for such a purpose.
<snip>
This is one of the big reasons why we started the ISCS project
(http://iscs.sourceforge.net).  In the ISCS model, even if a remote user
(or internal user for that matter) was completely compromised and an
intruder merrily poised at their console, the intruder can still only do
what the user can do and the user can be restricted at the network level
to access on an as needed basis.  In other words, it is very easy in
ISCS to say something like "sales staff has access to only sales data".
If a sales person's computer is compromised, it cannot be used to try to
access administrative functions or executive data or anything that a
sales user is not allowed to access - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


