From: Fabien Germain <fabien.germain@gmail.com>
Subject: Re: Clearing conntrack? Extending size of conntrack?
Date: Fri, 30 Sep 2005 00:34:07 +0200
Message-ID: <20a523fb0509291534e7614b9@mail.gmail.com>
References: <433C67D4.9070907@cp.centennialcollege.ca>
Reply-To: Fabien Germain <fabien.germain@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433C67D4.9070907@cp.centennialcollege.ca>
Content-Disposition: inline
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

Hi,

On 9/30/05, James Strickland <jstic04@cp.centennialcollege.ca> wrote:
> Hello, usually after about a day up uptime on my router, the ppp
> connection to my isp stays alive, but packets are not forwarded and
> nated through wan/lan interfaces.  My guess is that the conntrack is
> getting too large over this time (my brothers node uses nonsense like
> kazaa and bear share).  Is there a way to increase the conntrack size,
> or to clear it via /proc?

You can set an higher value in /proc/sys/net/ipv4/ip_conntrack_max.
And to check the number of current tracked connections : cat
/proc/net/ip_conntrack | wc -l

Fabien

