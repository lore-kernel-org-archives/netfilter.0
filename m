From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Couple More Questions
Date: Thu, 30 Oct 2003 13:04:36 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E93@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: "David C. Hart" <DCH@TQMcube.com>, iptables mailing list <netfilter@lists.netfilter.org>


2. I'm still a bit confused on the logging of the destination address.
With our one static IP, there are two possibilities. Either a packet is
intended for our IP or for another. Yet, the logs will always show the
destination address as the IP of the LAN interface. Any suggestions?

I imagine you are talking about the fact that the only packets getting
logged are those destined for the firewall machine itself. The reason
for this is that before you reach the (PREROUTING?) INPUT or FORWARD
chains, the IP layer analyses the packet to see if the packet is
destined for this machine or not. If it isn't, then the packet is
silently thrown away before reaching Netfilter.

If you DO want to receive packets in a IP layer promiscuous manner, then
you will have to set /proc/sys/net/ipv4/conf/*/rp_filter to 0. This
disables the destination IP filtering.


