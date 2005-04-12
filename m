From: Jason Opperisano <opie@817west.com>
Subject: Re: stop uptime and name + version querying
Date: Tue, 12 Apr 2005 09:14:13 -0400
Message-ID: <20050412131413.GA26215@bender.817west.com>
References: <425B9FCE.7050105@eccotours.dyndns.org>
	<20050412124818.GA26130@bender.817west.com>
	<425BC8F8.5060905@eccotours.dyndns.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <425BC8F8.5060905@eccotours.dyndns.org>
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
To: netfilter@lists.netfilter.org

On Tue, Apr 12, 2005 at 03:11:20PM +0200, Brent Clark wrote:
> [root@ns modules]# sysctl net.ipv4.tcp_timestamps
> net.ipv4.tcp_timestamps = 1
> [root@ns modules]#
> 
> Why
> Is this something I can learn from (HOPE SO).
> 
> Thanks
> Brent Clark
> 
> P.s. How do I do this (sysctl net.ipv4.tcp_timestamps)  on a Debian box

man 8 sysctl would be a good place to start for that answer, but...

  sysctl -w net.ipv4.tcp_timestamps=0

would be a good start.  see if that helps with the nmap uptime query.

if so, add the setting to /etc/sysctl.conf (man 5 sysctl.conf for syntax)
to survive reboots.

-j

--
"Peter: At least they don't put their feminine ointments next to the
 mustard, Lois. That was the worst hot dog I ever ate."
        --Family Guy

