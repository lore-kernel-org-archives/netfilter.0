From: Jason Opperisano <opie@817west.com>
Subject: Re: protocol 50 unreachable
Date: Wed, 01 Dec 2004 22:46:00 -0500
Message-ID: <1101959160.22517.20.camel@hubcap.ljm.dom>
References: <Pine.LNX.4.44.0412011924220.22471-100000@gollum.grajagan.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0412011924220.22471-100000@gollum.grajagan.net>
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
To: netfilter@lists.netfilter.org

On Wed, 2004-12-01 at 22:29, Helge Weissig wrote:
> my bad... when I obfuscated my script, I should have used "$EXT_IP" or 
> something like it. That IP and the VPN server's are very similar.

ok...

> JO> 
> JO> try and connect with your VPN client to your VPN server with that
> JO> script.  if you can't connect--it's more likely an IPSec configuration
> JO> detail that your missing.
> 
> no such luck :(. I should note that the VPN connections works fine when I 
> hook the client up directly to my DSL line. btw - it looks like your 
> script does not forward anything from one of my interfaces to the other.

yeah--precisely.  you seem obsessed with the desire to "port forward"
esp traffic to your VPN client, which is absolutely not necessary.

look into configuring NAT-T with your VPN client, sometimes called "UDP
Encapsulation" as your VPN server appears unwilling to accept esp
packets that have traversed an intermediate NAT device.

-j

--
"Mmmm...free goo."
	--The Simpsons


