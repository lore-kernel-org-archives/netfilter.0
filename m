From: "Ashley M. Kirchner" <ashley@pcraft.com>
Subject: Re: Re: iptables problem (nfcan: addressed to exclusive
 sender for this address)
Date: Thu, 03 Nov 2005 09:02:58 -0700
Message-ID: <436A34B2.1080909@pcraft.com>
References: <20051103062533.C48C96AA57@smtp.sterenborg.info>	<4369B1F2.50804@pcraft.com>
	<20051103152158.GA14687@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051103152158.GA14687@salty>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jim Laurino wrote:

> You can arrange to have the firewall in question
> respond to 3 IP addresses on the outside interface and
> forward the now distinct traffic to the 3 kiosks.
> If this is possible, it might be better than being screwed.

    That would be nice, but no can do.  Remember, the server end, or 
receiving end, is a third party company.  They have hundreds, if not 
thousands of these little kiosks scattered across the country.  We are 
but a tiny little company with three of those kiosks.  Each kiosk makes 
an outbound FTP connection to the server.  Then the server makes an 
inbound connection back to the kiosk.  This is where it fails because it 
doesn't know where it came from since the kiosks are behind the firewall.

    Putting the kiosks OUTSIDE the firewall (with different IPs) also 
won't work because they also need to communicate (via windows shares) to 
internal machines, again, same scenario...they contact a print station, 
and the print station contacts them.  So you see, being screwed is the 
only option I see here.  Unless I'm overlooking something.

    And I can't tell the other company to send data to separate IPs 
either because their system works based on the packet they first receive 
when the kiosk contacts them.  Which goes back to my point above (about 
putting the kiosks outside the firewall.)

-- 
H | I haven't lost my mind; it's backed up on tape somewhere.
  +--------------------------------------------------------------------
  Ashley M. Kirchner <mailto:ashley@pcraft.com>   .   303.442.6410 x130
  IT Director / SysAdmin / WebSmith             .     800.441.3873 x130
  Photo Craft Imaging                       .     3550 Arapahoe Ave. #6
  http://www.pcraft.com ..... .  .    .       Boulder, CO 80303, U.S.A. 




