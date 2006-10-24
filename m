From: "=?ISO-8859-1?Q?Juan_Carlos_Pel=E1ez_Mendoza?=" <jcpelaez@gmail.com>
Subject: Re: Blocking SMTP Worm
Date: Tue, 24 Oct 2006 14:53:36 -0500
Message-ID: <19fb1ac90610241253u1bc73507u42f133845f60e3cc@mail.gmail.com>
References: <19fb1ac90610240653x69cc1951g9766d7c809ddecef@mail.gmail.com>
	<19fb1ac90610240654x44bdd20em7e04b21469739a10@mail.gmail.com>
	<453E1D84.6080803@freemail.hu>
	<19fb1ac90610240719p75fc3580mc45c621cfb616502@mail.gmail.com>
	<9e12c5a529145622a46a6cbe5fc05e4b@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9e12c5a529145622a46a6cbe5fc05e4b@former03.de>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: former03 | Baltasar Cevc <baltasar.cevc@former03.de>
Cc: netfilter@lists.netfilter.org

Baltasar,

I think what you say is right, the traffic that the tcpdump shows is
before applying the filters and rules, The IP that I mentioned it's
now blocked, but another IP's are beggining to send traffic through
the interface,

how can I do to stop the traffic to my LAN but not to my linux box,
because this is my Mail Server and is the only one that I want to send
traffic at this port???

14:51:55.442934 IP 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp >
192.168.0.163.4115: P 168:192(24) ack 168 win 17353
14:51:55.443055 IP 192.168.0.163.4115 >
61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: . ack 192 win 65344
14:51:55.659325 IP 192.168.0.163.4115 >
61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: P 168:190(22) ack
192 win 65344
14:51:56.554482 IP 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp >
192.168.0.163.4115: P 192:210(18) ack 190 win 17331
14:51:56.665159 IP 192.168.0.163.4115 >
61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: . ack 210 win 65326


Thanks,


Juan Carlos  Pel=E1ez Mendoza

On 10/24/06, former03 | Baltasar Cevc <baltasar.cevc@former03.de> wrote:
> Hi Juan,
>
> On 24.10.2006, at 16:19, Juan Carlos Pel=E1ez Mendoza wrote:
> > Chain FORWARD (policy ACCEPT 59M packets, 20G bytes)
> > pkts bytes target     prot opt in     out     source
> > destination
> > 18236  876K DROP       tcp  --  *      *       192.168.0.92
> > 0.0.0.0/0           tcp dpt:25
> > 3317K 2826M ACCEPT     all  --  eth1   *       0.0.0.0/0
> > 0.0.0.0/0
> >
> > Chain INPUT (policy ACCEPT 6671K packets, 733M bytes)
> > pkts bytes target     prot opt in     out     source
> > destination
> > 3084  207K DROP       all  --  *      *       192.168.0.92
> > 0.0.0.0/0
> >
> > Does this mean that my rule is working?? because the traffic still
> > passing through the both NIC's.
> Well, it does mean that these rules are acive and x pakets/bytes (the
> two first figures on ach) lines have mached, thus have been
> dropped/accepted. I think tcpdump shows the traffic before filtering is
> done, but I'm not sure.
>
> Baltasar
>
> Baltasar Cevc
>
> _____ former 03 gmbh
> _____ infanteriestra=DFe 19 haus 6 eg
> _____ D-80797 muenchen
>
> _____ http://www.former03.de
>
>


--=20
________________________________________________
"Hope has died in me."

