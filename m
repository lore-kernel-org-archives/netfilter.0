From: Jiann-Ming Su <sujiannming@gmail.com>
Subject: Re: Allowing access only some sites - onely some mac address
Date: Tue, 30 Aug 2005 09:49:42 -0400
Message-ID: <561dc326050830064921a9e6f0@mail.gmail.com>
References: <006801c5acd1$b2ce1600$0301010a@pivt>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <006801c5acd1$b2ce1600$0301010a@pivt>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On 8/29/05, Sebasti=E3o Ant=F4nio Campos (GWA) <sa.campos@datasulsp.com.br>=
=20
wrote:
>=20
> Dears,
>=20
> I'd like to allow access only to some sites by some mac address.
>=20
> For example:
>=20
> I have a list of the mac address 00:0c:6E:11:E8:B0, 00:D8:02:D8:C8:DF,
> 00:E7:05:C9:07:EA............ and and I'd like that only these mac addres=
s
> could access only the following IP: 200.221.2.128 <http://200.221.2.128>,=
=20
> 200.221.2.129 <http://200.221.2.129>,
> 200.221.2.130 <http://200.221.2.130>, 200.221.2.131 <http://200.221.2.131=
>,=20
> 200.205.144.75 <http://200.205.144.75>, 200.205.144.76<http://200.205.144=
.76>.=20
> But the other
> mac address could access everything.



IIRC, MAC addresses (layer 2) do not go beyond the router (layer 3). I thin=
k=20
you can only do what you are proposing if all your boxes are behind the sam=
e=20
broadcast domain.

--=20
Jiann-Ming Su
"I have to decide between two equally frightening options.=20
If I wanted to do that, I'd vote." --Duckman
