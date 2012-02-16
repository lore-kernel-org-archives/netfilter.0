From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: How to restrict torrent download  ?
Date: Thu, 16 Feb 2012 12:28:09 -0600
Message-ID: <op.v9saw7z7x1lyi3@debiandesk2.net>
References: <20120216160904.2ea59e26@shiva.selfip.org>
 <1329389715.3296.12.camel@ns014530.dcyb.net> <4F3CE276.4010500@cloudways.com>
 <20120216171502.78212a3e@shiva.selfip.org>
 <20120216171909.3a3cd4c1@shiva.selfip.org>
 <1329393715.3296.18.camel@ns014530.dcyb.net>
 <1329411784.18690.463.camel@andrew-desktop>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1329411784.18690.463.camel@andrew-desktop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: "Rob Sterenborg (lists)" <lists@sterenborg.info>, "J. Bakshi" <joydeep@infoservices.in>, Andrew Beverley <andy@andybev.com>
Cc: netfilter@vger.kernel.org

On Thu, 16 Feb 2012 11:03:04 -0600, Andrew Beverley <andy@andybev.com> wrote:

> Personally I use the rather brutal technique of looking for several
> connections to high port numbers from a single client. I dare say there
> are false positives, but it works for me.
>The details for that are here:
>http://andybev.com/index.php/Fair_traffic_shaping_an_ADSL_line_for_a_local_network_using_Linux
>Andy
>

Andy, your setup looks very good.  I am interested in using a similar system to limit bittorrent.  However, I cannot use rate-limiting, since each user (LAN host) is already rate-limited in his or her router, and the rates of each user vary somewhat.  It's possible to move the rate-limiting from the radios to the router, but I want to avoid maintaining a class and filters for each user.

To clarify, all users of our small ISP (including me) are members of a wireless LAN.  We have radios in our houses which connect us to the ISP's radio located on a distant radio tower.  The radios in our homes do rate-limiting.  The wireless signal from these home radios is transmitted via a wireless bridge to a single Linux router about 40 miles away.  I administer that router.  It has several small uplinks, and the router code does load-balancing over them.  Effectively, all this is equivalent to a simple LAN directly connected to a netfilter load-balancing router.

It seems to me that instead of rate-limiting in order to control bittorrent, I could instead simply prioritize via the QOS marker.  Any traffic detected as bittorent would get the lowest priority.  Do you think this would give satisfactory results?

Regards,
-- 
Lloyd
