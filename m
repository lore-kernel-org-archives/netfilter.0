From: "Michael K" <micke@klintan.se>
Subject: RE: ip_conntrack_ftp problem
Date: Fri, 28 Mar 2003 09:50:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2f507$13816ae0$0200a8c0@klintan.local>
References: <3E83FC78.7080801@ms.sapientia.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E83FC78.7080801@ms.sapientia.ro>
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
To: 'Budai Laszlo' <lbudai@ms.sapientia.ro>, netfilter@lists.netfilter.org

> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Budai Laszlo
> Sent: Friday, March 28, 2003 8:41 AM
> To: netfilter@lists.netfilter.org
> Subject: ip_conntrack_ftp problem
> 
> 
> 
> 
> we use Redhat Linux 8 to connect our lan to the internet. 
> Internally we 
> are using private addresses which are SNAT-ed (MASQUERADE) by 
> the linux box.
> 
> We set up a firewall which in the forward chain looks like:
> 
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination
> ACCEPT     all  --  anywhere             anywhere           
> state RELATED
> ACCEPT     tcp  --  192.168.101.25       anywhere           
> tcp dpt:telnet
> ACCEPT     tcp  --  192.168.101.24       anywhere           
> tcp dpt:telnet
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:ldap
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:imap
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:rtsp
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:cvspserver
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:cvspserver
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:5190
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:squid
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:https
> ACCEPT     udp  --  192.168.101.0/24     anywhere           
> udp dpt:domain
> ACCEPT     udp  --  192.168.101.0/24     anywhere           
> udp dpt:7070
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:7070
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:https
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:5050
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:pop3
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:http
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:domain
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:smtp
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:ssh
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:ftp
> ACCEPT     tcp  --  192.168.101.0/24     anywhere           
> tcp dpt:ftp-data
> DROP       tcp  --  192.168.101.0/24     anywhere
> 
> 
> so we try to limit the access just to a few accepted services. We are 
> loading the ip_conntrack_ftp and ip_nat_ftp modules:
> 
> # lsmod
> Module                  Size  Used by    Not tainted
> ipt_state               1080   1  (autoclean)
> cls_u32                 6332   2  (autoclean)
> sch_cbq                14912   2  (autoclean)
> ip_nat_ftp              4240   0  (unused)
> ip_conntrack_ftp        5088   0  (unused)
> eepro100               22264   1
> 8139too                17736   1
> mii                     2156   0  [8139too]
> iptable_mangle          2776   1  (autoclean)
> ipt_MASQUERADE          2200   0  (autoclean)
> ipt_REDIRECT            1368   3  (autoclean)
> iptable_nat            19960   2  (autoclean) [ip_nat_ftp 
> ipt_MASQUERADE ipt_REDIRECT]
> ip_conntrack           21244   3  (autoclean) [ipt_state 
> ip_nat_ftp ip_conntrack_ftp ipt_MASQUERADE ipt_REDIRECT iptable_nat]
> iptable_filter          2412   1  (autoclean)
> ip_tables              15224   8  [ipt_state iptable_mangle 
> ipt_MASQUERADE ipt_REDIRECT iptable_nat iptable_filter]
> mousedev                5524   0  (unused)
> keybdev                 2976   0  (unused)
> hid                    22244   0  (unused)
> input                   5920   0  [mousedev keybdev hid]
> usb-uhci               26188   0  (unused)
> usbcore                77024   1  [hid usb-uhci]
> ext3                   70336   3
> jbd                    52212   3  [ext3]
> sym53c8xx              68240   4
> sd_mod                 13552   8
> scsi_mod              107176   2  [sym53c8xx sd_mod]
> 
> 
> but ftp trough the firewall still does not work. :(
> what is wrong?
> 
> Thanks,
> Laszlo
> 
I'm sure that active ftp works. Active FTP uses port TCP/20 for data
channel. Passive ftp uses > TCP/1023
So
Active FTP uses TCP port 21 and 20
Passive FTP uses TCP port 21 and > 1023

/Klintan



