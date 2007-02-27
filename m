From: "mael\.boutin\@laposte\.net" <mael.boutin@laposte.net>
Subject: IPv6 MARK support
Date: Tue, 27 Feb 2007 10:16:34 +0100
Message-ID: <JE473M$0A485627496EC6D68CACFE7F59BE8932@laposte.net>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi,

  I have a problem with the MARK target support. I want to MARK locally g=
enerated IPv6 packets (UDP, TCP, ICMP ...). For this i use the following =
ip6tables command :

ip6tables -t mangle -A OUTPUT -p udp -j MARK 0x1
ip6tables -t mangle -A OUTPUT -p tcp -j MARK 0x2

All works fine, the rule is added in the OUPUT chain of mangle table. Now=
 i want to retrieve this mark and route packets according to their mark :=


ip -6 route add 2001:688:dd00::5 via 2001:688:bb00::5 dev eth0 table TEST=
1
ip -6 route add 2001:688:dd00::5 via 2001:688:cc00::5 dev eth1 table TEST=
2

=3D> Routes seems to be taken into account and added to the tables (it do=
esn't appear but when you type ip -6 route show table 0 | grep TEST1 you =
can see the rules in TEST1)

ip -6 rule add fwmark 0x1 table TEST1
ip -6 rule add fwmark 0x2 table TEST2

=3D> Rules are added and can be viewed with ip -6 rule show

The test bed is set up correctly (all interfaces can be pinged). 

My problem is that when i generate a UDP flow (via nc) the packets are no=
t marked (i suppose) by ip6tables and therefore iproute does not lookup t=
able TEST1 as it should.

My kernel is 2.6.19.3 with ip6tables compiled as module with all availabl=
e targets, IPv6 multiple routing tables is built in as well as "use netfi=
lter MARK value as routing key"

Best regards,

Ma=EBl=0A=0AEnvoyez vos cartes de voeux depuis www.laposte.net 
Elles seront ensuite distribu=E9es par le facteur : pratique et malin !


