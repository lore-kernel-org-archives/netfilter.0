From: "Michael" <michael@insulin-pumpers.org>
Subject: one to one NAT
Date: Mon, 9 Sep 2002 17:10:22 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209100010.g8A0AAr9027286@ns2.is.bizsystems.com>
Reply-To: michael@insulin-pumpers.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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

I've been messing around all day trying to get one to one NAT working 
for my site. This is (I think) a typical DMZ application.

INTERNET <==> linux/iptables <==> localnet

linux ip 1.2.3.4 on eth1
local net 192.168.1.0

local net ip box 192.168.1.19

I want to map 1.2.3.5 to a single address behind the linux box
1.2.3.5 is mapped to eth1:0

I can't determine if I should be using 'mangle' or a combination of 
SNAT DNAT.

A pointer to a good howto that has some details would be appreciated.

Michael
Michael@Insulin-Pumpers.org

