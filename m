From: =?ISO-8859-2?Q?=22bogn=E1r=2C_attila=22?= <attila.bognar@netalfa.com>
Subject: ftp nat, snat PORT translation ok, dnat PASV translation fail
Date: Fri, 08 Aug 2003 10:19:30 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F335D12.2050008@netalfa.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Dear List,

I know this question came up many times, I just cannot solve it. I spent 
a lot of time searching list archives and the web, just found nothing 
that could help.

I have an ftp server with a private ip address, ftp listening on port 
21. I want to DNAT a real address port 21 to it.


+--------------+
| real ip host |
+--------------+ real address: 555.666.777.888
         |
         |
      internet
         |
         |
+--------------+ real addresses: 111.222.333.444, 111.222.333.445
|    firewall  |
+--------------+ internal address: 10.7.7.1
         |
         |
      local network (10.7.7.0/24)
         |
         |
+--------------+ address: 10.7.7.12
|  ftp server  |
+--------------+


I have the following rules (the simplest possible):

iptables -F
iptables -F INPUT
iptables -F OUTPUT
iptables -F FORWARD
iptables -F -t mangle
iptables -F -t nat
iptables -X
iptables -P INPUT ACCEPT
iptables -P OUTPUT ACCEPT
iptables -P FORWARD ACCEPT

iptables -t nat -A PREROUTING -p tcp -d 111.222.333.445 
--destination-port 80 -j DNAT --to 10.7.7.12:80
iptables -t nat -A PREROUTING -p tcp -d 111.222.333.445 
--destination-port 21 -j DNAT --to 10.7.7.12:21
iptables -t nat -A POSTROUTING -j SNAT -d ! 10.7.7.0/24 -s 10.7.7.12 
--to-source 111.222.333.445


that is all (apart some other redirections but with other 
addresses/ports, no rules on input/output/forwarding, I will make 
restrictions when it works)

http and other "simple" protocols are working. ftp from the ftp server 
works fine to the internet, both active and passive mode (address in 
PORT command is translated from local to external ip).

active ftp from outside works fine (simple dnat and snat). but passive 
ftp from outside to the ftp server does not work.

user@exthost:~ $ telnet 111.222.333.445
telnet from external machine:
Trying 1111.222.333.445...
Connected to 111.222.333.445.
Escape character is '^]'.
220 ProFTPD 1.2.8 Server (FTP server) [**]
USER username
331 Password required for apartman.
PASS password
230 User apartman logged in.
PASV
227 Entering Passive Mode (10,7,7,12,128,76).
quit
221 Goodbye.
Connection closed by foreign host.
user@exthost:~ $

first problem is that the address of the port the server is waiting the 
connection on is not changed in 227 to a real address and port on the 
firewall.  when I ftp from the ftp server to an external host, the 
address and port in the PORT command is updated as it should be (that is 
there some tracking).

my kernel is 2.4.20, without any special ipfilter patch.

firewall:~# lsmod
Module                  Size  Used by    Not tainted
ip_nat_ftp              3152   0  (unused)
ip_conntrack_ftp        4176   1
firewall:~#

if I add logging targets to the beginning of the chains:

iptables -A INPUT -p tcp -s 555.666.777.888  -m helper --helper ftp -j 
LOG --log-level 7 --log-prefix "fw-input exhost ct: "
iptables -A OUTPUT -p tcp -d 555.666.777.888 -m helper --helper ftp -j 
LOG --log-level 7 --log-prefix "fw-output exhost ct: "

iptables -t nat -A PREROUTING -p tcp -s 555.666.777.888  -m helper 
--helper ftp -j LOG --log-level 7 --log-prefix "fw-nat-pre exhost ct: "
iptables -t nat -A POSTROUTING -p tcp -d 555.666.777.888  -m helper 
--helper ftp -j LOG --log-level 7 --log-prefix "fw-nat-post exhost ct: "

there is a log for both active and passive ftp initiated from the ftp 
server (that is it tracks both passive and active ftp if I am not wrong).

if I access the ftp server from the outside, there is no log at all 
(there is no tracking).


thanks in advance for any help,

attila





