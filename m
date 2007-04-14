From: Arnd-Hendrik Mathias <arnd-hendrik.mathias@nefkom.net>
Subject: Re: ESTABLISHED makes possible to connect to internal servers
Date: Sat, 14 Apr 2007 16:11:46 +0200
Message-ID: <4620E122.5090708@nefkom.net>
References: <461BCBBE.5060003@mfmdb.com> <461D22A5.90309@mfmdb.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <461D22A5.90309@mfmdb.com>
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

Hi Anton,

>>it is possible to access my internal web server (and not only web
>>server) from outside
>>   =20
>>
sorry, for the silly question: How exactly do you test this and where=20
are your server and your test client running?

>>despite I did not open port 80 in FORWARD chain and policy for FORWARD
>>is DROP.
>>   =20
>>
By the way DROP is your last rule and thus a somewhat "implicit policy".=20
Corresponding to your script your policy is ACCEPT. But that won't=20
affect the behavior you described. Anyway it will be more secure to set=20
your real policies to DROP and as a following of this you can omit the=20
last rules of each chain.

>*filter
>:INPUT ACCEPT [0:0]
>:FORWARD ACCEPT [0:0]
>:OUTPUT ACCEPT [0:0]
>
>-A INPUT -i lo -j ACCEPT
>-A INPUT -i vlan101 -j ACCEPT
>-A INPUT -i vlan82 -j ACCEPT
>
>-A INPUT -p 47 -j ACCEPT
>
>-A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
>
>-A INPUT -p tcp --dport 179 -j ACCEPT
>
>-A INPUT -j DROP
>
>-A FORWARD -i vlan101 -j ACCEPT
>-A FORWARD -i vlan82 -j ACCEPT
>
>-A FORWARD -p 47 -j ACCEPT
>
>-A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
>-A FORWARD -j DROP
>
>COMMIT
> =20
>
Maybe messing around with other protocols like "Border Gateway Protocol"=20
or "General Routing Encapsulation" is unlikely to ease debugging your=20
HTTP connections. So I'd disable these rules temporaryly for debugging=20
purposes.
One other silly question: Do you flush your tables before appending=20
these rules? Sorry for this kind of questions, but we're all humans and=20
sometimes the problems are closer (and easier) than we expect them to be=20
;=C2=B0) At least these information will help to judge your scenario and =
find=20
out the nature of your problem.
Cheers

Arnd-Hendrik

