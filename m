From: =?ISO-8859-1?Q?Jo=E3o?= <joao.cassio@via-rs.net>
Subject: iptables prerouting
Date: Tue, 11 Nov 2003 11:07:39 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FB0ED2B.5070406@via-rs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter list <netfilter@lists.netfilter.org>

Dear All,

I like know how enable all my lan inside for conections pcAnywhere. Actua=
ly connection pcAnywhere is realization by a computer in my lan inside (1=
92.168.1.100) with success. :)

              ----------------------------------
             | server conection ADSL Red Hat 9.0|
              ----------------------------------
                            |
                            |
      -----------------------------------------------
      |                     |                      |
192.168.1.100       192.168.1.102           192.168.1.103
Windows 2000         Windows 98              Windows 2000


iptables -A INPUT -p tcp --dport 5631 -j LOG --log-prefix "Servico TCP=20
PCAny"
iptables -A INPUT -p udp --dport 5632 -j LOG --log-prefix "Servico UDP
PCAny"

iptables -t nat -A PREROUTING -i ppp0 -p tcp --dport 5631 -j DNAT
--to-destination 192.168.1.100
iptables -t nat -A PREROUTING -i ppp0 -p udp --dport 5632 -j DNAT
--to-destination 192.168.1.100

iptables -t filter -A FORWARD -i ppp0 -o eth1 -p tcp -m state --dport
5631 --syn --state NEW -j ACCEPT
iptables -t filter -A FORWARD -i ppp0 -o eth1 -p udp --dport 5632 -j ACCE=
PT
iptables -t filter -A FORWARD -m state --state ESTABLISHED,RELATED -j ACC=
EPT


Thanks,
Jo=E3o





Esta precisand




