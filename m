From: "Raul I. Becette" <raulbecette@unp.edu.ar>
Subject: port forwarding partially working
Date: Wed, 16 Feb 2005 17:58:29 -0300
Message-ID: <4213B3F5.1010508@unp.edu.ar>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello again

I am having trouble forwarding ports to internal servers.

There is a server in the LAN at $SERV_BIBL running on Windows NT4 and 
the port forwarding lines

$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1024 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1024 -j DNAT 
--to $SERV_BIBL:110

works ok when I telnet $PUB_IF 1024. I got redirected to the POP server 
with no problems.

The problem is when I try to forward port any other port (including 
1024) to the same server on ports 25 or 21 (ftp access too).
The lines I added to my iptables scripts are the same as above changing 
1024 to 1025 and 110 to the service port (25 or 21).

Mail server running is MERCUR SMTP Server (v4.02.07
FTP Server running is WarFTPd 1.81.01

When I telnet internally to the private IP on ports 25 and 21 I have no 
problems and get the welcome message of the service.

The same thing happens with another internal server running on Mandrake 
Linux
POP works ok but MTA and FTP services are not forwarded on the ports I added
Postfix Mail Server and ProFTPD 1.2.5rc1 Server

One last thing
I have a forwarding of port 25 on $PUB_IF to port 25 on my internal POP 
server with the users accounts and it works ok.
Same with POP

Below are the lines I have on my script for this I want to do

# Abro el puerto de smtp para enviar los correos desde unpata hacia a La 
Gran Bestia POP
$IPTABLES -A FORWARD -i $PUB_IF -s $LAN_SMTP -p tcp --dport 25 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 25 -j DNAT --to 
$LAN_POP:25

# POP a cuentas unpata.edu.ar y unp.edu.ar
$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 110 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 110 -j DNAT 
--to $LAN_POP:110
-------------------------------------So far the forwarding works 
OK------------------------------------------------------

-------------------------------------From here only forwarding to 110 
works--------------------------------------------
# Cuentas biblioteca.unp.edu.ar
$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1024 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1024 -j DNAT 
--to $SERV_BIBL:110

$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1025 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1025 -j DNAT 
--to $SERV_BIBL:25

# Cuentas ing.unp.edu.ar
$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1030 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1030 -j DNAT 
--to $SERV_ING:110

$IPTABLES -A FORWARD -i $PUB_IF -p tcp --dport 1031 -j ACCEPT
$IPTABLES -t nat -A PREROUTING -i $PUB_IF -p tcp --dport 1031 -j DNAT 
--to $SERV_ING:25

If you need more info just ask

Any help would be greatly appreciated

Thanks in advance


-----------------------------------------------------------------
Raul I. Becette
E-mail: raulbecette@unp.edu.ar
REPAC, Red Patagonica de  Comunicaciones
Univ. Nac. de la Patagonia San Juan Bosco
Ciudad Universitaria - Km.4.
9000 - Comodoro Rivadavia - Chubut
Tel/Fax : (0297) - 4550073
------------------------------------------------------------------


