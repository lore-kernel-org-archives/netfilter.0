From: Philip Craig <philipc@snapgear.com>
Subject: Re: Stateless NAT in 2.6 (was Re: UDP Forwarding)
Date: Thu, 24 Feb 2005 16:19:47 +1000
Message-ID: <421D7203.1010704@snapgear.com>
References: <1108784264.14727.11.camel@jasiiitosh.nexusmgmt.com>	<1109057218.5505.4.camel@jasiiitosh.nexusmgmt.com>	<014701c518b7$19102f20$0100a8c0@newlife>
	<1109061936.5505.72.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1109061936.5505.72.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

Hi John,

John A. Sullivan III wrote:
> On Tue, 2005-02-22 at 16:18 +0800, Ming-Ching Tiew wrote:
> 
>>>> I would like to find a way to do this with the
>>>>CyberGuard devices.  I do not have the option of installing a UDP helper
>>>>so I have to do this with iptables or iproute.
>>>>
>>
>>Trying to understand your problem :-
>>
>>Why is the option of installing a UDP helper is out ? Is it because
>>the can't compile C programs and install any program on these 
>>cyberguard devices? And you can only write scripts ?
>>
> 
> <snip>
> Yes, exactly.  They are very small footprint appliances running ucLinux
> and I would not want to void any warranties by cross compiling and
> adding binaries to the image.  Thanks for such a quick response - John

Customizing the firmware won't void the warranty per se.  The problem
is that our support processes cannot handle units with custom firmware
in them, so if you have a problem with the unit, we require that you
reinstall the standard firmware before contacting support.

So adding a UDP helper isn't too hard if you don't mind cross compiling
it and recreating the firmware image.  If you want to go this route,
then you can find the source code on www.snapgear.org.

Alternatively, we currently only ship Linux 2.4 firmware, so you could
use the stateless NAT in the ip route command.  Unfortunately we've only
enabled this for the high-end units, thinking very few people would
have a use for it when we already have iptables NAT.  So again, you
may have build your firmware image.

It's probably possible to write an iptables mangle target to perform
stateless NAT, but it doesn't exist yet that I am aware of.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com

