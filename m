From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 15:07:02 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <410966F6.3020206@pcraft.com>
References: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com> <200407291928.48974.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407291928.48974.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

>>>iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 80 -j REJECT
>>>
>
>"-I" will insert the rule at the top of the FORWARD chain, and therefore 
>guarantees that these packet will be REJECTed, no matter other rules follow 
>in your ruleset.
>
    Thanks for the explanation.  So I'm testing this out now, and I 
inserted:

iptables -I FORWARD -s 66.218.75.184 -d 192.168.1.253 -p tcp --dport 80 
-j REJECT

    66.218.75.184 == mail.yahoo.com (or login.yahoo.akadns.net, or 
l1.login.vip.scd.yahoo.com according to iptables -L), however that 
machine (.253) can still reach that address just fine.  What am I missing?

    I don't see a round-robin IP setup for mail.yahoo.com (much like 
what you'd see if you lookup www.yahoo.com) so I'm not quite sure why 
it's not blocking it.

-- 
W | I haven't lost my mind; it's backed up on tape somewhere.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / WebSmith             .     800.441.3873 x130
  Photo Craft Laboratories, Inc.            .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A.




