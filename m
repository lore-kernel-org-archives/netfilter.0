From: not4u2know <crazyhacker@sympatico.ca>
Subject: iproute2 and iptables help
Date: Sat, 05 Apr 2003 01:21:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E8E7603.4040102@sympatico.ca>
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

hi, my isp issues ip addresses via pppoe. i have the capability to lease 
multiple ips at once, as i can pass through the pap authentication 
simultaneously.  i also have a dial up modem to serial line for standard 
ppp.  i was wondering if anyone had any idea as to how i can do 
something like this with my nat/packet filter machine....


dsl pppoe modem--->eth0--->ppp0--->eth1--->10.0.0.0/16
                                         \
                                           \--->ppp1-->eth2--->10.0.0.0/24
                                            \
                                             
\--->ppp2-->eth3-->192.18.0.1/24

the dsl line on rj11 connector connects to the dsl modem, the dsl modem 
connects to eth0.  when i lease my first external ip, my dialer creates 
ppp0.  i do snat to allow the network connected to eth1 appear as if its 
all coming from ppp0.  now, what i want to do is know how i can make the 
second and third leased ip addresses used by the otherr internal 
networks. so basically what i want to do is have separate external ip 
addresses for each of my internal networks.  i tried doing this with 
snat, but it did not work and i feel i would have to do something with 
the routing tables.  does anyone know precisely what user space tools to 
work with? somoene once mentioned to me iproute2, is this the tool i 
should use?  anyone recommend reading material for doing such things as 
described further up?

thanks.


