From: Erik Pagel <erik.pagel@gmx.de>
Subject: Yet another FTP connection problem
Date: Thu, 06 Jun 2002 17:41:52 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <373560121.1023385312@[192.168.13.4]>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
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

Hi,

there seems to be a problem within my FTP rules. I'm not able to make any 
ftp connection.
I'm able to send but not to recevie any package.
Maybe someone can point me to my mistake.

iptables -N ftp
#No incomming connections, only outgoing and only in PASV mode.
iptables -A ftp -p tcp --dport 20:21 -o $I_EXTERN -j ACCEPT
iptables -A ftp -p tcp --sport 20:21 -i $I_EXTERN -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A ftp -p tcp --dport 20:21 -i $I_EXTERN -m state --state 
NEW,INVALID -j LOG --log-level warning --log-prefix "DROP:FTP Incomming"
iptables -A ftp -p tcp --dport 20:21 -i $I_EXTERN -m state --state 
NEW,INVALID -j DROP
iptables -A INPUT   -j ftp
iptables -A OUTPUT  -j ftp
iptables -A FORWARD -j ftp

all I get after some tries to establish a connection from my firewall to 
ftp.funet.fi:

iptables -v -L ftp
 pkts bytes target prot opt in     out   source    destination
   20  1200 ACCEPT tcp  --  any    ppp+  anywhere  anywhere  tcp 
dpts:ftp-data:ftp
    0     0 ACCEPT tcp  --  ppp+   any   anywhere  anywhere  tcp 
spts:ftp-data:ftp state RELATED,ESTABLISHED
    0     0 ACCEPT tcp  --  ppp+   any   anywhere  anywhere  tcp 
dpts:ftp-data:ftp state RELATED,ESTABLISHED
    0     0 LOG    tcp  --  ppp+   any   anywhere  anywhere  tcp 
dpts:ftp-data:ftp state INVALID,NEW LOG level warning prefix `DROP:FTP 
Incomming'
    0     0 DROP   tcp  --  ppp+   any   anywhere  anywhere  tcp 
dpts:ftp-data:ftp state INVALID,NEW
--------------------------

Thanks in advance
Erik Pagel

