From: "Ringer, Torleiv" <tringer@mpr.org>
Subject: Isolate a legacy machine
Date: Thu, 16 Oct 2003 17:02:05 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B4B08E56FC7A304EB88DC4B97043921816EFBE@hqmail03.mpr.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

Hi there,

I am not exactly sure how this needs to be done...

I have a legacy machine that I need to isolate from our LAN. Network =
access to this machine will be limited to port forwarding of telnet, and =
a limited FTP access that will only be initiated locally on a proxy =
machine (which will also run the iptables).

Let's say that the legacy machine currently has address 10.2.1.100, and =
I would like my proxy/firewall to have the same address. I will be =
unplugging the legacy machine from the LAN, then assigning the =
proxy/firewall the same IP.

Can I isolate the 100 machine from the LAN, and keep the same IP? I need =
to do this for failover, so that if the proxy box goes down, I can just =
unplug the 100 machine from the proxy/firewall, and plug it back into =
the LAN. I would also be unplugging the proxy/firewall from the LAN at =
this point.

Can I port forward telnet from the LAN (eth0) side to the legacy (eth1) =
side where both the proxy machine and the legacy machine have the same =
IP but are isolated from each other? Is this impossible?

Torleiv Ringer
IT Support
Minnesota Public Radio
http://www.mpr.org


