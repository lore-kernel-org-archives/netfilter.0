From: Bowie Bailey <Bowie_Bailey@BUC.com>
Subject: RE: iptables and pop3 lockup
Date: Tue, 16 May 2006 15:33:43 -0400
Message-ID: <4766EEE585A6D311ADF500E018C154E302684A1E@bnifex.cis.buc.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: "Netfilter List (E-mail)" <netfilter@lists.netfilter.org>

Gary W. Smith wrote:
> From what I am seeing below something is still batching DPT 110.  I
> have seen this happen on some machines that do not have kernel
> modules loaded or available.  Case in point, I have a virtual server
> we lease for a project that is based on Fedora Core 2 and it has all
> of the modules statically loaded.  But connection tracking does not
> work so adding reject always causes a failure.
> 
> May 16 14:50:29 bnofmail kernel: FIREWALL: IN=eth0 OUT=
> SRC=70.156.232.189 DST=172.16.17.169 LEN=52 TOS=0x00 PREC=0x00
> TTL=110 ID=23735 DF PROTO=TCP SPT=1867 DPT=110 WINDOW=8280 RES=0x00
> ACK URGP=0
> 
> Can you do two things; send us the output of lsmod and also the
> original rules /etc/sysconfig/iptables instead of the iptables -L
> command. 

# lsmod
Module                  Size  Used by
ip_conntrack_ftp       76273  0
ipt_REJECT             10561  1
ipt_LOG                10049  1
ipt_state               5825  11
ip_conntrack           45573  2 ip_conntrack_ftp,ipt_state
iptable_filter          6721  1
ip_tables              21441  4 ipt_REJECT,ipt_LOG,ipt_state,iptable_filter
md5                     8001  1
ipv6                  240225  36
autofs4                22597  0
w83627hf               29161  0
eeprom                 12385  0
i2c_sensor              7489  2 w83627hf,eeprom
i2c_isa                 6081  0
i2c_i801               11725  0
i2c_dev                14273  0
i2c_core               25921  6
w83627hf,eeprom,i2c_sensor,i2c_isa,i2c_i801,i2c_dev
sunrpc                142757  1
dm_mirror              28449  0
dm_mod                 59973  1 dm_mirror
button                 10449  0
battery                12869  0
ac                      8773  0
uhci_hcd               32729  0
ehci_hcd               31813  0
b44                    25037  0
mii                     9153  1 b44
floppy                 58065  0
ext3                  118729  1
jbd                    59481  1 ext3
raid1                  19649  2
ata_piix               13381  4
libata                 57885  1 ata_piix
sd_mod                 20545  6
scsi_mod              116941  2 libata,sd_mod

# cat /etc/sysconfig/iptables
# Firewall configuration written by system-config-securitylevel
# Manual customization of this file is not recommended.
*filter
:INPUT ACCEPT [0:0]
:FORWARD ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
:RH-Firewall-1-INPUT - [0:0]
-A INPUT -j RH-Firewall-1-INPUT
-A FORWARD -j RH-Firewall-1-INPUT
-A RH-Firewall-1-INPUT -i lo -j ACCEPT
-A RH-Firewall-1-INPUT -p icmp --icmp-type any -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 25 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 110 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 53 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m udp -p udp --dport 53 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 587 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 80 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 22 -s
172.16.0.0/16 -j ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 443 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 995 -j
ACCEPT
-A RH-Firewall-1-INPUT -m state --state NEW -m tcp -p tcp --dport 21 -j
ACCEPT
-A RH-Firewall-1-INPUT -j LOG --log-prefix "FIREWALL: " --log-level 1
-A RH-Firewall-1-INPUT -j REJECT --reject-with icmp-host-prohibited
COMMIT

-- 
Bowie

