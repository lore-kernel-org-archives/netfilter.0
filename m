From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: iptables with irc and auth
Date: Mon, 10 Jan 2005 12:40:18 +0100
Message-ID: <20050110114018.GD1098@torres.l21.ma.zugschlus.de>
References: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <33413.212.100.225.41.1105354789.squirrel@webmail.*>
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

On Mon, Jan 10, 2005 at 10:59:49AM -0000, squid@oranged.to wrote:
> I am trying to configure iptables so that when I connect to IRC on port
> 6667 it will allow the auth connection back on 113 from that IP address.

Do you really have an identd running on that port? If so, why don't
you open the port generally? If you don't have identd running, a
--jump REJECT will do just fine.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

