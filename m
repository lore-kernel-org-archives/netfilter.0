From: Internet Protocol version Six <inet6@mail.be>
Subject: Forwarding a port on the LAN
Date: Sun, 6 Jul 2003 06:42:00 +0200 (GMT+02:00)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1335069572.1057466520812.JavaMail.Administrator@pumbaa>
Reply-To: Internet Protocol version Six <inet6@mail.be>
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

I want to forward a connection to the router (192.168.0.1:1600) to 192.168.0.2:23 which from the Internet works fine, however if I connect from a LAN machine (192.168.0.3) to the router on port 1600 I get a "Connection timed out". I use the following rule:

iptables -I PREROUTING -t nat -p tcp --dport 1600 -j DNAT --to 192.168.0.2:23

I don't see anything wrong with this, or am I forgetting something?

wkg,

-----------------------------------------------------
Mail.be, WebMail and Virtual Office
http://www.mail.be


