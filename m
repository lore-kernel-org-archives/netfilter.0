From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Blocking SMTP Worm
Date: Thu, 26 Oct 2006 11:27:50 +0200
Message-ID: <45407F96.8090000@freemail.hu>
References: <19fb1ac90610240653x69cc1951g9766d7c809ddecef@mail.gmail.com>	<19fb1ac90610240654x44bdd20em7e04b21469739a10@mail.gmail.com>	<453E1D84.6080803@freemail.hu>	<19fb1ac90610240719p75fc3580mc45c621cfb616502@mail.gmail.com>	<9e12c5a529145622a46a6cbe5fc05e4b@former03.de>
	<19fb1ac90610241253u1bc73507u42f133845f60e3cc@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <19fb1ac90610241253u1bc73507u42f133845f60e3cc@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Juan_Carlos_Pel=E1ez_Mendoza?= <jcpelaez@gmail.com>
Cc: netfilter@lists.netfilter.org

Juan Carlos Pel=E1ez Mendoza =EDrta:
> Baltasar,
>
> I think what you say is right, the traffic that the tcpdump shows is
> before applying the filters and rules, The IP that I mentioned it's
> now blocked, but another IP's are beggining to send traffic through
> the interface,
>
> how can I do to stop the traffic to my LAN but not to my linux box,
> because this is my Mail Server and is the only one that I want to send
> traffic at this port???
>

iptables -A FORWARD -j DROP -p tcp --dport 25

This will drop every smtp traffic that goes through your box!
Remember: This is the FORWARD chain!

It is not the nicest solution... :)

Take a look on my script ! :)

https://lists.netfilter.org/pipermail/netfilter/2006-August/066404.html

Swifty
> 14:51:55.442934 IP 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp >
> 192.168.0.163.4115: P 168:192(24) ack 168 win 17353
> 14:51:55.443055 IP 192.168.0.163.4115 >
> 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: . ack 192 win 65344
> 14:51:55.659325 IP 192.168.0.163.4115 >
> 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: P 168:190(22) ack
> 192 win 65344
> 14:51:56.554482 IP 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp >
> 192.168.0.163.4115: P 192:210(18) ack 190 win 17331
> 14:51:56.665159 IP 192.168.0.163.4115 >
> 61-64-104-223-adsl-tai.STATIC.so-net.net.tw.smtp: . ack 210 win 65326
>
>
> Thanks,
>
>
> Juan Carlos  Pel=E1ez Mendoza
>



