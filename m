From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Are these firewall rules impossible to understand?..........
Date: Fri, 11 Mar 2005 18:46:49 +0100
Message-ID: <4231D989.5030408@lopsch.com>
References: <20050311171253.GA17683@spawar.navy.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20050311171253.GA17683@spawar.navy.mil>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

seberino@spawar.navy.mil schrieb:
> Smart firewallers drop packets based on funky TCP flag settings
> that suggest they are from network sniffers and other nasties.
>=20
> Many of these settings make sense, but, some are so funky I'm not
> sure even reading the RFCs would have explained them.  If anyone
> has any suggestions on how one can understand the wisdom of all
> these rules I really want to know.  (I want to understand
> EVERYTHING in my firewall script.)
>=20
> For example, see these from
> http://www.stearns.org/modwall/sample/tcpchk-sample
>=20
>=20
> /usr/bin/sudo /sbin/iptables -N tcpchk
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --sport 0:19 -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --dport 0:19 -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK -m st=
ate --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK -m st=
ate --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -=
m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -=
m state --state NEW -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL PSH,ACK -=
m state --state RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL NONE -j D=
ROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ALL -j DR=
OP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,FIN SYN,F=
IN -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,RST SYN,R=
ST -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags RST,FIN RST,F=
IN -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,URG SYN,U=
RG -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,PSH -=
j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK,P=
SH -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,FIN FIN -=
j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,PSH PSH -=
j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,URG URG -=
j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST -m st=
ate --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST -m st=
ate --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags SYN,ACK NONE =
-j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m st=
ate --state NEW -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m st=
ate --state RELATED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN -m st=
ate --state ESTABLISHED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -=
m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL SYN,ACK -=
m state --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -=
m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,ACK -=
m state --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -=
m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -=
m state --state NEW -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK -=
m state --state RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,R=
ST -m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,PSH,R=
ST -m state --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,A=
CK -m state --state ESTABLISHED -j RETURN
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,A=
CK -m state --state NEW,RELATED -j DROP
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,P=
SH
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,U=
RG
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL RST,ACK,P=
SH,URG
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL FIN,PSH,A=
CK,URG
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,URG
> /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ALL ACK,URG,F=
IN
> /usr/bin/sudo /sbin/iptables -A INPUT -i ! lo -p tcp -j tcpchk
> /usr/bin/sudo /sbin/iptables -A FORWARD -p tcp -j tcpchk
> /usr/bin/sudo /sbin/iptables -A OUTPUT -p tcp -j tcpchk
>=20
>=20
>=20
> I'm skeptical ANYONE really understands all of these.  The ones that re=
ally bug me are the ones that insist that all FIN, PSH and URG packets
> must have ACK set.  Who would have know that?
>=20
> e.g. /usr/bin/sudo /sbin/iptables -A tcpchk -p tcp --tcp-flags ACK,FIN
> FIN -j DROP
>=20
>=20
> Chris
>=20
>=20
AFAIK in the RFC is not meant how TCP should react e.g. when FIN is sent=20
without ACK. So the reaction is given away to the implementation of the=20
network stack. By sending such packets and analysing the response you=20
can conclude what OS for example is being used because every stack=20
reacts in a different way. And every OS implements it in some different=20
way. So you intercept those packets and drop them. Not allowing TCP to=20
do its work you can block such conclusions. That=B4s the problem of TCP i=
t=20
is described how to tear a connection down with FIN ACK packets but it=20
is not said what to do when a FIN comes without ACK.
Hope someone can confirm what I have written :).

