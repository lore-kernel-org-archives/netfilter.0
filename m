From: Krystian <optimusprime@o2.pl>
Subject: conf scenario.
Date: Mon, 03 May 2004 22:42:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4096AE99.5070705@o2.pl>
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

hello

i need some help on how to configure this scenario in iptables:

[adsl modem/router]-----[eth1-linux box-eth0]-----[network]

the problem is that the box has to work as a forward/masqurade for most 
users, but it must also bridge traffic from couple hosts inside the 
network which have public IP addresses.

question: how to configure "linux box's" iptables to forward and 
masquarade traffic from most users and bridge traffic for couple 
"public" users.

the way i figured it out is to DNAT all trafic for public ip's to our 
network public hosts. is there other better way?


