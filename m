From: mdew <mdew@mdew.dyndns.org>
Subject: RE: opening a port..
Date: 09 Jan 2003 21:24:32 +1300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042100673.487.20.camel@nirvana>
References: <FD8F124A387AD6119F7900A0D218B321019A9D@hslex01.hslbz.local> 
	<1042080082.606.21.camel@nirvana>  <1042088119.810.3.camel@india> 
	<1042092980.487.4.camel@nirvana>  <1042093627.810.17.camel@india> 
	<1042094721.423.15.camel@nirvana>  <1042095224.810.19.camel@india> 
	<1042095879.433.17.camel@nirvana>  <1042099912.810.21.camel@india>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1042099912.810.21.camel@india>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="utf-8"
To: "Dharmendra.T" <dharmu@nsecure.net>
Cc: netfilter <netfilter@lists.netfilter.org>

On Thu, 2003-01-09 at 21:11, Dharmendra.T wrote:
> it was netcat
> >=20
> > apt-get install netcat
> >=20
> >=20
>=20
> try with netcat and let us know.
>=20
> --=20
> Dharmendra.T
> Linux Enthu

mdew:/bin# ls -al netcat
lrwxrwxrwx    1 root     root            2 Jan  9 19:34 netcat -> nc

mdew:~# netcat -help
[v1.10]
connect to somewhere:   nc [-options] hostname port[s] [ports] ...
listen for inbound:     nc -l -p port [-options] [hostname] [port]
options:
        -e prog                 program to exec after connect
[dangerous!!]
        -b                      allow broadcasts
        -g gateway              source-routing hop point[s], up to 8
        -G num                  source-routing pointer: 4, 8, 12, ...
        -h                      this cruft
        -i secs                 delay interval for lines sent, ports
scanned
        -l                      listen mode, for inbound connects
        -n                      numeric-only IP addresses, no DNS
        -o file                 hex dump of traffic
        -p port                 local port number
        -r                      randomize local and remote ports
        -q secs                 quit after EOF on stdin and delay of
secs
        -s addr                 local source address
        -t                      answer TELNET negotiation
        -u                      UDP mode
        -v                      verbose [use twice to be more verbose]
        -w secs                 timeout for connects and final net reads
        -z                      zero-I/O mode [used for scanning]
port numbers can be individual or ranges: lo-hi [inclusive]
mdew:~# netcat -p 4662
no destination
mdew:~# nc -l -p 4662
=C3=A3;=C3=A3=C3=9B=C3=BB=C3=87=C3=8E=C2=A8=C2=BAU=C3=BB=C3=97J=C3=BCG=C3=
=A2=C2=B0=C3=B8dfg<=C3=B8=C3=81o=C3=86mdew:~# netcat
Cmd line:
mdew:~# netcat -l -p 4662
=C3=A3;=C3=A3=C3=9B=C3=BB=C3=87=C3=8E=C2=A8=C2=BAU=C3=BB=C3=97J=C3=BCG=C3=
=A2=C2=B0=C3=B8dfg<=C3=B8=C3=81o=C3=86mdew:~# netcat -l -p 4662
=C3=A3P<H=C2=B9og=C3=9DT'=E2=90=89=C2=B4\=C2=BE=C3=A46=E2=96=92http://emule=
-project.net<6=C3=81o=C3=86mdew:~#



