From: "Vijay Saha, Noida" <vsaha@noida.hcltech.com>
Subject: queries
Date: Mon, 2 Jun 2003 11:11:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <E04CF3F88ACBD5119EFE00508BBB212109A2CCC8@exch-01.noida.hcltech.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi
I have got few querries related to my project.
I have got a Linux m/c with two network interfaces...wireless LAN (Aironet)
as "eth0" and GPRS PC card as "ppp0" .
I have to implement seamless roaming, so what I want to achieve is that by
default I would be connected to wireless LAN interface and as soon as Access
Point signal strength weakens, I have to switch dynamically to "ppp"
interface.The "ppp" interface accepts the AT command sets for connecting to
GPRS network.
I have two approaches:-

1) An alternative is using bridge as a virtual interface which enslaves
"eth0" and "ppp0" ...where the logic of bridging will be modified. We shall
continuosly check the "eth0" signal strength and if it weakens switch to the
"ppp0" within the bridge module logic. The advantage here is that the
application layer always bind with the same virtual bridge device "br0".
The disadvantage,probably, would be to translate between the Ethernet and
PPP frames within bridging module..??

2) How do I get switch to the ppp0 interface dynamically??
Can I accomplish my goal just by modifying the Kernel FIB default interface
dynamically and flushing the routing cache table of Linux as per the
connectivity??? Will the previous session be maintained after I increase the
kernel TCP/UDP Timeout values ..??
I am using the SIOCADDRT/SIOCDELRT to modify the default route in IP routing
table dynamically.'
But this approach has got some issues while handover... will the session be
maintained??
"qdisc" related problems???

netfilters can help in solving the problesm related to second approach...
Can you help me..??

Any suggestions are welcome.
Anticipating a reply
thanks and regards
Vijay

