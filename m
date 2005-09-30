From: Marc Haber <mh+netfilter@zugschlus.de>
Subject: Re: Iptables and vlan interfaces
Date: Fri, 30 Sep 2005 13:37:24 +0200
Message-ID: <20050930113724.GE25248@torres.l21.ma.zugschlus.de>
References: <20050930112129.19898.qmail@focomunicatii.ro>
	<433D22A9.1060504@toxicnet.de>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <433D22A9.1060504@toxicnet.de>
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

On Fri, Sep 30, 2005 at 01:34:01PM +0200, Sascha Reissner wrote:
> eth1.11 is the same physical device as eth1.

Doesn't matter here.

> use eth1 in your rule and you are fine.

Bad advice. eth1 is most probably a completely different IP network.

> netfiler does IMHO not support filtering by logical interface.

It does. I do, however, not know why the original poster's commandline
is not accepted as it seems to be OK on first sight.

Greetings
Marc

-- 
-----------------------------------------------------------------------------
Marc Haber         | "I don't trust Computers. They | Mailadresse im Header
Mannheim, Germany  |  lose things."    Winona Ryder | Fon: *49 621 72739834
Nordisch by Nature |  How to make an American Quilt | Fax: *49 621 72739835

