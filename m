From: Georgi Chorbadzhiyski <gf@unixsol.org>
Subject: dscp match
Date: Tue, 21 May 2002 17:38:54 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CEA5BFE.6050109@unixsol.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Is dscp match work in the recent iptables?

# uname -a
Linux router 2.4.17 #10 Tue Mar 26 01:26:47 EET 2002 i686 unknown

# iptables --version
iptables v1.2.7-20020520

# iptables -A INPUT -m dscp --dscp 0x20 -j ACCEPT
iptables: No chain/target/match by that name

The same happens with iptables 1.2.6a (from slackware-current)

Please CC me on replies I'm not on the list.
Thanks.



