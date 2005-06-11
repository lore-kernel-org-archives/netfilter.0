From: Jason Opperisano <opie@817west.com>
Subject: Re: IMCP not returning
Date: Sat, 11 Jun 2005 11:58:25 -0400
Message-ID: <20050611155825.GA9624@bender.817west.com>
References: <1118504253.18567.1.camel@debianbox>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <1118504253.18567.1.camel@debianbox>
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

On Sat, Jun 11, 2005 at 06:37:33PM +0300, Sadus . wrote:
> Hello,
> I'm trying to ping to a host and its not answering from location 1, but
> it is answering from location 2, now when i ping from location 1, i can
> see on the host's logs that location 1 can reach the machine since i log
> icmp pings.
> 
> i still can't get replies from the box on location1 (i can ping any
> other machine on the net so my ISP doesn't block ICMPs)

you have a routing problem.  $host knows to get to $location_1, but
$location_1 doesn't know how to get back to $host (or has an invalid
route to to it).  start at $host with:

  ip route get $location_1

and follow the trail until it makes a wrong turn.

-j

--
"Quagmire: Hey Peter, you can't drink that outside. You're gonna end
 up in jail. And not the good jail you see on Cinemax. The man jail."
        --Family Guy

