From: "Michael Frank" <mhf@linuxmail.org>
Subject: Re: Possible to block ports by user group?
Date: Mon, 05 Jul 2004 12:29:23 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsande9km4evsfm@smtp.pacific.net.th>
References: <opsal65hoe4evsfm@smtp.pacific.net.th> <1088953144.11637.57.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088953144.11637.57.camel@anduril.intranet.cartel-securite.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; delsp="yes"; charset="iso-8859-1"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org

On Sun, 04 Jul 2004 16:59:04 +0200, Cedric Blancher <blancher@cartel-secu=
rite.fr> wrote:

> Le dim 04/07/2004 =E0 15:16, Michael Frank a =E9crit :
>> Would like to block ports depending on the group in use
>
> See owner match :
>
> cbr@anduril:~$ iptables -m owner --help
> iptables v1.2.11
> [...]
> OWNER match v1.2.11 options:
> [!] --uid-owner userid     Match local uid
> [!] --gid-owner groupid    Match local gid
> [!] --pid-owner processid  Match local pid
> [!] --sid-owner sessionid  Match local sid
> [!] --cmd-owner name       Match local command name
>
> --gid-owner seems to satisfy your needs.
>
>

Thank you for the pointer. This works very well.

I think there is a problem though wrt ICMP requests. The following
rule allows _everyone_ to ping, but I would expect only root to be able t=
o.

ACCEPT     all  --  anywhere             anywhere           OWNER UID mat=
ch root

This rule has no effect on ICMP i am mhf and can't ping.

ACCEPT     all  --  anywhere             anywhere           OWNER UID mat=
ch mhf

This is with Vanilla kernel 2.4.24. Any know issue here?

No big deal, - I should try a later kernel soon.

Here is the whole list.

Chain INPUT (policy DROP)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/NONE
LOG        icmp --  anywhere             anywhere           icmp echo-req=
uest limit: avg 1/sec burst 5 LOG level warning prefix `ipt - Ping of Dea=
th Blocked: '
DROP       icmp --  anywhere             anywhere           icmp echo-req=
uest limit: avg 1/sec burst 5
syn-flood  tcp  --  anywhere             anywhere           tcp flags:SYN=
,RST,ACK/SYN
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/FIN,PSH,URG
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp flags:SYN=
,RST/SYN,RST
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN/FIN,SYN
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere
ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED

Chain FORWARD (policy DROP)
target     prot opt source               destination
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/FIN,SYN,RST,PSH,ACK,URG
DROP       tcp  --  anywhere             anywhere           tcp flags:FIN=
,SYN,RST,PSH,ACK,URG/NONE
LOG        icmp --  anywhere             anywhere           icmp echo-req=
uest limit: avg 1/sec burst 5 LOG level warning prefix `ipt - Ping of Dea=
th Blocked: '
DROP       icmp --  anywhere             anywhere           icmp echo-req=
uest limit: avg 1/sec burst 5
syn-flood  tcp  --  anywhere             anywhere           tcp flags:SYN=
,RST,ACK/SYN
ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED
LOG        all  --  anywhere             anywhere           limit: avg 10=
/min burst 10 LOG level alert prefix `ipt - FORWARD dropped: '

Chain OUTPUT (policy DROP)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere           OWNER UID mat=
ch root
ACCEPT     all  --  anywhere             anywhere           OWNER UID mat=
ch mhf
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:domai=
n OWNER GID match guest
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:smtp =
OWNER GID match guest
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:pop3 =
OWNER GID match guest
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:ftp O=
WNER GID match guest
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:http =
OWNER GID match guest
ACCEPT     tcp  --  anywhere             anywhere           tcp dpt:8118 =
OWNER GID match guest
ACCEPT     udp  --  anywhere             anywhere           udp dpt:domai=
n OWNER GID match guest
ACCEPT     all  --  anywhere             anywhere           state RELATED=
,ESTABLISHED
LOG        all  --  anywhere             anywhere           limit: avg 10=
/min burst 10 LOG level alert prefix `ipt - OUTPUT dropped: '

Chain syn-flood (2 references)
target     prot opt source               destination
RETURN     all  --  anywhere             anywhere           limit: avg 1/=
sec burst 4
LOG        all  --  anywhere             anywhere           LOG level war=
ning prefix `ipt - Blocked SYN Flood: '
DROP       all  --  anywhere             anywhere


Any comments?

	Regards
	Michael

