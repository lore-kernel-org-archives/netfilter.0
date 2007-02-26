From: angico <angico@yahoo.com>
Subject: strange behaviour
Date: Mon, 26 Feb 2007 04:45:47 -0800 (PST)
Message-ID: <20070226124547.69013.qmail@web36804.mail.mud.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi, everybody!=0Ai have a problem that you may help to solve, surely.=0Ai h=
ave a server (a) connected to the internet via eth0/ppp0 (adsl).=0Aanother =
computer (b) is connected to this server thru eth1, and it should reach the=
 internet via the server which is its gateway. and so it did!... up to a mo=
nth ago.=0Ai think nothing's changed. all i did was a re-installing of my g=
entoo based system on the server, due to problems on the hard-disk. but fir=
ewall rules (iptables) remain the same. and the netted computer can't reach=
 the internet anymore! =0Athings got exquisite because:=0A- i ping any site=
 on the internet from (b) and i can see their pongs.=0A- irc (msn) also wor=
ks fine!=0A- google's pages load correctly!=0Aand for my despair i can acce=
ss <facilcotacao.com>, but can't access <facilcotacao.com/autopecas>!!!!=0A=
please, help me! what the hell is wrong with my firewall?=0Amany thanks in =
advance,=0Aangico.=0A=0Atable filter is:=0A=0AChain INPUT (policy DROP)=0An=
um  target     prot opt source               destination         =0A1    AC=
CEPT     all  --  192.168.0.0/24       boitata.jlm         =0A2    ACCEPT  =
   tcp  --  anywhere             anywhere            state RELATED,ESTABLIS=
HED =0A3    ACCEPT     udp  --  anywhere             anywhere            ud=
p spt:domain =0A4    ACCEPT     udp  --  anywhere             anywhere     =
       udp spt:http state NEW,RELATED,ESTABLISHED =0A5    ACCEPT     icmp -=
-  anywhere             anywhere            icmp echo-reply =0A6    ACCEPT =
    icmp --  anywhere             anywhere            icmp echo-request =0A=
=0A=0AChain FORWARD (policy ACCEPT)=0Anum  target     prot opt source      =
         destination         =0A1    LOG        all  --  anywhere          =
   anywhere            LOG level warning prefix `IPT-FWD: ' =0A2    ACCEPT =
    all  --  anywhere             anywhere            =0A=0AChain OUTPUT (p=
olicy ACCEPT)=0Anum  target     prot opt source               destination  =
       =0A1    LOG        all  --  anywhere             anywhere           =
 LOG level warning prefix `IPT-OUT: ' =0A2    ACCEPT     all  --  boitata.j=
lm          192.168.0.0/24      =0A=0A=0A=0Aand table nat is:=0A=0AChain PR=
EROUTING (policy ACCEPT)=0Anum  target     prot opt source               de=
stination         =0A=0AChain POSTROUTING (policy ACCEPT)=0Anum  target    =
 prot opt source               destination         =0A1    MASQUERADE  all =
 --  anywhere             anywhere            =0A2    MASQUERADE  all  --  =
anywhere             anywhere            =0A=0AChain OUTPUT (policy ACCEPT)=
=0Anum  target     prot opt source               destination         =0A=0A=
=0A=0A=0A=0A =0A___________________________________________________________=
_________________________=0AGet your own web address.  =0AHave a HUGE year =
through Yahoo! Small Business.=0Ahttp://smallbusiness.yahoo.com/domains/?p=
=3DBESTDEAL

