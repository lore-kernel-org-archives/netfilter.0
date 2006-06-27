From: Admin <netfilter-info@internode.com.au>
Subject: troublesome load balancing and iptables to the rescue...maybe
Date: Tue, 27 Jun 2006 19:47:38 +0930
Message-ID: <200606271947.38079.netfilter-info@internode.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

Hi all

We have a load balanced set of web servers (behind an alteon AD3) which all 
work fine - except when the real servers (the webserver instances on the load 
balanced machines) try to access the virtual ip (vip) on the alteon.

Here's how it works

clientIP=AA
VIP=BB
RealServerIP=CC
SourceIP=sip
DestinationIP=dip

The vip and real_server ips are all on the same network.

# client request from the outside
(client) -> (vip) - sip=AA, dip=BB
(vip) -> (real_server) - sip=AA, dip=CC
# return traffic (real server on CC responds to client on AA)
(real_server) -- sip=CC, dip=AA --> (alteon) -- sip=BB, dip=AA --> client

So the alteon substitutes the virtual server ip with the real server one and 
back again for the load balancing to work.

Now the problem, we need the real servers to be able to access the service 
provided on the VIP also. The ports on the alteon are configured properly 
(client and server enable and so on) but the problem seems to be a routing 
one.

Here's the flow of traffic when the real server tries to access the vip

# client request
(client) -> (vip) - sip=CC, dip=BB
(vip) -> (real_server) - sip=CC, dip=CC
# return traffic (real server on CC responds to client on CC - oops that's me)
(real_server) -- sip=CC, dip=CC --> straight back to the real server, no dice.

Now this is a common problem, usually solved by using proxy-ips, however the 
alteon proxy-ips don't add X-Forwarded-For headers meaning our servers won't 
get the correct client IPs - which is unacceptable.

I have been trying to find a way to mangle the packets with iptables (on the 
real servers) to make this work.

The obvious (well...kinda obvious) way is to change the sip (to something 
outside the local network)  on the incoming packet somewhere in the 
PREROUTING or INPUT phase, then modify the dip in the response packet in the 
POSTROUTING phase back to that of the real server.

Unfortunately this is pretty much the reverse of what DNAT and SNAT are used 
for.

We want SNAT on the PREROUTING or INPUT phase and DNAT in the POSTROUTING (or 
possibly OUTPUT, but I don't think so) one.

Or perhaps - is there any way to force traffic from one IP to the same IP to 
go through a remote router? Perhaps mark traffic from the real server to the 
vip then act on that mark when the alteon directs it back?

Can anyone offer any ideas how to solve this issue?

Many thanks
Admin

