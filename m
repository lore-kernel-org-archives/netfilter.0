From: "Karl Kopper" <karl@unfiw.com>
Subject: ipchains to iptables NAT/MASQ conversion question.
Date: Wed, 3 Jul 2002 14:27:00 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <OJEKLLDJMPFGONMBIJEFOEHECEAA.karl@unfiw.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


I am trying upgrade a long list of ipchains rules to iptables and am stuck.
On ipchains I was able to create "ACCEPT" rules in the forward chain that
would cause some packets (based usually on source IP address AND port
number) to simply pass through the firewall unmasqueraded (they were kicked
out of the chain before the MASQ rule).

How can I accomplish the same thing using iptables?

Thanks for your help,

--Karl



