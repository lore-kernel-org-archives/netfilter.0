From: Richard <netfilter@ghz.fr>
Subject: Re: IPtables settings to access a backup FTP
Date: Sat, 18 Aug 2007 22:25:18 +0200
Message-ID: <46C755AE.4030804@ghz.fr>
References: <46C743CB.801@ghz.fr> <46C7539C.60002@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <46C7539C.60002@rtij.nl>
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
To: Martijn Lievaart <m@rtij.nl>, netfilter@lists.netfilter.org

Hi I've got ip_conntrack running,

My server hosts FTP accounts and I also need outgoing ftp ...

No problems accessing the ftp hosted on this server, but can't do a CWD=20
(ls) from this server to another external ftp server unless the firewall=20
is disactivated.

I guess you are going to say most of my settings are useless but here=20
goes my current settings :


-------------------------

Chain INPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state=20
RELATED,ESTAB=20
                   LISHED
ACCEPT     tcp  --  anywhere             anywhere            tcp=20
dpt:ftp-data
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
LOG_ACCEPT  tcp  --  anywhere             anywhere            tcp dpt:202=
2
LOG_ACCEPT  tcp  --  anywhere             anywhere            tcp dpt:smt=
p
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:whoi=
s
ACCEPT     udp  --  anywhere             anywhere            udp dpt:doma=
in
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:www
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap=
2
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:http=
s
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ntp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:8443
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:8880
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:4263=
0
ACCEPT     udp  --  anywhere             anywhere            udp dpt:4263=
0
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap=
s
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:mysq=
l
ACCEPT     all  --  localhost.localdomain  anywhere
icmp_packets  icmp --  anywhere             anywhere
LOG_DROP   all  --  anywhere             anywhere

Chain FORWARD (policy DROP)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp=20
flags:S=20
             YN,RST,ACK/SYN

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state=20
RELATED,ESTAB=20
                   LISHED
ACCEPT     tcp  --  anywhere             anywhere            tcp=20
dpt:ftp-data
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ftp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:2022
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:teln=
et
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:whoi=
s
ACCEPT     udp  --  anywhere             anywhere            udp dpt:doma=
in
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:www
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:pop3
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap=
2
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:http=
s
ACCEPT     udp  --  anywhere             anywhere            udp dpt:ntp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap=
s
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:mysq=
l
ACCEPT     all  --  anywhere             localhost.localdomain
icmp_packets  icmp --  anywhere             anywhere
LOG_DROP   all  --  anywhere             anywhere

Chain LOG_ACCEPT (2 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            LOG level=20
warning t=20
               cp-options ip-options prefix `[IPTABLES ACCEPT] : '
ACCEPT     all  --  anywhere             anywhere

Chain LOG_DROP (2 references)
target     prot opt source               destination
LOG        all  --  anywhere             anywhere            LOG level=20
warning t=20
               cp-options ip-options prefix `[IPTABLES DROP] : '
DROP       all  --  anywhere             anywhere

Chain icmp_packets (2 references)
target     prot opt source               destination
ACCEPT     icmp --  anywhere             anywhere            limit: avg=20
1/sec bu=20
              rst 1
LOG        icmp --  anywhere             anywhere            limit: avg=20
1/sec bu=20
              rst 1 LOG level warning prefix `PING-DROP: '

--------------

Thanks for any suggestions !


Richard



Martijn Lievaart a =E9crit :
> Richard wrote:
>> Hello, this is my first message so I hope I'm doing this right ! :)
>>
>> I've got iptables setup and running well on my server and up to now=20
>> I've not had any problems, however I have just installed a backup=20
>> system which needs to connect by FTP to a distant server.
>>
>> With my firewall disactivated all works fine, however with the=20
>> firewall activated when I use the "ls" command of the debian ftp=20
>> command line package (CWD) I get:
>>
>> 200 ok then a long wait then :
>> 421 Service not available, remote server has closed connection.
>>
>> I've tried this on two different FTP's and it only works if the=20
>> firewall is disactivated.
>>
>> One server is a plesk server but the server I need to connect to I do=20
>> not know much about, with filezilla on my pc I've managed to connect=20
>> to it with both FTP active and FTP passive so I guess it can do both.
>>
>> On my server I just do :
>>
>> ftp ftp.server.com
>> username
>> password
>>
>> So I'm not sure if it connects as passive or active.
>>
>> These are the ports that I have got open :
>>
>> -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>> -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>>
>> -A INPUT -p tcp -m tcp --dport 20 -j ACCEPT
>=20
> You don't need this (see below), but it is wrong anyhow. Active ftp use=
s=20
> SOURCE port 20, not destination port 20. Most guides on the inuhnet=20
> thingie get this wrong.
>=20
>> -A INPUT -p tcp -m tcp --dport 21 -j ACCEPT
>=20
> Do you also want to accept FTP connections? You don't need this to make=
=20
> outgoing connections.
>=20
>>
>> -A OUTPUT -p tcp -m tcp --dport 20 -j ACCEPT
>=20
> This is nonsense.
>=20
>> -A OUTPUT -p tcp -m tcp --dport 21 -j ACCEPT
>=20
> This is the only rule you need to make outgoing FTP connections.
>=20
>>
>> Which ports do you suggest I should open to connect to this FTP server=
 ?
>>
>=20
> It's not only about static ports. FTP uses dynamic ports as well that=20
> must be tracked by a helper. Modprobe nf_contrack_ftp (ip_contrack_ftp=20
> on older kernels) and all should be well.
>=20
> HTH,
> M4
>=20

