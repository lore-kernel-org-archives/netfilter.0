From: travis@visionsbeyond.com
Subject: FTP: masqued AND forwarded
Date: Wed, 26 Jan 2005 15:31:04 -0700 (MST)
Message-ID: <36476.192.168.2.125.1106778664.squirrel@mail2.visionsbeyond.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all,
     I am new to the list.  I have spent several hours scouring the
archives trying to find out how to send external ftp requests to an
internal server while at the same time allowing clients behind the
firewall to access external ftp servers.  (currently requests from
internal clients to external ftp servers time out).

Any suggestions would be greatly appreciated!

Here are the rules that I have in place:

#Load Modules
/sbin/modprobe ip_tables
/sbin/modprobe iptable_filter
/sbin/modprobe ip_conntrack
/sbin/modprobe ip_conntrack_ftp
/sbin/modprobe ip_nat_ftp

#Send ftp to an internal machine
$IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport 20
-j DNAT --to 192.168.2.5:20
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 20 -j
ACCEPT
$IPTABLES -A PREROUTING -t nat -i $EXTERNALIF -p tcp -d $MYADDR --dport 21
-j DNAT --to 192.168.2.5:21
$IPTABLES -A FORWARD -i $EXTERNALIF -p tcp -d 192.168.2.5 --dport 21 -j
ACCEPT

#Masquerade internal connections going out.
$IPTABLES -A POSTROUTING -t nat -o $EXTERNALIF -j MASQUERADE


$MYADDR is the firewall external address
$EXTERNALIF is the external interface (eth0)
$INTERNALIF is the internal interface (eth1)



Travis Crook
Visions Beyond


