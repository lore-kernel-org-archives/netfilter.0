From: Tomas Edwardsson <netfilter@tommi.org>
Subject: Re: Connection Rate Limiting
Date: Thu, 15 May 2003 19:15:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030515191547.GA13517@ok.is>
References: <Pine.GSO.4.44.0305150852190.7322-100000@dudester.spoontail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.GSO.4.44.0305150852190.7322-100000@dudester.spoontail.com>
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
Content-Transfer-Encoding: 7bit
To: Daniel David Benson <dan@spoontail.com>
Cc: netfilter@lists.netfilter.org

On Thu, May 15, 2003 at 08:58:25AM -0700, Daniel David Benson wrote:
> 
> Hopefully this one hasn't been answered before.  We need to rate
> limit on a per source IP address to port 80.  We are seeing certain
> web servers suffer from resource starvation under a DDOS attack.
> The solution to this problem is rate limit the number of
> connections any source IP address can make.  Is this possible
> to do with iptables?  I have searched just about everything and
> I can't seem to find anything.  I know I can do traffic shaping
> with iproute2, but I don't think that is the direction I want
> to take.

I believe that a iplimit from the patch-o-matic would serve you in
this. A part of the description:

This adds CONFIG_IP_NF_MATCH_IPLIMIT match allows you to restrict the
number of parallel TCP connections to a server per client IP address
(or address block).

Examples:

# allow 2 telnet connections per client host
iptables -p tcp --syn --dport 23 -m iplimit --iplimit-above 2 -j REJECT


====
Tomas Edwardsson
HP Unix - Technical Support \  HP Unix Certified System Administrator
Red Hat Technical Support    \  Red Hat Certified Engineer.
Opin Kerfi

