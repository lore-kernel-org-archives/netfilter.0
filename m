From: Jaroslav Knespl <jaroslav@knespl.cz>
Subject: ACCEPT ESTABLISHED doesn't work
Date: Thu, 09 May 2002 14:44:11 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CDA6F1B.8020302@knespl.cz>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.samba.org

Hi all,

I use following rules (not only :-) in my fw script:


$IPTABLES -A INPUT -i $INTERNAL -m state --state INVALID -j DROP
$IPTABLES -A INPUT -i $INTERNAL -m state --state RELATED,ESTABLISHED -j 
ACCEPT

but when I try to connect to w98 using smbmount or smbclient it still 
drops returning packets. I think that they should be ESTABLISHED packets 
and should be accepted. Can you help me to find, where is a problem?

Relevant syslog message:

May  9 13:22:02 fw kernel: Rule21:IN=eth0 OUT= 
MAC=00:02:1b:f1:50:26:00:50:fc:50:24:6c:08:00 SRC=192.168.1.72 
DST=192.168.1.2 LEN=90 TOS=0x00 PREC=0x00 TTL=128 ID=39856 PROTO=UDP 
SPT=137 DPT=32784 LEN=70

where 192.168.1.2 is linuxbox from where I am trying to connect w98 
computer with ip 192.168.1.72 and Rule21 is the last rule in the INPUT 
table:

 $IPTABLES -A INPUT -j LOG --log-prefix="Rule21:"

Default policy of INPUT table is DROP

I am using Debian woody with 2.4.18 kernel and iptables v1.2.5

ucar





