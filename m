From: mdew <mdew@mdew.dyndns.org>
Subject: Re: opening a port..
Date: 09 Jan 2003 21:36:02 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042101363.433.31.camel@nirvana>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local>
	<1042080082.606.21.camel@nirvana>  <1042088119.810.3.camel@india>
	<1042092980.487.4.camel@nirvana>  <1042093627.810.17.camel@india>
	<1042094721.423.15.camel@nirvana>  <1042095224.810.19.camel@india>
	<1042095879.433.17.camel@nirvana>  <3E1D2D11.50302@boh.de>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="=-lxw5Eypa1cxrr3WW7BI8"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3E1D2D11.50302@boh.de>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: =?ISO-8859-1?Q?J=F6rg?= Esser <jackfritt@boh.de>
Cc: netfilter <netfilter@lists.netfilter.org>


--=-lxw5Eypa1cxrr3WW7BI8
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2003-01-09 at 21:04, J=C3=B6rg Esser wrote:
>=20
>=20
> mdew wrote:
>=20
> >On Thu, 2003-01-09 at 19:53, Dharmendra.T wrote:
> > =20
> >
> >>>># nc -l -p 4662
> >>>>
> >>>>And then run nmap. You should get listed this port!
> >>>>
> >>>>--=20
> >>>>Dharmendra.T
> >>>>Linux Enthu
> >>>>       =20
> >>>>
> >>>mdew:~# nc -l -p 4662
> >>>=C3=A3P<H=C2=B9og=C3=9DT'b=C2=B4\Y6=E2=96=92http://emule-project.net<6=
=C3=91~=C3=96Emdew:~#
> >>>
> >>>(some strange characters, then it quits)
> >>>
> >>>mdew:~# netstat -an|grep 4662
> >>>mdew:~#
> >>>
> >>>nirvana:/home/mdew# nmap 10.0.0.6
> >>>     =20
> >>>
> nmap -p4662 10.0.0.6

hmm
with all the changes it still cant see it

nirvana:/home/mdew# nmap -p4662 10.0.0.6

Starting nmap V. 3.10ALPHA4 ( www.insecure.org/nmap/ )
The 1 scanned port on debian (10.0.0.6) is: closed

Nmap run completed -- 1 IP address (1 host up) scanned in 0.319 seconds


> Should work better.
> and a new version of nmap should work better, too.
> I heard that when you use nmap as your way it picks just well known=20
> ports (/etc/service file ?) and then you won=C2=B4t get this special port=
 if=20
> its not in there.(Maybe I=C2=B4m wrong)
>=20
> >>>Starting nmap V. 3.10ALPHA4 ( www.insecure.org/nmap/ )
> >>>Interesting ports on debian (10.0.0.6):
> >>>(The 1591 ports scanned but not shown below are in state: closed)
> >>>Port       State       Service
> >>>22/tcp     open        ssh
> >>>25/tcp     open        smtp
> >>>110/tcp    open        pop-3
> >>>111/tcp    filtered    sunrpc
> >>>113/tcp    open        auth
> >>>135/tcp    filtered    loc-srv
> >>>136/tcp    filtered    profile
> >>>137/tcp    filtered    netbios-ns
> >>>138/tcp    filtered    netbios-dgm
> >>>139/tcp    filtered    netbios-ssn
> >>>199/tcp    filtered    smux
> >>>826/tcp    filtered    unknown
> >>>953/tcp    filtered    rndc
> >>>8080/tcp   open        http-proxy
> >>>
> >>>
> >>>
> >>>
> >>>     =20
> >>>
> >>nc, I mean to say netcat.?
> >>   =20
> >>
> >
> >it was netcat
> >
> >apt-get install netcat
> >
> >
> >
> >
> > =20
> >
>=20
>=20
>=20


--=-lxw5Eypa1cxrr3WW7BI8
Content-Disposition: attachment; filename=iptable_list.txt
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; name=iptable_list.txt; charset=ANSI_X3.4-1968

Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3
ACCEPT     udp  --  anywhere             anywhere           udp dpt:pop3
ACCEPT     udp  --  anywhere             anywhere           udp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ssmtp
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:domain
ACCEPT     udp  --  anywhere             anywhere           udp dpt:domain
ACCEPT     udp  --  anywhere             anywhere           udp dpt:domain
ACCEPT     udp  --  anywhere             anywhere           udp spt:domain
ACCEPT     udp  --  anywhere             anywhere           udp spt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4661
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4661
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4661
ACCEPT     udp  --  anywhere             anywhere           udp spt:4661
ACCEPT     udp  --  anywhere             anywhere           udp spt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4662
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4662
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4662
ACCEPT     udp  --  anywhere             anywhere           udp spt:4662
ACCEPT     udp  --  anywhere             anywhere           udp spt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4665
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4665
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4665
ACCEPT     udp  --  anywhere             anywhere           udp spt:4665
ACCEPT     udp  --  anywhere             anywhere           udp spt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4665
REJECT     tcp  --  anywhere             anywhere           tcp dpt:111 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:smux re=
ject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:826 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:953 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:111 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:smux re=
ject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:826 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:953 rej=
ect-with icmp-port-unreachable

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
REJECT     tcp  --  anywhere             anywhere           tcp dpts:netbio=
s-ns:netbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:netbio=
s-ns:netbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:netbio=
s-ns:netbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:netbio=
s-ns:netbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:auth
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domain
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:domain
ACCEPT     tcp  --  paul.                anywhere           tcp dpt:4665 li=
mit: avg 1/hour burst 5
ACCEPT     udp  --  paul.                anywhere           udp dpt:4665 li=
mit: avg 1/hour burst 5
ACCEPT     udp  --  paul.                anywhere           udp spt:4665 li=
mit: avg 1/hour burst 5
ACCEPT     tcp  --  paul.                anywhere           tcp spt:4665 li=
mit: avg 1/hour burst 5
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4661
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4661
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4661
ACCEPT     udp  --  anywhere             anywhere           udp spt:4661
ACCEPT     udp  --  anywhere             anywhere           udp spt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4661
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4662
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4662
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4662
ACCEPT     udp  --  anywhere             anywhere           udp spt:4662
ACCEPT     udp  --  anywhere             anywhere           udp spt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4662
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:4665
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4665
ACCEPT     udp  --  anywhere             anywhere           udp dpt:4665
ACCEPT     udp  --  anywhere             anywhere           udp spt:4665
ACCEPT     udp  --  anywhere             anywhere           udp spt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4665
ACCEPT     tcp  --  anywhere             anywhere           tcp spt:4665
REJECT     tcp  --  anywhere             anywhere           tcp dpt:111 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:smux re=
ject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:826 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:953 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:111 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:smux re=
ject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:826 rej=
ect-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpt:953 rej=
ect-with icmp-port-unreachable
ACCEPT     tcp  --  anywhere             10.0.0.6           tcp dpt:4662
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp dpts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     tcp  --  anywhere             anywhere           tcp spts:135:ne=
tbios-ssn reject-with icmp-port-unreachable
REJECT     udp  --  anywhere             anywhere           udp spts:135:ne=
tbios-ssn reject-w
--=-lxw5Eypa1cxrr3WW7BI8--


