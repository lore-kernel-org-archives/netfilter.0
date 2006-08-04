From: =?ISO-8859-1?Q?P=E4r?= <parhaggbladster@gmail.com>
Subject: Target rules does not work on kernel 2.6.17.x.
Date: Fri, 04 Aug 2006 09:07:33 +0200
Message-ID: <44D2F235.7070405@gmail.com>
Reply-To: parhaggbladster@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi.
Having trouble with iptables when upgrading from kernel 2.6.13 to 2.6.17.x .
My old firewall rules are not functioning anymore.

Target rules that are using -j DNAT  such as this one:
$IPTABLES  -A PREROUTING -t nat -i $EXT -p tcp --dport 3389 -j DNAT --to 
192.168.x.x:3389

and j- ACCEPT
$IPTABLES  -A INPUT -p tcp -i $EXT -d 0/0 --dport 3724 -j ACCEPT

Does not work.
For iptables 1.3.4 it does not work (returns an errorcode) and for
1.3.5_iptables-1.3.5-20060702 it returns

iptables: No chain/target/match by that name

I have all iptables dependent modules in the kernel set as loadable modules.
So I do this in the beginning of the firewall script:

modprobe ip_tables
modprobe ip_conntrack_irc
modprobe ip_conntrack
modprobe ip_nat_irc
modprobe iptable_filter
modprobe iptable_nat
modprobe iptable_mangle
modprobe ipt_conntrack
modprobe ipt_MASQUERADE
modprobe ipt_multiport
modprobe ipt_state
modprobe ipt_REDIRECT
modprobe ipt_REJECT
modprobe ipt_LOG

Anyone have any ideas on how to proceed on this ?
I really need 2.6.17.x in order to activate new  wireless  functions 
that has been added into the 2.6.17.x kernel.

Cheers

/P





