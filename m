From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Configuration question for my first iptables setup
Date: Wed, 04 Jul 2007 13:04:42 +0200
Message-ID: <468B7ECA.3060800@freemail.hu>
References: <831957.88102.qm@web54203.mail.re2.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <831957.88102.qm@web54203.mail.re2.yahoo.com>
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
To: Reid <reid_sf@yahoo.com>
Cc: netfilter@lists.netfilter.org

Reid =EDrta:
> I am brand new to iptables, and I want to setup a basic firewall for a =
dedicated web server. I'm
> accessing the server remotely, and already locked myself out once.
>
> I've come up with the configuration below, but feel like I don't know w=
hat I'm doing.  Does the
> following look reasonable? Am I overlooking anything major? Thank you f=
or input.
>
>  =20
Nope.. This is NOT reasonable...
You have set the first rule in your INPUT chain to ACCEPT everything=20
from anywhere... :D
The following rules will never get hit !!!

Try the "iptables -vnL" command to see it !!!

The last rule is also "useless" because your DEFAULT POLICY is DROP.

In the other hand without those two rules it seems ok... (Depending on=20
what you want to achieve...) :D

Just to guide you:
1. I would enable the lo interface to ACCEPT everything...
2. Accept anything that ESTABLISHED or RELATED
3. I would group up the rules depending on the protocol...

Swifty
>  =20
>> iptables -L
>>    =20
> Chain INPUT (policy DROP)
> target     prot opt source               destination        =20
> ACCEPT     all  --  anywhere             anywhere           =20
> ACCEPT     tcp  --  anywhere             anywhere            tcp flags:=
ACK/ACK=20
> ACCEPT     all  --  anywhere             anywhere            state ESTA=
BLISHED=20
> ACCEPT     all  --  anywhere             anywhere            state RELA=
TED=20
> ACCEPT     udp  --  anywhere             anywhere            udp spt:do=
main dpts:1024:65535=20
> ACCEPT     icmp --  anywhere             anywhere            icmp echo-=
reply=20
> ACCEPT     icmp --  anywhere             anywhere            icmp desti=
nation-unreachable=20
> ACCEPT     icmp --  anywhere             anywhere            icmp sourc=
e-quench=20
> ACCEPT     icmp --  anywhere             anywhere            icmp time-=
exceeded=20
> ACCEPT     icmp --  anywhere             anywhere            icmp param=
eter-problem=20
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ww=
w=20
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ht=
tps=20
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ss=
h=20
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:au=
th=20
> ACCEPT     icmp --  anywhere             anywhere            icmp echo-=
request=20
> ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:10=
000=20
> DROP       tcp  --  anywhere             anywhere            tcp dpts:2=
049:2050=20
> DROP       tcp  --  anywhere             anywhere            tcp dpts:x=
11:6063=20
> DROP       tcp  --  anywhere             anywhere            tcp dpts:a=
fs3-fileserver:7010=20
> DROP       all  --  anywhere             anywhere           =20
>
> Chain FORWARD (policy ACCEPT)
> target     prot opt source               destination        =20
>
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
>  =20
> =20
>
>
>       _________________________________________________________________=
___________________
> Shape Yahoo! in your own image.  Join our Network Research Panel today!=
   http://surveylink.yahoo.com/gmrs/yahoo_panel_invite.asp?a=3D7=20
>
>
>
>
>  =20



