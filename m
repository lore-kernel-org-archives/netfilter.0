From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: FW: Linux Firewall Problem
Date: Tue, 22 Nov 2005 06:52:29 -0500
Message-ID: <1132660349.2681.2.camel@localhost>
References: <08ABA55F2AFD764F93022E0FEBD4DB8D2EF416@server.cambridge.brahler-ics.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <08ABA55F2AFD764F93022E0FEBD4DB8D2EF416@server.cambridge.brahler-ics.co.uk>
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
To: Paul Collen <paul.collen@brahler-ics.co.uk>
Cc: netfilter@lists.netfilter.org

On Tue, 2005-11-22 at 11:23 +0000, Paul Collen wrote:
> Hello,
> 
> I'm new to Linux and I've inherited a Webmin controlled firewall. I'm
> used to using a SonicWall firewall and just can't seem to get the hang
> of the Linux firewall. My problem is I need to allow Outlook Web Access
> through to a server. OWA is installed and can be used internally by
> going to the server i.e. http://server/exchange We have an IP address I
> can use to connect with but I just can't seem to let any traffic through
> to the server, let alone just port 80 and 443. Are there any firewall
> gurus that can give me some help please?
<snip>
I was in a similar position many years ago and found there are excellent
tutorials available to help one understand iptables.  In most cases, I
found it to be far more powerful and flexible than other proprietary
systems.  Many tutorials are listed on the netfilter web site.  There is
an excellent one at
http://iptables-tutorial.frozentux.net/iptables-tutorial.html
You can also find some training slide shows in the training section of
http://iscs.sourceforge.net although these are a little out of date.
Good luck and welcome to the world of netfilter and iptables! - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


