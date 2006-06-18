From: Gino <regino_m@hotmail.com>
Subject: =?iso-8859-1?q?Arptables_before_Iptables=2C_to_route_other_gatew?=
	=?iso-8859-1?q?ays_Ip=B4s_traffic=3F?=
Date: Sun, 18 Jun 2006 22:29:41 +0200
Message-ID: <BAY105-DAV11D313C29B4853DFCB484E5810@phx.gbl>
Reply-To: regino_m@hotmail.com
Mime-Version: 1.0
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Message-ID: <2006618222941.787224@feanorhome>
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
To: netfilter@lists.netfilter.org

Hello!

For much time I=B4ve been thinking in configuring an Hot Spot function in my=
 Linux based router:

The function is to route traffic to the internet network, ok, but the client=
 wouldn=B4t necessary have configured DHCP or the IP range of the local=
 network of the router itself... in other words, the HotSpots can easily=
 route traffic to an external network (internet) while it doesn=B4t matter at=
 all the Ip config of the client, so the router could be 10.0.0.1, and the=
 client could have it=B4s gateway configured at 192.168.0.1....

With Iptables, only, it=B4s impossible to do this, and I=B4ve been thinking=
 configuring virtual interfaces in real time to route, but I think it=B4s=
 almost impossible and too hard for me...

But recently I have had a look at arptables... mmmmmmmmmmm..... it can=
 manage arp packets, and arp responses, so, my router maybe can do this:

0 - a client has not DHCP activated, and it=B4s network is quite different...=
 ok, the client starts networking, and asks for MAC of it=B4s gateway=
 static-ly configured (192.168.0.1)... it=B4s ARP.
1 - Router catches arp traffic.
2 - modify arp traffic and mangles the IP of the packet to itself... by=
 example, sets IP of the Arp packet to 10.0.0.1 (linux router itself).

Now my questions:
=A0
1 - Does the ARP Request be answered with the linux router MAC address, so=
 the client may register 192.168.0.1 to <MAC linux router> in its arp=
 table????
2 - if the last one is true, I could think easily that the client would send=
 non-local-traffic to <MAC linux router>, then IPTABLES IN THE ROUTER MAY=
 FORWARD IT, AND MAYBE NAT IS POSSIBLE??????
3 - I think too NAT is difficult because Linux router may think 192.168.0.x=
 (client) is at external network... can you imagine a way to solve this=
 problem???????
4 - Do you understand something I said??? =A0=A0;) ;)

I=B4m getting mad with this....

Thanks so much!


