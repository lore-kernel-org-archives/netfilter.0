From: Robert Nichols <rnicholsNOSPAM@comcast.net>
Subject: Re: IP determines output interface?
Date: Thu, 25 Aug 2005 10:19:46 -0500
Message-ID: <deknij$h6t$1@sea.gmane.org>
References: <E1E7vZe-00041g-00@smtp0.herald.ox.ac.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <E1E7vZe-00041g-00@smtp0.herald.ox.ac.uk>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Paul Lewis wrote:
> Hi,
> 
> I'm working on a new system for the college I work at. We have two types of
> users who connect - students and conference guests. Students connect to the
> internet through an academic LAN, but technically conference guests are not
> allowed to use this. So, we have a separate ADSL line for conference guests.
> 
> Now, we have a DHCP system which assigns static IPs to our clients via DHCP
> (so not really static, but for our purposes they are). Conference guests get
> put in a different range to the students, although they can all see each
> other.
> 
> Now, what I want to do, is set a few rules on the firewall so that I can
> determine which output interface a packet goes out on, depending on the IP
> it got sent in on, i.e I want conference guests with conference IP addresses
> to be directed out to the ADSL line, and students with student IP addresses
> to be directed out to the academic LAN.

This isn't a firewall issue.  It's a routing problem that can be
handled via routing policy database management.  Take a look at the
manpage for the 'ip' command and the "ip rule" section in particular.

-- 
Bob Nichols         Yes, "NOSPAM" is really part of my email address.


