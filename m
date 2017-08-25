From: netfilter@allycomm.com
Subject: Re: Can't override filter section OUTPUT DROP / INPUT DROP Policy
Date: Fri, 25 Aug 2017 09:12:04 -0700
Message-ID: <84281c34-08f4-2979-ad33-78d8bec77c39@wagsky.com>
References: <59A0313C.1020409@embarqmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <59A0313C.1020409@embarqmail.com>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: gazoxtapod <gazoxtapod@embarqmail.com>, netfilter@vger.kernel.org

Without knowing the network topology you're using, suggesting an 
approach can be challenging.


With the right topology, your firewall rules can become nearly "trivial"


For something like this, I would suggest either a second physical 
interface (a USB Ethernet dongle) or a VLAN to easily segregate traffic 
between the Pi and the modem from that between the RPi and your 
"trusted" access servers.

I'm not sure how you're connecting to the modem, as the modem-router 
connection typically acts as a bridge, rather than a routed segment, 
with the router's external interface obtaining DHCP information (IPv4 
and IPv6 both, if enabled) from themodem.

I can see several ways of "tapping into" the modem-router connection:

192.168.0.1/24    -- modem's administrative interface

203.0.113.123/24  -- hypothetical ISP-assigned address

192.168.168.0/24  -- internal network, assigned by router's DHCPd



Approach 1 -- Provide staticroute to modem

Modem ----- Router IF_ext                Router IF_int ----- internal 
net ----- RPi
203.0.113.123/24 - DHCP 192.168.168.1/24 -- static             
192.168.168.200/24 -- DHCP
             192.168.0.2/24   - static 192.168.0.4/24     -- static

For this to work, you'll likely need at least
* RPi
   * Static route to 192.168.0.1 via 192.168.168.1
* Router, arp might figure it out, but may need "help" with
   * Static route to 192.168.0.1 as link-local on IF_ext
   * Static route to 192.168.0.4 as link-local on IF_int

That's pretty ugly to me, and doesn't restrict modem access as neatly 
and flexibly as using a VLAN would (I'm assuming the VLAN is tagged on 
the internal net)



Approach 2 -- Bridge to VLAN


Modem ----- Router IF_ext                Router IF_int ----- internal 
net ----- RPi
203.0.113.123/24 - DHCP 192.168.168.1/24 - static      
         192.168.168.200/24 - DHCP
Router IF_ext:1 Router IF_ext.1234                     RPi.1234 (or 
second adapter)
             192.168.0.2/24   - static    192.168.0.3/24   - static 
              192.168.0.4/24     - static

Now the router can be configured to bridge the virtual interface 
IF_ext:1 to the VLAN interface IF_ext.1234. Only internal hosts that 
have access to VLAN 1234 have access to the modem. No special routing 
tricks should be required, assuming the bridge is configured properly.



Approach 3 -- RPi as bridge

Bridge the traffic between the modem and the router through the RPi

This can be a pretty clean solution, but, alas, the RPi architecture 
limits the on-board Ethernet adapter to about 90 Mbps (all RPi versions, 
at this time).



Approach 4 -- Proxy connections to the modem

Configure the router to proxy connections to the modem. This can be done 
through NAT, or running nginx or the like on the router. Access controls 
on the proxy limit access to the modem.  Proxy prevents modem from 
connecting to the internal net.




On 8/25/17 7:16 AM, gazoxtapod wrote:
> [...]
> I'm trying to use the Pi2 as an appliance to monitor DSL Usage from my 
> DSL modem (192.168.0.1), which is between a (nearly default 
> configuration) firewall router for my LAN and the ISP.  The Pi2 box 
> project, when completed, is strictly an appliance that is a client to 
> the modem, reading date/time and DSL usage and error status, and 
> displaying this on an LCD display.
>
> * I need to allow the Pi2 to negotiate a DHCP request for an IP 
> address from the router on bootup. (This is the system default - no 
> need to do anything)
> * I need to allow the Pi2 to make a periodic connection to the modem 
> and fetch data. (I do this with Python Requests - it works)
> * I am trying to block all other types of incoming and outgoing 
> connections. This is what I can NOT do.
>
[...]
