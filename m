From: Bill Chappell <bill.chappell@critical.com>
Subject: Re: Isolate a legacy machine
Date: Thu, 16 Oct 2003 23:52:59 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F8F679B.A8980DF4@critical.com>
References: <B4B08E56FC7A304EB88DC4B97043921816EFBE@hqmail03.mpr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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

I will take a stab at this, with the expectation that
if I do not understand the configuration needed,
people will be kind.

2 machines can have the same IP address (your 10.2.1.100)
so long as there will be no confusion when another machine
sends a packet to 10.2.1.100 as to which box is meant.

Your "sneakernet" failover would definitely be do-able in
this case.

I have the sense that this will not exactly be the case.

I just wiped out some thoughts on using MASQUERADE to
hide the true IP address of the legacy box and DNAT
to send traffic to the legacy box that is addressed 
to the box that is doing the MASQUERADE-ing of outgoing 
traffic from the legacy box because it falls apart when
the box doing the MASQUERADE-ing can see both the legacy
box and the proxy/firewall box at the same time.
??? which box gets the traffic for 10.2.1.100 ??? 

My last thought, which fits here, is that the above
might work if you did it twice - hid the real IP address
of both the legacy and the proxy/firewall boxes behind
2 different IP addresses so no one box would see both
the legacy and the proxy/firewall at the same time at
the same IP address.
This might be on the right path to a solution.


(I use DNAT in -t nat PREROUTING to force all DNS traffic 
to a specific DNS server, if that helps with part of
your question.)


If you do not need the telnet and ftp functionality
of the legacy box when it is acting as your sneakernet
failover, and assuming that the time to change the
IP address of the legacy machine is included in acceptable
downtime, and assuming that MPR is not replete with
extra boxes, Garrison Keillor's popularity notwithstanding,
I would just put the legacy machine at a
different IP address for normal use and change its IP
address as part of the sneakernet failover process.

Hope this helps.

Bill Chappell



"Ringer, Torleiv" wrote:
> 
> Hi there,
> 
> I am not exactly sure how this needs to be done...
> 
> I have a legacy machine that I need to isolate from our LAN. Network access to this machine will be limited to port forwarding of telnet, and a limited FTP access that will only be initiated locally on a proxy machine (which will also run the iptables).
> 
> Let's say that the legacy machine currently has address 10.2.1.100, and I would like my proxy/firewall to have the same address. I will be unplugging the legacy machine from the LAN, then assigning the proxy/firewall the same IP.
> 
> Can I isolate the 100 machine from the LAN, and keep the same IP? I need to do this for failover, so that if the proxy box goes down, I can just unplug the 100 machine from the proxy/firewall, and plug it back into the LAN. I would also be unplugging the proxy/firewall from the LAN at this point.
> 
> Can I port forward telnet from the LAN (eth0) side to the legacy (eth1) side where both the proxy machine and the legacy machine have the same IP but are isolated from each other? Is this impossible?
> 
> Torleiv Ringer
> IT Support
> Minnesota Public Radio
> http://www.mpr.org




-- 
William Chappell,     Software Engineer,     Critical Technologies, Inc.
Suite 400 Technology Center, 4th Floor 1001 Broad Street, Utica, NY
13501
315-793-0248  x148  < bill.chappell@critical.com >  www.critical.com

