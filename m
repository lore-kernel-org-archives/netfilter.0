From: Rajiv Shah <rajiv@theargoncompany.com>
Subject: Packets missing state ?
Date: Tue, 23 Dec 2003 18:28:59 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312231828.59518.rajiv@theargoncompany.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
	I can see the following lines in my /var/log/messages

IN=eth1 OUT= MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=69.6.16.110 
DST=xxx.xxx.xxx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=61 ID=15968 PROTO=TCP SPT=80 
DPT=1821 WINDOW=65535 RES=0x00 ACK URGP=0

IN=eth1 OUT= MAC=00:03:47:6a:5c:6b:00:c0:49:25:d1:a3:08:00 SRC=69.6.16.110 
DST=xxx.xxx.xxx.xx LEN=40 TOS=0x00 PREC=0x00 TTL=61 ID=15968 PROTO=TCP 
SPT=110 DPT=4553 WINDOW=65535 RES=0x00 ACK URGP=0

where xxx.xxx.xxx.xx is my IP. This seems to be one of the return packets 
which is being logged. I can access the site without any problems. The mails 
come thru, can do a ssh login. But looking at the logs I feel there is some 
problem somewhere. Here is what I am checking for input packets.

**********************************************************************************************************
$IPT -A IN_FIREWALL -p tcp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A IN_FIREWALL -p udp -m state --state ESTABLISHED,RELATED -j ACCEPT
$IPT -A IN_FIREWALL -j LOG --log-prefix "IPT IN_FIREWALL: " $LOGOPT
$IPT -A IN_FIREWALL -j DROP
**********************************************************************************************************

-- 
 
======================================================
 
Warm Regards,
 
Rajiv Shah
Systems Engineer,
The Argon Company
www.theargoncompany.com
-----------------------------------------------------------------------------------------------------------
FREE sign-up for a virus-protected Secure Mailbox - www.tassm.com


