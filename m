From: Joel Newkirk <firewalldude@newkirk.us>
Subject: Re: Isolate a legacy machine
Date: Fri, 17 Oct 2003 00:37:37 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1066365457.2300.486.camel@alpha.newkirk.us>
References: <B4B08E56FC7A304EB88DC4B97043921816EFBE@hqmail03.mpr.org>
Reply-To: firewalldude@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <B4B08E56FC7A304EB88DC4B97043921816EFBE@hqmail03.mpr.org>
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
To: "Ringer, Torleiv" <tringer@mpr.org>
Cc: netfilter@lists.netfilter.org

On Thu, 2003-10-16 at 18:02, Ringer, Torleiv wrote:
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

If for some reason the proxy/firewall MUST be at the IP the 'legacy'
machine currently uses, just put it there, and put the legacy box on a
private subnet accessible only to it and the firewall.

You just set a DNAT rule for the traffic you want forwarded to the
legacy box, and FORWARD to let it through.

At need you can change the IP of the legacy box, if it's still on the
same physical network.

j

> Torleiv Ringer
> IT Support
> Minnesota Public Radio
> http://www.mpr.org



