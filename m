From: "Nathan Littlepage" <nathan@iwantka.com>
Subject: Proof Read
Date: Fri, 16 Apr 2004 10:57:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00e701c423cb$a4584cc0$6c45a8c0@ntbrt.bigrivertelephone.com>
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

Can anyone proof over the following rc.firewall script and throw some
light as to why I get an 'Invalid Argument' on the two -m physdev upon
bootup. Yet, once the system is active the modules are loaded and I can
execute the script and, aside from the error that the modules are
already loaded, it will not error out on the -m physdev statements.

I've tried this on 2.4.22 and 2.6.4 systems with the same error, so I'm
thinking its the rules.

Thanks.

---rc.firewall script---

# Load kernel modules
modprobe ipt_physdev
modprobe ipt_state

# Defined Variables.
LOCALINT="lo"
ADMININT="eth3"
OUTINT="eth0"
SEG1INT="eth1"
SEG2INT="eth2"

# Flush all Chains.
iptables -F INPUT
iptables -F FORWARD
iptables -F OUTPUT

# Set default Policy for each Chain.
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT ACCEPT

# Setup: INPUT Chain for LOCALINT and ADMININT interfaces.
iptables -A INPUT -i $LOCALINT -m state --state NEW -j ACCEPT
iptables -A INPUT -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -A INPUT -i $ADMININT -p tcp -s $ADMINSUB --dport 22 -j ACCEPT

# Setup: Allow RELATED and ESTABLISHED connections back in.
iptables -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT

# Setup: Allow all traffic from segments out.
iptables -A FORWARD -m physdev --physdev-in $SEG1INT --physdev-out
$OUTINT -j AC
CEPT
iptables -A FORWARD -m physdev --physdev-in $SEG2INT --physdev-out
$OUTINT -j AC
CEPT


