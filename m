From: Chris Garringer <chris.garringer@tic.toshiba.com>
Subject: FTP server
Date: 24 Mar 2003 08:53:24 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048517604.1188.10.camel@bordercollie>
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
To: Netfilter List <netfilter@lists.netfilter.org>

I have an ftp server that I am using iptables for host-based firewall
(no routing).  I set it up with LOG at the end of the rules and a DROP
policy on INPUT.  Last week I could contact it from my desktop (RedHat
8.0) via command line or Mozilla with no problem.   I came in this
morning a people could not list the directory , no PASV connections were
being accepted.  The connection attempts showed in the log .   Below is
my rule set:
where xxx.xxx.xxx.xxx is the ftp server address.  xx.xx.xx.xx is
subnet/host for various items. What am I doing wrong?  Active
connections work, but not passive.
Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     udp  --  <name server>  xxx.xxx.xxx.xxx        udp spt:domain
DROP       udp  --  anywhere             anywhere           udp
dpt:netbios-ns
ACCEPT     icmp --  anywhere             xxx.xxx.xxx.xxx        icmp
echo-request
ACCEPT     icmp --  anywhere             xxx.xxx.xxx.xxx       state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             xxx.xxx.xxx.xxx        state
NEW,ESTABLISHED tcp dpt:ftp
ACCEPT     tcp  --  xx.xx.xx.xx/xx         xxx.xxx.xxx.xxx        tcp
dpt:ssh
ACCEPT     tcp  --  xx.xx.xx.xx/xx        xxx.xxx.xxx.xxx        tcp
dpt:ssh
ACCEPT     tcp  --  xx.xx.xx.xx          xxx.xxx.xxx.xxx        tcp
dpt:ssh
ACCEPT     tcp  --  ftp.tic.toshiba.com  ftp.tic.toshiba.comtcp spt:smtp
ACCEPT     tcp  --  10.0.112.32          xxx.xxx.xxx.xxx        tcp
dpt:ssh
ACCEPT     tcp  --  10.0.112.32          xxx.xxx.xxx.xxx        tcp
spt:1984
ACCEPT     tcp  --  anywhere             xxx.xxx.xxx.xxx        state
RELATED,ESTABLISHED
ACCEPT     tcp  --  anywhere             xxx.xxx.xxx.xxx        tcp
spt:time
LOG        all  --  anywhere             anywhere           LOG level
warning

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination


-- 
Chris D. Garringer
Toshiba International
LAN/WAN Supervisor
713-466-0277 x3756
Certified Solaris Administrator
Microsoft Certified Engineer (NT)
RedHat Certified Engineer


