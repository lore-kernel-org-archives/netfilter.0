From: "Juan Nin" <juaid@juanin.com>
Subject: OKBridgae and nat
Date: Fri, 20 Dec 2002 11:09:55 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005601c2a831$7fe0ad90$1b01a8c0@juan>
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

I got the following question:

I have a box that acts as router/firewall
Behind it, I have serveral private networks
I used masquerading via ipchains, and now I upgraded the box and I'm using
nat via iptables

A customeruses a game for playing Bridge card game via internet which is
called OKBridge
When using ipchains I had the following rules to make it work:

ipchains -M -S 7200 0 0
ipmasqadm autofw -A -r tcp 1729 1729 -h xxx.xxx.xxx.xxx

being xxx.xxx.xxx.xxx the IP of this customer's machine

now.. with iptables..
do I have to issue any rule to make it work, or iptables mangles it by
itself and it's not necessary to do anything??

thanks in advance,

Juan






