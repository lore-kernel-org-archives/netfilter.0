From: Internet Protocol version Six <inet6@mail.be>
Subject: IPv6 Router and NAT/connection tracking
Date: Wed, 18 Jun 2003 23:05:30 +0200 (GMT+02:00)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <133738195.1055970330343.JavaMail.Administrator@pumbaa>
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

Hello all, I have a box that's configured as a firewall and router for IPv6, which is doing it's job fine, well, fine.., IPv6 connections keep timing out, they work for a second or 30 and then it timesout -> connections, ping6, traceroutes, ... from the Internet to the IPv6 address behind the router don't work anymore. Also if I do a ping6 or make a connection to a remote IPv6 host on the Internet it doesn't work, however if I ping6 the router from the network, everything works again...for about 30 seconds again, and then the problem begins again...

I was told that this is caused by NAT/connection tracking. Is there *any* solution to this? This is really annoying as I *need* NAT, but also want to give IPv6 connectivity to other machines on the LAN.
-----------------------------------------------------
Mail.be, WebMail and Virtual Office
http://www.mail.be


