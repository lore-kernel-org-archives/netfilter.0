From: Guillaume <silencer@free-4ever.net>
Subject: Re: DNAT doesn't work
Date: Tue, 26 Sep 2006 17:19:35 +0200
Message-ID: <45194507.10301@free-4ever.net>
References: <c936c6b70609260745r40491602uba2aef2c6ae9be34@mail.gmail.com>	
	<4519406E.4040902@free-4ever.net>
	<c936c6b70609260813g6389cb2br52ff21d7eb628bb2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c936c6b70609260813g6389cb2br52ff21d7eb628bb2@mail.gmail.com>
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

Holger Kinkelin a =E9crit :
> Hi Guillaume
>=20
> Thanx for your reply
>=20
>> The first thing I'm thinking about is that you need a corresponding ru=
le
>> in the "filter" table !
>>
>> In this example, you should had a rule:
>> iptables -A INPUT -p tcp --dport 80 -d 127.0.0.1 -j ACCEPT
>>
>> Of course, it's needed only if you set the default policy to "DROP" in
>> all chains of table "filter".
> hmmmm, ... no, the default policy is set to "ACCEPT"... Otherwise, I
> think, I coundn't open http://localhost in my webbrowser, too -- Or am
> I wrong?
>=20
> Regards,
> Holger

hhhmmm...
It sounds you are right !

Don't know what to tell you at the moment....

Please post on the list more details like the network setup, and so on...


--=20
Guillaume
E-mail: silencer_<at>_free-4ever_<dot>_net
Blog: http://guillaume.free-4ever.net
----
Site: http://www.free-4ever.net

