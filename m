From: "lololo" <lololo@seed.net.tw>
Subject: Proxy-arp & DHCP conflict
Date: Thu, 27 May 2004 18:11:40 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <012501c443d3$00f7d960$260a0a0a@koxp>
References: <679890948@web.de>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I'm setting the proxy-arp ,but comes a problem:

My understanding to set the proxy-arp is simply enable the function in
Kernel.
echo 1 > /proc/sys/net/ipv4/conf/{interface}/proxy_arp
and then add routings.It surely worked well.

But if I have a server running DHCP in the same LAN,it(proxy-arp server)
failed ,something like I can't type any words in console or slow down the
action that i do.After unplugging  the wire ,it worked again.

So now i must type the following command manually
arp -Ds {IP} eth0 pub
........

Does anyone know what's happened?

Thnaks!

Lo


