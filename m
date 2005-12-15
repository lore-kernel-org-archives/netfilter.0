From: "Steverding, Kai" <Kai.Steverding@gws.ms>
Subject: DNAT to localhost
Date: Thu, 15 Dec 2005 15:08:03 +0100
Message-ID: <C43D74B62BA19A45ADD74C1AB7AEE542017BCEE1@nt-gws2.gws-muenster.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Hi !
I am stuck with a redirection problem :

I have a POP3-Server wich can only bind on 0.0.0.0 or a single =
ip-adress. My
machine has two internal  ip-adresses (192.168.10.1 and 192.168.20.1) =
the
POP3-Server needs to listen on and one external address it musn't =
listen on.
So i thought : "No problem, i will make the POP3-Server bind to
localhost:110 and redirect incoming traffic to the two ip-adresses
192.168.10.1 and 192.168.20.1 to localhost:110". I made the following
ruleset for it :

iptables -t nat -I PREROUTING -p tcp -i eth0 -d 192.168.10.1/32 --dport =
110
-j DNAT --to-destination 127.0.0.1
iptables -t nat -I PREROUTING -p tcp -i eth0 -d 192.168.20.1/32 --dport =
110
-j DNAT --to-destination 127.0.0.1

But it doesn't work. Wenn i try to connect to 192.168.10.1 Port 110 =
from a
client nothing happens.
"iptables -t nat -L PREROUTING -v" shows me that the packets have been
matched by the rules (the counters are up)

What wen't wrong ?=20


Thanks

Kai


Mit freundlichen Gr=FC=DFen

Kai Steverding=09

GWS Gesellschaft f=FCr Warenwirtschafts-Systeme mbH
Kr=F6gerweg 10 - 48155 M=FCnster - Germany
eMail: mailto:steverding@gws.ms
Telefon: +49 251 7000-02 / Fax -3910
Besuchen Sie uns im Internet: http://www.gws.ms____






