From: Dan Cox <dancox@speakeasy.net>
Subject: redirecting everything to another machine
Date: 21 Mar 2003 00:40:07 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048207207.6972.1360.camel@xavier>
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

With iptables how would I redirect all connection attempts coming from
the Internet interface to a machine inside my DMZ? I also have a LAN
that I have "masqueraded" though I don't know if thats related. My set
up is below:

Internet IP/iface = eth0 1.2.3.4
LAN IP/iface = eth1 192.168.0.1
DMZ IP/iface = eth2 192.168.1.1


Any help is very much appreciated. Thanks

Dan Cox



