From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: REJECT doesnt work
Date: Wed, 20 Jun 2007 01:19:37 +0200
Message-ID: <46786489.4070405@plouf.fr.eu.org>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
	<01c501c7b236$54be1530$0b0ffe0a@NS006819>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <01c501c7b236$54be1530$0b0ffe0a@NS006819>
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

Hello,

Rob Sterenborg a =E9crit :
>>I have following line to drop any request that is not from the
>>original computer and it works fine
>>-A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
>>00:11:2F:29:96:84  -j DROP=20

Is this in the 'nat' table ? Filtering in the 'nat' table is not=20
recommended. Use the 'filter' table instead.

>>but now I want to change it to REJECT but it doesnt work and iptables
>>will fail=20
>>
>>-A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
>>00:11:2F:29:96:84  -j REJECT --reject-with=3Dicmp-host-pro hibited
>>
>>what is the problem?

The problem is that the REJECT target intended for filtering and thus is=20
valid only in the 'filter' table. It cannot be used in the 'nat',=20
'mangle' or 'raw' tables.

> # man iptables
>=20
> REJECT
> [...]
> This target is only valid in the INPUT, FORWARD and OUTPUT chains, and
> user-defined chains which are only called from those chains.

This is somehow confusing. It should say that the REJECT target is only=20
valid in the INPUT, FORWARD and OUTPUT chains *of the 'filter' table*.

