From: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Subject: Changhing Source IP (Without SNAT i guess) issue, (help me please)
Date: Thu, 2 Jun 2005 20:51:23 -0300
Message-ID: <7b85e5305060216511185bb4a@mail.gmail.com>
Reply-To: Guillermo Javier Nardoni <gjnardoni@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi, well i've been read a lot of tutorials but i can get this working.-
I tell you my scenario, so you can better understand me.


Scenario:

Linux Box with theses settings

eth0: (internal network 192.168.0.0/24)
ip: 192.168.0.1
nm: 255.255.255.0

eth1: (all internal server hanged through this nic. They are three)
ip: 192.168.1.1
nm: 255.255.255.0


eth2: (Nic used to make pppoe over a cisco 677)
ip: 10.0.0.1
nm: 255.0.0.0

ppp0: Internet Connection (pppoe dhcp)

Actually, everything is working perfectly but...=20

Windows 2000 server running some Built-in software (such as a program
on an intranet)
listening on ports 7777/2106

eth0:=20
ip: 192.168.1.2
nm: 255.255.255.0
gw: 192.168.2.1


Here we go with the issue:

When a customer make a connection through ppp0 interface, the linux
box route the packets (on ports 7777 and 2106) directly to
win2000 server and it works fine, but with the External IP of the
Firewall, so the software can't work .
so i have to change the source ip before routing (not with SNAT) to
use the firewall's internal ip (actually  192.168.2.1). how
should i do that?.,
i tried to do this using DNAT, SNAT, FORWARD but it doesn't work

I have many customers without system, so they are very ungry, ;-)=20

Regards
Guillermo from Argentina.-


--=20
Atte.
Guillermo Javier Nardoni
Estudiante de Ing. en Sistemas
Tel: 03402-15540590

