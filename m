From: varun_saa@vsnl.net
Subject: iptables + auth
Date: Wed, 27 Apr 2005 18:37:35 +0500
Message-ID: <5e67595e20d2.5e20d25e6759@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-language: en
Content-disposition: inline
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
To: netfilter@lists.netfilter.org

 Hello,
         My server is on Mandrake 10.1
eth0 is WAN with static IP
eth1 is LAN

I am using iptables for firewalling.

I am also running squid proxy.

The reason I am running squid proxy
is to allow / deny access to the net to
clients systems. I use NCSA auth.

If I were not to use squid proxy how can
control access to net.

Is there a way using iptables to control access
to the net that is realable?

Thanks

Varun


