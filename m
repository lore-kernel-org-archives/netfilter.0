From: "Stuart J. Browne" <stuart@promed.com.au>
Subject: RE: router w/ iptables using nat and routing
Date: Wed, 22 Oct 2003 10:42:03 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <05c901c39835$4f94b420$2288e7c0@promed.com.au>
References: <oprxe4xwgvv668az@mail.theiversons.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <oprxe4xwgvv668az@mail.theiversons.us>
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
To: bob@spectrum-comm.com, netfilter@lists.netfilter.org

eth0 = Internet
eth1 = non-nat
eth2 = nat stuff

route add default eth0

iptables -t nat -I POSTROUTING -j SNAT -s 10.0.0.0/8 -o eth0 --to
66.119.211.74

If you need NAT from the 10's to the 64's, then

iptables -t nat -I POSTROUTING -j SNAT -s 10.0.0.0/8 -o eth1 --to
64.146.167.254

Shouldn't really need anything more complex than that.

bkx

>-----Original Message-----
>From: netfilter-admin@lists.netfilter.org 
>[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Bob Iverson
>Sent: Wednesday, 22 October 2003 10:29
>To: netfilter@lists.netfilter.org
>Subject: router w/ iptables using nat and routing
>
>
>i am setting up a router using rh8.0
>
>it has 3 interfaces, eth0 66.119.211.74/30, eth1 
>64.146.167.254/27, eth1 
>10.10.1.1/8
>
>currently i use two routers to accomplish my need. that is to 
>route from 
>eht0 my isp link to eth1 my routable subnet, containing email, 
>dns, vpn and 
>web sites. and do NAT on eth1 to 10.10.1.1-10.10.1.255 for my 
>customers who 
>do not need routable addresses.
>i can make one or the other work, nat 10.10.1.1 to the 
>internet. or route 
>64.x.x.x to the internet. but i have not been able to get both to work.
>
>currently i have a router doing 66.119.211.74 to 64.146.167.254. and a 
>router doing 10.10.1.1 to 64.146.167.228 w/NAT. then they are 
>connected on 
>the 64. network to allow access to dns, email and web.
>
>is it possible to run one machine with 3 card to accomplish this task?
>
>-- 
>Bob Iverson
>SPECTRUM COMMUNICATIONS
>765-7773
>bob@spectrum-comm.com
>


