From: Del Winiecki <delw@wildapache.net>
Subject: NAT only some ports
Date: Mon, 10 Feb 2003 12:05:04 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E47F7E0.2E4CACC1@wildapache.net>
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

Hi,

I have a Linux router box configured:

Wanpipe1: upstream isp
eth1: downstream isp1 -- (public address 209.aaa.aaa.x) must not be
Nat'd
eth2: downstream isp2 --   same 209.bbb.bbb.x
eth3: company1 on 192.168.254/253/252.0 (3 class c private) must be
NAT'd
eth4: company2 on 192.168.1.0/24 must NAT'd

All NAT'd "outside" addresses should show as one of isp1's addresses, so
just one fixed public address like 209.aaa.aaa.13, for example.

Is it possible to accomplish this with iptables?

Del W.

