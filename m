From: "Alejandro Cabrera Obed" <sisdis@tournet.com.ar>
Subject: Disabling packet fragmentetion
Date: Mon, 30 Jan 2006 15:24:42 -0300
Message-ID: <082801c625ca$70847bf0$0200a8c0@kari>
Reply-To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "Netfilter (lista)" <netfilter@lists.netfilter.org>

Hi people,

I know that fragmented packets arriving to a firewall it's a security hole,
because there are a lot of attacks using this characteristic.

I'm using Linux + Iptables in my firewall and I don't want packet
fragmentation coming to my firewall and to the LAN, so I ask you:

Where do I have to discard the packet fragmentation in my firewall, using a
specific iptables rule or in the kernel settings (maybe at
/proc/sys/net/ipv4) ???

Can you tell me this ???

Thanks a lot,


Alejandro



