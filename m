From: Terry Mackintosh <terry@mackintoshweb.com>
Subject: SNAT: in on the outside if (eth1), then out to a remote IP
Date: Wed, 16 Apr 2003 16:03:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E9DB701.1020108@mackintoshweb.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi

First I hope I can post here with out joining the list, on enough already.
Please reply directly.

I'm not sure how to quickly state the quesion, so here is a long 
discription (sorry):

A machine acting as a firewall/router for a private LAN (eth0, 
192.168.0.254/24) with a none-routable IP on eth1 connecting to my ISP.

Also on eth1:0 thru eth1:8 are real IPs, which will soon be for another 
box but for the moment that box is else where with other unrelated real IPs.

 From the perspective of the inside private LAN I used a DNAT rule to 
send all traffic from eth0 to eth1:x to the appropriate IP on the remote 
box.  That worked and was easy.

Next I wanted to make it so that if someone from outside tries to access 
any of the IPs on the firewalls eth1:x interfaces, they will be 
seemlessly NATed to the real server at the other remote real IP addresses.

I understood that at this point the packets would alread go to the real 
server, but that server would try to directly reply to the origanal 
client which would not recognize it and refuse the connection.

So, an SNAT rule is needed so the remote server will reply instead to 
the firewall which will in turn de-NAT it and send it back to the 
origenal client.

OK, I've tried every veriation of an SNAT rule that seemed to make any 
sense to me and none work.

I've read several docs/tutorials and none mention this senerio.

Does anyone have any idea how to structure such an SNAT rule?

Thank you

Terry Mackintosh  <terry@mackintoshweb.com>



