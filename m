From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Problem behind my DMZ
Date: Thu, 8 Jan 2004 23:14:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040109041404.GA23201@cannon.eng.us.uu.net>
References: <Law9-F44y5JrmDLaA4J00011e46@hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Law9-F44y5JrmDLaA4J00011e46@hotmail.com>
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
Content-Transfer-Encoding: 7bit
To: Martin Leduc <marled3@hotmail.com>
Cc: netfilter@lists.netfilter.org

On Fri, Jan 09, 2004 at 02:19:54AM +0000, Martin Leduc wrote:

> Good evening folks,
> 
> Sorry to answer you so late, and thank you for your informations.  I'm so 
> exited, I have make test and, basicly, it's working.  Tomorow is the 
> official test.  I keep you informed.
> 
> The only thing I can't figure out is the /32 netmask address for an address 
> having a /28.  Why dont put the /28?
> 
> Of course I try it but the route program have reject this entries.  Can you 
> explain to me?
> 
> Other thing.  It is possible than I can't reach other machine placed before 
> the firewall BOX having address IP in the same range than my firewall box 
> after having put the /32 host in my route table?
> 
> Example:
> 192.168.1.1  ISP GAteway
> 192.168.1.2  Server (Any kind)
> 192.168.1.3  Firewall BOX (Eth0)
> 192.168.1.3  Firewall BOX (eth1)
> 192.168.1.4  Server Behind Firewall BOX
> 
> Ping Test result
> ---------------------------
> 192.168.1.4 can reach 192.168.1.3
> 192.168.1.4 can reach 192.168.1.1
> 192.168.1.4 can't reach 192.168.1.2
> 
> In the same test
> 
> 192.168.1.2 can reach 192.168.1.1
> But not 1.3 and 1.4
> 
> I ask that because if I check my DSL route table, I see the same 
> configuration like
> 
> Destination     Gateway         Genmask         Flags Metric Ref    Use 
> Iface
> 67.68.140.1     0.0.0.0         255.255.255.255 UH    0      0        0 ppp0
> 192.168.1.1   0.0.0.0         255.255.255.0   U     0      0        0 eth0
> 127.0.0.0       0.0.0.0         255.0.0.0       U     0      0        0 lo
> 0.0.0.0         67.68.140.1     0.0.0.0         UG    0      0        0 ppp0
> 
> I can ping 67.68.140.1, .2, .3, .4, .5, etc....
> 
> Can you explain?

Is your IP forwarding turned on?

> 
> 
> Now the configuration :D

Please use the "ip" utility instead of ifconfig/route/arp/... It's much easier
and more powerful...

Ramin

