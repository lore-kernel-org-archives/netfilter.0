From: Sp0oKeR <spooker@gmail.com>
Subject: Re: Allowing access only some sites - onely some mac address
Date: Mon, 29 Aug 2005 16:49:24 -0300
Message-ID: <9255886c05082912495b3eff85@mail.gmail.com>
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
To: =?ISO-8859-1?Q?Sebasti=E3o_Ant=F4nio_Campos_=28GWA=29?= <sa.campos@datasulsp.com.br>
Cc: netfilter@lists.netfilter.org

I think ipset is a good idea.

# ipmap
The ipmap set type uses a memory range, where each bit represents one
IP address and can store up to 65535 (B-class network) entries. You
can store same size network addresses in an ipset as well and an IP
address will be in the set if the network address it belongs to can be
found in the set.
# macipmap
The macipmap set type uses a memory range, where each 8 bytes
represents one IP and a MAC addresses. A macipmap set type can store
up to 65535 (B-class network) IP addresses with MAC.

Look http://ipsec.netfilter.org

Att,

Sp0oKeR

On 8/29/05, Sebasti=E3o Ant=F4nio Campos (GWA) <sa.campos@datasulsp.com.br>=
 wrote:
> Dears,
>=20
> I'd like to allow access only to some sites by some mac address.
>=20
> For example:
>=20
> I have a list of the mac address 00:0c:6E:11:E8:B0, 00:D8:02:D8:C8:DF,
> 00:E7:05:C9:07:EA............ and and I'd like that only these mac addres=
s
> could access only the following IP: 200.221.2.128, 200.221.2.129,
> 200.221.2.130, 200.221.2.131, 200.205.144.75, 200.205.144.76. But the oth=
er
> mac address could access everything.
>=20
> How is the better way to do this??
>=20
> Thks
>=20
>=20
>=20
>

