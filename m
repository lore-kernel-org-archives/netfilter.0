From: Marc Delisle <DelislMa@CollegeSherbrooke.qc.ca>
Subject: PPTP from internal NAT
Date: Mon, 11 Nov 2002 11:40:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DCFDD93.5030304@CollegeSherbrooke.qc.ca>
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

Hi,

With Linux 2.4.19 and pom 20020825 on the gateway, compiled with:

CONFIG_NET_IPGRE=m
CONFIG_IP_NF_CONNTRACK=m
CONFIG_IP_NF_CT_PROTO_GRE=m
CONFIG_IP_NF_PPTP=m
CONFIG_IP_NF_NAT=m
CONFIG_IP_NF_NAT_NEEDED=y
CONFIG_IP_NF_TARGET_REDIRECT=m
CONFIG_IP_NF_NAT_IRC=m
CONFIG_IP_NF_NAT_FTP=m
CONFIG_IP_NF_NAT_PPTP=m
CONFIG_IP_NF_NAT_PROTO_GRE=m

should it be possible to connect from my internal
private network to an external PPTP server?

I can connect from an internal public IP.

Marc Delisle


