From: "Manikandan" <mani@manikandan.org>
Subject: VPN issue
Date: Mon, 29 Mar 2004 19:09:57 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <JFEPKPDIGFAKJOGHOICDAECBCAAA.mani@manikandan.org>
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
To: Netfilter <netfilter@lists.netfilter.org>


Dear all,

A Linux server is acting as gateway/firewall to route traffic from my LAN to
Internet using one public IP.
The issue is, I am able to make only one connection to the VPN server
through my firewall. The second connection fails with an error 721.
I mapped another unused public IP to one of my local LAN system. I am able
to make one more connection to the server as the public IP is different. So
NATing seems to be the problem.
Please assist me in configuring my firewall to allow concurrent VPN sessions
to the server.
I am using 2.4.20-8 kernel and iptables.

Advance thanks.

Regards,
Manikandan.




