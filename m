From: "Carl Girard" <solo@digitalbullets.com>
Subject: PPTP behind iptables.
Date: Wed, 10 Jul 2002 04:56:32 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <003301c22808$d56683b0$b8ea0344@DIGITALBULLETS.LAN>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

I am trying to get a Window2000 Server VPN (PPTP) server behind my linux
firewall to work.  I have been able to forward web trafic to the internal
server just for testing.


I currently have this for NAT...
iptables -t nat -A POSTROUTING -s 172.20.40.0/24 -o eth0 -j MASQUERADE

And this for the forwarding of traffic on port 1723 (PPTP)...
iptables -t nat -A PREROUTING -p tcp --dport 1723 -i eth0 -j DNAT --to
172.20.40.2


I know that PPTP uses GRE (protocol 47) after the connection is made.  The
connection is initiated with a tcp connection to port 1723.

When I initiate a connection from a VPN PPTP client it gets as far as
authentication.  It finds the server and the server responds asking for
authentication information.  After that it dies.

eth0 - 68.3.233.69 (internet connection)
eth1 - 172.20.40.1 (lan connection)
ip of internal PPTP server - 172.20.40.2

Any help would be great.  Let me know if more information is needed.

Thanks,
Carl


