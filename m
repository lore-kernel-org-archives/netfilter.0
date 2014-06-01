From: Neal Murphy <neal.p.murphy@alum.wpi.edu>
Subject: Re: ebtables not blocking arp (or anything). I am using knoppix
Date: Sun, 1 Jun 2014 15:10:00 -0400
Message-ID: <201406011510.00408.neal.p.murphy@alum.wpi.edu>
Reply-To: neal.p.murphy@alum.wpi.edu
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

On Sunday, June 01, 2014 10:11:53 AM dapiot holmp wrote:
> ... and it couldn't
> be set up as a bridge properly as I only have one physical network
> interface.

Of course it can. The debian way in /etc/network/interfaces; you may have to 
translate to knoppix:

----
iface eth0 inet manual
auto RED
allow-hotplug RED
iface RED inet dhcp
  bridge_ports eth0
  bridge_maxwait 0
  post-up brctl setfd RED 0
----

Now you should have a bridge between RED and eth0 that you can poke and prod.

N
