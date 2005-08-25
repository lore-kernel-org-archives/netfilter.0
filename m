From: Trevor Cordes <netfilter@tecnopolis.ca>
Subject: Re: ipsec + nat
Date: Wed, 24 Aug 2005 22:22:20 -0500
Message-ID: <20050825032220.GA23455@pog.tecnopolis.ca>
References: <20050803161233.564n1ykio08k800s@www.milivojevic.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050803161233.564n1ykio08k800s@www.milivojevic.org>
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
To: Aleksandar Milivojevic <alex@milivojevic.org>
Cc: netfilter@lists.netfilter.org

On Wed, Aug 03, 2005 at 04:12:33PM -0500, Aleksandar Milivojevic wrote:
> 
> and than try to ping 10.3.2.1, things do not work anymore.  Tcpdump on ppp0
> shows (edited for clarity):
> 
> Bug in Netfilter, or bug in my configuration?

Look at my bugzilla on ipsec+nat bugs :

https://bugzilla.redhat.com/bugzilla/show_bug.cgi?id=143374

see if that's the problem.  If not, shoot me an email and I'll look your
problem over.  If it is the problem, please make noise & cc yourself on
the bugzilla so we can get this fixed.

