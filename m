From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: forwarding on the same NIC
Date: Tue, 11 May 2004 11:26:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40A0FEC7.7020201@pbl.ca>
References: <3401.200.44.170.105.1084217773.squirrel@200.44.170.105>     <200405102115.14089.Antony@Soft-Solutions.co.uk>     <1292.192.168.74.154.1084226963.squirrel@192.168.74.154>     <1084227992.14224.5.camel@localhost>     <1166.200.44.170.105.1084283379.squirrel@200.44.170.105>    <1084288178.15768.10.camel@localhost> <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <2022.200.44.170.105.1084289894.squirrel@200.44.170.105>
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
To: alucard@kanux.com
Cc: netfilter@lists.netfilter.org

alucard@kanux.com wrote:
> Anyone could help? the thing is that, this second webserver is using and
> aplication that we use internally and, what I'm trying to do here is,
> access the web configuration service from the outside using our existing
> server, which is the only one nat'ed', so our other offices can access it.
> Since the second server is a production server, there's no way we can
> change it's IP and use a subnet.

I wasn't following this discussion too closely.  However after reading 
what John wrote, I'd guess that your first box is also generating ICMP 
redirect packets back to the router.  Reasoning why I believe that it is 
generating them is that the packet has arrived on the same physical 
interface where it is supposed to be routed out.  This is exactly the 
situation where routers (by default) generate ICMP redirects.  So even 
if you get your box to start routing, you might need to turn off 
generation of ICMP redirects on first Linux box (send_recirects, or 
something like that).

I guess that router is actually at your end (not ISP end), and it is one 
of those small cheap boxes where you connect ADSL or cable, so it has 
public IP address on one end, and is doing NAT for the internal network 
(and your Linux box is assigned to do firewalling).  If this is the 
case, you can solve it a simple way by putting second NIC in your first 
Linux box and assign it different network.  So you would end up with 
something like this:

                   +-------------+
                   |     ISP     |
                   +-------------+
                          |
                          |
                          | ISP assigned public IP
                   +-------------+
                   |   router    |
                   +-------------+
                          | 192.168.1.1
                          |
                          | 192.168.1.2
                   +-------------+
                   |  Linux box  |
                   +-------------+
                          | 10.73.219.156
                          |
                          | 10.73.219.77
                   +-------------+
                   | 2nd Web srv |
                   +-------------+

Router will have default route pointing to ISP, Linux box will have 
default route pointing to router, and 2nd web server to your Linux box. 
  You will be doing NAT twice, once in the router, and again in the 
Linux box.  You can get away with only one NAT if you want, of course. 
The 192.168.0.0/16 will become your future DMZ network, and your 
internal network (10.0.0.0/8) will be deep inside.  I've used 192.168 
for DMZ to avoid guessing what you already used from 10.

To enhance security, you might start making plans to move 2nd Web server 
into the DMZ (change of IP address) as some future project, but you 
don't have to do it right away.

Anyhow, you've got the idea, you only need to adjust it for your 
environment.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

