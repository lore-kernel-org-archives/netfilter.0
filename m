From: Alexey Talikov <alexey_talikov@texlab.com.uz>
Subject: simple error in extensions/libipt_ROUTE.c extensions/libipt_IMQ.c
Date: Thu, 20 Jun 2002 16:17:50 +0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <31HD43XO85VPGD98ZXBRM4XJIYV1X.3d11b9de@ALEXEY>
Reply-To: alexey_talikov@texlab.com.uz
Mime-Version: 1.0
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

Simple error in extensions/libipt_ROUTE.c
line 24 and 127 need change NETFILTER_VERSION to IPTABLES_VERSION
also
extensions/libipt_IMQ.c
line 18 and 87 need change NETFILTER_VERSION to IPTABLES_VERSION
-----------------------------------
mailto:alexey_talikov@texlab.com.uz
BR
Alexey Talikov
FORTEK
-----------------------------------



