From: Richard Williams <richard_williams@stratexnet.com>
Subject: H323 conntrack not working
Date: Mon, 24 Mar 2003 08:46:48 +1200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <8D7C5F56B409554D9D46AC22195807F3156E6F@exchwenz01.dmcwave.co.nz>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@lists.netfilter.org>

Hi,

I have gnugk on my linux 2.4.20 firewall running iptables 1.2.7a with
conntrack_h323 installed.

From within the LAN, netmeeting can register with gnugk and make calls to
other registered endpoints (on LAN or Internet).
From the Intenet, netmeeting can register with gnugk but cannot make a call
to endpoints in the LAN.

I have been using ethereal to try and see what is happening. 
In both cases H.225 packets are exchanged between gnugk port 1719 <->
netmeeting port x and all looks fine.

It seems that during call setup, the Internet netmeeting attempts to open a
TCP connection to port 3000x on gnugk (the firewall) but contrack_h323
doesn't allow it.

Anyone have any ideas whats wrong? or suggestions on how to debug my
problem?

One curious thing is that lsmod shows ip_net_h323 unused. Is this ok?
ip_nat_h323             3392   0  (unused)
ip_conntrack_h323       3136   1
ipt_MASQUERADE          2080   1
ipt_LOG                 4192   3
iptable_nat            19988   2  [ip_nat_h323 ipt_MASQUERADE]
ip_tables              13216   8  [ipt_limit ipt_state iptable_filter
ipt_MASQUERADE ipt_LOG iptable_nat]

Regards,
Richard

