From: Jason Opperisano <opie@817west.com>
Subject: Re: Port 25
Date: Sun, 06 Feb 2005 16:03:28 -0500
Message-ID: <1107723808.4679.44.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.05.10502061541590.352-100000@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.05.10502061541590.352-100000@darkstar.sysinfo.com>
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

On Sun, 2005-02-06 at 15:44, R. DuFresne wrote:
> It's very likely the other systems sending in e-mail are hanging waiting
> on ident, port 113, try either allowing ident to pass or setting a REJECT
> on attempts to that port and see if that helps, and you might well get
> hung with DNS lookups with newer sendmails. Make sure the sendmail server
> can reach out and touch the DNS tree.

Ron has an excellent point here about IDENT.  a "good Internet citizen"
thing to do when running a mail server is to reject ident instead of
dropping it:

  iptables -A INPUT -p tcp --syn --dport 113 \
    -j REJECT --reject-with tcp-reset

-j

--
"Getting out of jury duty is easy. The trick is to say you're
 prejudiced against all races."
	--The Simpsons


