From: marquis@poste.isima.fr
Subject: pb : iptables - redirection - prerouting
Date: Sun, 2 May 2004 23:04:30 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1665.80.119.127.166.1083557070.squirrel@poste.isima.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hello

The configuration of my network is the next:

                      INTERNET
                         I
                         I ppp0
                         I
                      FW(linux)
               eth0  /         \ eth1
                    /           \
                   /             \
           192.168.0.25       192.168.1.36


The FW is a linux mandrake red hat.

I have installed an ftp server on 192.168.0.25 port 6666 mode PASV.
I can connect myself from 192.168.1.36 with giving 192.168.0.25 as server IP.
I cannot connect myself from 192.168.1.36 giving one of the FireWall IPs.
Normal ! I must use prerouting utility to redirect packets.
To do prerouting of anyone to my ftp server (192.168.0.25), I do this :

$IPTABLES -A FORWARD -p tcp --dport 6666 -j ACCEPT
$IPTABLES -A FORWARD -p tcp --dport 60100:60200 -j ACCEPT

$IPTABLES -A PREROUTING -t nat -p tcp --dport 6666 -j DNAT
--to-destination 192.168.0.25
$IPTABLES -A PREROUTING -t nat -p tcp --dport 60100:60200 -j DNAT
--to-destination 192.168.0.25

but it doesn't work : I can even not connect to the ftp server !

Could you help me ?

Thanks for reading ...

Xavier

