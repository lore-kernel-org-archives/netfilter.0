From: <peter.gehle@sbgit.com>
Subject: Re: tcp packets on 25 port FORWARDING
Date: 12 Mar 2004 10:03:50 UT
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DIIE.000000F500002A22@sbgit.com>
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
Content-Type: text/plain; charset="macroman"
To: netfilter@lists.netfilter.org

Try this:

LAN_IP=3D$(ifconfig eth1 | head -n 2 | tail -n 1 | cut -d: -f2 | cut -d" " -f 1)
ipatbles -t nat -A PREROUTING -i *EXT-NIC* -p tcp --dport 25 -j DNAT --to_destination *POSTFIX-IP*
iptables -t nat -A POSTROUTING -o *INT-NIC* -p tcp --dport 25 -j SNAT --to-source $LAN_IP
iptables -A FORWARD -i *EXT-NIC* -m state --state NEW -p tcp -d *POSTFIX-IP* --dport 25 -j ACCEPT

EXT-NIC =3D your external Network Interface (eth0, eth1...)
INT-NIC =3D your internal Network Interface (eth1, eth2...) where your Postfix Server is connected to
POSTFIX-IP =3D The IP of your Postfix Server

That should work.

Mit freundlichen Gru=DF / Best regards / Meilleures
salutation / Met vriendelijke groet 

Peter Gehle
Systemberatung Gehle GmbH
Im Bahler Grund 5

D-49413 Dinklage
Germany

Phone : +49 4443 9796-12
Fax   : +49 4443 9796-29

www.sbgit.com


Original Message       processed by Tobit InfoCenter 
Subject: tcp packets on 25 port FORWARDING (12-Mrz-2004 10:50)
From:    stanislav.puffler@seznam.cz
To:      peter.gehle@sbgit.com


Hi there,
I need to forward all tcp packets with port 25 (SMTP) from Internet to machine in my network. My settings (eth0 =3D internet IP, eth1 =3D 192.168.200.1 - dmz IP connected to another machine with Postfix, eth2 =3D 192.168.0.1 - gateway - LAN). Have opened port 25 and setup rule :
 
iptables -t nat -A PREROUTING -p tcp -dport 25 - i eth0 -j DNAT -to 192.168.200.2:85
 
iptables -A FORWARD -i eth0 -p tcp -d 192:168.200.2 -dport 25 -m state -state NEW,ESTABLISHED,RELATED -j ACCEPT
 
But it still doesn't route tcp packets on port 25 to my Postfix computer :o( If I try telnet 192.168.200.2 25 from FW it works, if I try this from Internet, it doesn't work :o( Any ideas ? Thanks a lot.
Stan.
 

To: stanislav.puffler@seznam.cz
Cc: netfilter@lists.netfilter.org


