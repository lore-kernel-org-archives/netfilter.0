From: "Data Leung (IS)" <Data.Leung@strhk.com>
Subject: About PPPTP CALLER ID MASQ on Linux router
Date: Mon, 13 Dec 2004 20:21:51 +0800
Message-ID: <18CB1E796801E346B7D976C586DA8051904401@strhk-exchange.strhk.com>
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
To: netfilter@lists.netfilter.org

Dear All , 
         I got few problems on my RedHat Linux V9.0  . 
         
         My network diagram had been shown as below . 
  
        [OFFICE ] 3 x PPTP Client  <====> [IPTABLES ROUTER ] Redhat Linux
9.0 <=====> [HOME] Internet PPTP Server .
         I found that my office client only password allow 1 x PPTP client
connect to my home PPTP server . And not possible allow more than 1 users
connect to the same PPTP server 
I found few website that's about this issues include 
 
PPTP Caller ID issues :
http://sourceforge.net/docman/display_doc.php?docid=14460
<http://sourceforge.net/docman/display_doc.php?docid=14460&group_id=44827>
&group_id=44827
PPTP Through iptables firewall :
https://lists.netfilter.org/pipermail/netfilter/2003-February/041869.html
<https://lists.netfilter.org/pipermail/netfilter/2003-February/041869.html> 
And lots of VPN MASQ How-to . 
 
But the problems seems can't be fix . 
I try to : 
1. Apply patch-o-matic-20030912.tar.tar
2. mv patch-o-matic to /usr/src
3. cd /usr/src/patch-o-matic 
4. export KERNEL_DIR="/usr/src/linux-2.4"
5. export IPTABLES_DIR="/usr/src/iptables-1.2.7a"
6. ./runme extra/pptp-conntrack-xxx.patch <-- I forgot this .
7. Recomplie the kernel . <=== I can't find Caller ID MASQ in menuconfig
8 . cd /usr/src/iptables-1.2.7a
9. make && make install
10 . make the new kernel work and vi /etc/grub.conf
11. Apply nessary firewall scripts and modprobe ip_nat_proto_gre and
modprobe ip_nat_pptp
12. And add /sbin/iptables -A FORWARD -p 47 -j ACCEPT and /sbin/iptables -A
FORWARD -p tcp --dport 1723 -j ACCEPT
13. When I starting up more than one users connect to my home pptp server I
found there got some error message appear in the firewall  screen "
ip_conntrack_c xxx csum error "
 
My home PPTP server is running pptpd-1.1.3-20030409.tar.gz which had been
apply MPPE128 Kernel Patch . 
Is there anyone know that how can I  make " CALLER ID APPEAR "  ? 
Also how can I make multi-pptp client pass through my Linux router connect
to my Home PPTP server ? Please notice that my home pptp server is running
boardcast IP address without any FIREWALL .
 
Many thanks all of your help .
 
 

	Thanks and best regards 

	Specialized Technology Resources HK Ltd 
MIS Department - System Administrator 
E-mail : Data.Leung@strhk.com : +852 24188040 

        Data Leung 

This email is confidential to the addressee and may contain privileged
information. If you are not the addressee you are not permitted to use or
copy this email or its attachments nor may you disclose the same to any
third party. If this has been sent to you in error please notify us as soon
as possible.

 
