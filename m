From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: 2 NICs on same subnet
Date: Fri, 5 Nov 2004 13:41:07 +0100
Message-ID: <20041105124107.GE9379@torres.ka0.zugschlus.de>
References: <20041105123843.GB11016@zion.homelinux.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20041105123843.GB11016@zion.homelinux.com>
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

On Fri, Nov 05, 2004 at 01:38:43PM +0100, Sven Schuster wrote:
> I have a machine (RH ES 3) with two Intel e1000 cards attached to
> a gigabit switch, each interface is assigned an IP address on the
> same subnet (say 1.2.3.4 on eth0 and 1.2.3.5 on eth1).

Why did you do that?

> What's happening is that if a connection to either of these addresses
> is made, it's always received via the same interface (eth1 most of the
> time), and the replies go out via this interface, too. But what I'd
> like is that packets to 1.2.3.4 come in via eth0 and packets to 1.2.3.5
> come in via eth1 and that replies from 1.2.3.4 leave via eth0, from
> 1.2.3.5 via eth1.

Why? Bandwidth issues?

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

