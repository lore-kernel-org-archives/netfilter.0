From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Re: A drop-in firewall
Date: Thu, 4 Sep 2003 11:01:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200309041101.13462.gdh@acentral.co.uk>
References: <5.2.1.1.0.20030830201439.01072380@fluent2.pyramid.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.0.20030830201439.01072380@fluent2.pyramid.net>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

lOn Sunday 31 August 2003 04:25, Stephen Satchell wrote:

> Desired solution:  "Drop" a Linux box between the Windows boxes and the
> rest of the internal network.  Use IPTABLES to ensure that the Windows
> boxes can't do anything nasty to the rest of the systems in the room,
> without impairing access to the rest of the Internet.

What you want to do is perfectly common and perfectly achievable... However, 
can I suggest an alternative route? 

Check out the Linux bridge-filter patch which allows you to apply iptables 
rules whilst running a machine as a bridge - i.e. your eth0 and eth1 become a 
single 'br0' for management purposes..

The joy of this is that you CAN literally just drop the box in between your 
LAN and WAN, and you need not change ANY default gateway settings on either 
the routers or the Windows boxes.

I've been using an old P233 as a bridge-firewall for a client LAN of 50 
machines with 2Mbps upstream bandwidth, and the thing never misses a beat, 
and loadavg is usually below 0.05 

http://ebtables.sf.net/

and specifically http://ebtables.sourceforge.net/download.html

Cheers,
Gavin.

