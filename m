From: Les Mikesell <les@futuresource.com>
Subject: Re: traffic graphing?
Date: Fri, 20 Aug 2004 17:39:16 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1093041555.26367.6.camel@moola.futuresource.com>
References: <41267935.2040008@leaplab.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <41267935.2040008@leaplab.com>
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
To: Dave Barnum <dave@leaplab.com>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-08-20 at 17:20, Dave Barnum wrote:
> What would you guys suggest for a good traffic monitoring/graphing 
> sollution for a iptables (shorewall) firewall?

I haven't used it specifically with shorewall, but cacti
http://www.raxnet.net/products/cacti/ is nice with anything
that you can monitor with snmp.  It is a php web tool to
set collection of data and view the graphs.

---
  Les Mikesell
    les@futuresource.com



