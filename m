From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: How to elegantly handle two ISPs on a single box?
Date: Wed, 6 Apr 2005 23:04:06 +0200
Message-ID: <20050406210406.GA22689@torres.l21.ma.zugschlus.de>
References: <20050406194635.GE12284@torres.l21.ma.zugschlus.de>
	<002d01c53aea$f577baf0$f5001eac@riverview.office>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <002d01c53aea$f577baf0$f5001eac@riverview.office>
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

Hi Grant,

thanks for the verbose explanation. I really appreciate that.

On Wed, Apr 06, 2005 at 03:55:25PM -0500, Taylor, Grant wrote:
> > That will have me send out packets with source A to ISP B and vice
> > versa which will have the packets killed by the ISPs reverse path
> > filters.
> 
> Presuming that I got the IP addresses for ISP A matched up with the
> interface for ISP A and vice versa for ISP B then all packets that go out to
> the respective ISPs will have the correct sorce address.  ECMP is especialy
> designed for situations where people have multiple default routes or
> multiple internet connections.  Keep in mind that SNATing happens AFTER the
> routing decition takes place in the kernel as the traffic is headed OUT the
> physical interface.  With this in mind what ever interface the kernel
> decides to send the traffic out will be SNATed with the appropriet IP for
> that interface.

However, the final decision which ISP to use is the kernel's, and it
treats both path at same cost (hence the name). This is not the case
here. ISP A is a symmetric 2 Mbit line with high bandwidth cost, and
ISP B is a cheap ADSL (3Mbit/512 Kbit). That being said, it should be
clear that I want to control that the office PCs can surf the web
through ISP B while the home office users should have their VPN access
through ISP A.

Is that kind of control possible with ECMP?

> No it will not.  ECMP creates a pairing of source IP, source port,
> destination IP, and destination port and maintains each pairing on one route
> out for the duration of the session.  Or at least that is what it is suppose
> to do.  This way you may have an SSH session from an internal client go out
> ISP A and an HTTP request to the same destination system go out ISP B but
> each TCP stream / conversation will alwayse go out the same interface that
> it started going out. (There is a cache involved in the routing decition but
> that is for how long the decition is remembered AFTER the strem terminates,
> and is also tunable via /proc)

Thanks. I didn't know that. And your explanation even made me
understand.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

