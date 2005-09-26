From: tedemo <tedemo@free.fr>
Subject: Re: ipset memory usage
Date: Mon, 26 Sep 2005 10:17:24 +0200
Message-ID: <4337AE94.6020503@free.fr>
References: <4336442D.3090404@free.fr>
	<Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.58.0509260852230.11331@blackhole.kfki.hu>
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
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Hello,

Jozsef Kadlecsik a =E9crit :

>Check out the real size of the hashes by searching the kernel log:0
>"rehashing of set <foo> triggered: hashsize grows from <n> to <m>".
>
>Best regards,
>Jozsef
>
The size for the nethash, reported in the log is arround 20mo the first=20
time it I run :
ipset --restore < ip.sets

I deleted each set (using ipset -X on each other) and the recreated them,
the size of the nethash went to 40Mo

A few reloads later its size is 90Mo.

NB: The set definition file has been created manualy to avoid hundred=20
thousand calls to "ipset -A"
(i.e. without calling ipset --save). Can this cause troubles ?

