From: Sam Loy <sampaw@mac.com>
Subject: Please - Still not working...
Date: Thu, 1 Jul 2004 12:33:06 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <B66AB7DA-CB84-11D8-B251-000A95AD0230@mac.com>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Type: multipart/mixed; boundary=Apple-Mail-1-874320403
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
To: netfilter@lists.netfilter.org


--Apple-Mail-1-874320403
Content-Transfer-Encoding: 7bit
Content-Type: application/octet-stream;
	x-unix-mode=0755;
	name="new-fwscript"
Content-Disposition: attachment;
	filename=new-fwscript



PATH=/bin:/sbin:/usr/bin:/usr/sbin

# NOTES:
# 1) Assumes that eth0 is external interface, and eth1 is internal.  Adjust
#    to taste.

# Get current details:
EXT_IF=ppp0
INT_IF=eth0
EXTERNAL_IP=`ifconfig $EXT_IF | grep "inet addr:" | awk '{print $2}' | \
		cut -f 2 -d :`

# Clean out tables
iptables --flush
iptables --table nat --flush
iptables --delete-chain
iptables --table nat --delete-chain

# Set up source nat
iptables --table nat --append POSTROUTING --out-interface $EXT_IF \
		-j MASQUERADE


# Allow loopback traffic
iptables -A INPUT -i lo -p all -j ACCEPT
iptables -A INPUT -i eth0 -p all -j ACCEPT
iptables -A INPUT -i ppp0 -p all -j ACCEPT


echo 1 > /proc/sys/net/ipv4/ip_forward



# DEBUG ONLY!
#iptables -A INPUT -j LOG --log-prefix "INPUT_DROP: "
#iptables -A OUTPUT -j LOG --log-prefix "OUTPUT_DROP: "
########################################################################


--Apple-Mail-1-874320403
Content-Transfer-Encoding: 7bit
Content-Type: text/plain;
	charset=US-ASCII;
	format=flowed



All of you who have helped, thank you, You have been very helpful and I 
have learned a lot.

In fact, the enclosed script works. However, correct me if I am wrong, 
but there is absolutely zero protection. I am letting all traffic come 
in and out.

Please help me with the next step...I want to allow ALL traffic 
originating from me and me only into my internal network from the 
internet. No restrictions....except it must have originated from me.

Thank you,

Sam
--Apple-Mail-1-874320403--


