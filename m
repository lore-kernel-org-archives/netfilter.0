From: Sebastian Siewior <bigeasy@foo.fh-furtwangen.de>
Subject: Re: Prevent traceroutes
Date: Fri, 20 May 2005 19:17:38 +0000
Message-ID: <20050520191738.GD2883@lil-twin.cordelia.cmb>
References: <fad9d484050519150730dbc53d@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <fad9d484050519150730dbc53d@mail.gmail.com>
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

On Fri, May 20, 2005 at 12:07:11AM +0200, Kenneth Kalmer wrote:
> Guys
> 
> How can I prevent users from doing a traceroute through my box using
> iptables? Better still, how can I route a traceroute through a
> different network than the default one?
> 

iptables -t mangle -A PREROUTING -j TTL --ttl-inc 1

this would make your router invisible :)

-- 
regards
Sebastian Siewior

