From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Traffic accounting over ULOG inefficient?
Date: Thu, 10 Jun 2004 21:33:13 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040610193313.GA3966@torres.ka0.zugschlus.de>
References: <200406102005.20214.arny@ats.s.bawue.de>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200406102005.20214.arny@ats.s.bawue.de>
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
To: Thilo Schulz <arny@ats.s.bawue.de>
Cc: netfilter@lists.netfilter.org

On Thu, Jun 10, 2004 at 08:05:14PM +0200, Thilo Schulz wrote:
> Since all of the other traffic accounting implementations I have met right now 
> are inflexible, I decided to write my own one. There are some 
> implementations, that parse the byte counters displayed by iptables and feed 
> their traffic databases by this output. A dirty hack in my opinion. Something 
> that knows about traffic instantly is just better .. so ULOG is a bit more 
> interesting.

Make sure to take a look at ulog-acctd before re-inventing a wheel
that has probably already been invented.

> The only thing that disturbs me: Just for counting packet lengths
> queue whole packets to userspace?

You can control how much of the packet should be copied to userspace
in the iptables statement and takt the packet length from the IP header.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Karlsruhe, Germany |  lose things."    Winona Ryder | Fon: *49 721 966 32 15
Nordisch by Nature |  How to make an American Quilt | Fax: *49 721 966 31 29

