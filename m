From: Michael Gale <mgale@utilitran.com>
Subject: Hello -- kind of of topic -- but still related
Date: Wed, 3 Dec 2003 15:10:30 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203151030.31eaeacd.mgale@utilitran.com>
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

Hello,

	I am wondering if any one can help me out with this. On our production FTP server and have setup of the firewall rules to allow FTP traffic.

$IPT -A INPUT -i $EXT -p tcp -d $EXT_IP --destination-port ftp -j ACCEPT
$IPT -A INPUT -i $EXT -d $EXT_IP -m state --state RELATED -j ACCEPT
$IPT -A INPUT -i $EXT -d $EXT_IP -m state --state ESTABLISHED -j ACCEPT

Above these rules I have the following:
$IPT -A INPUT -i $EXT -f -j firewall 
$IPT -A INPUT -i $EXT -d $EXT_IP -m unclean -j firewall
$IPT -A INPUT -i $EXT -d $EXT_IP -p tcp ! --syn -m state --state NEW -j firewall

The firewall target logs the info and then drops the packet.

In my log I am seeing the following -- but our production FTP server is currently out side of our network so we can connecting to it through a Cisco router. Not my doing :(
Dec  3 15:00:57 lightning kernel: Firewall:IN=eth0 OUT= MAC=X.X.X.X SRC=CISCO_ROUTER DST=FTP_SERVER LEN=40 TOS=0x00 PREC=0x00 TTL=255 ID=16538 PROTO=TCP SPT=5 DPT=35607 WINDOW=0 RES=0x00 ACK RST URGP=0 

There are a large number of these packets -- at first it thought maybe it was the Cisco router doing something funny when a FTP connect closed and it was trying to close or reset the data channel. 

Any ideas ?

-- 
Michael Gale
Network Administrator
Utilitran Corporation

