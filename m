From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 15:18:06 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4109698E.9010703@pcraft.com>
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

>where w.x.y.z could be 192.168.38.64/29 for example, to block destination 
>addresses 192.168.32.64 to 192.168.38.72
>
    Heh, I just realized this won't help a whole helluva lot because 
www.yahoo.com's round-robin setup isn't contiguous:

    66.94.230.35
             .39
             .41
             .45
             .48
             .49
             .51
             .52

    And neither is www.hotmail.com (which redirects to passport.net anyway:

    207.68.171.233
              .239
              .245


    Do you suppose there are servers on the missing IPs, but they're 
just not operational at the moment?  (Which wouldn't surprise me to be 
honest.)

-- 
W | I haven't lost my mind; it's backed up on tape somewhere.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / WebSmith             .     800.441.3873 x130
  Photo Craft Laboratories, Inc.            .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A.




