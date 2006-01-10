From: "Mac!eKs" <macieks@freesco.pl>
Subject: Re: Where is CONNMARK extension kernel 2.4.32?
Date: Tue, 10 Jan 2006 19:43:07 +0100
Message-ID: <43C4003B.9080400@freesco.pl>
References: <43C0F61F.4030400@arcoscom.com> <43C2A451.1020509@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43C2A451.1020509@arcoscom.com>
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
Content-Type: text/plain; charset="utf-8"; format="flowed"
Cc: netfilter@lists.netfilter.org

Samuel D=C3=ADaz Garc=C3=ADa napisa=C5=82(a):
>> Hi all.
>>
>> I have troubles with CONNMARK extensions into kernel 2.4.32.
>>
>> The problem I have is that I tried to patch a 2.4.32 kernel with=20
>> pom-ng and I cant see CONNMARK extension into the pom-ng options and=20
>> isn't in kernel config.
>>
>> Perhaps could be that any patch I applied before (IMQ, Layer7filter,=20
>> etc...) had broken it. I had compiled kernel, iptables (1.3.4) and=20
>> many pom-ng patches. And when I test some scripts that uses CONNMARK=20
>> without success (chain/tarjet error).
>> I can view /usr/local/usr/libipt_CONNMARK.so and I suppose that is the=
=20
>> reason why I can view "iptables -j CONNMARK --help" help text, but I=20
>> can't see any "/lib/modules/2.4.32/....." *CONNMARK* module and isn't =

>> compiled into the kernel (cat /usr/src/linux/.config | grep=20
>> "CONNMARK") doesn't show me anythink.
>>
>> Can anybody help me please?
>>
>> Thanks
>>

which pom-ng snapshot are you using?
The last pom-ng snapshot with CONNMARK/TTL/string is from 20050918.
Then these patches were removed, because they are now in 2.6 kernel=20
serie. But not in 2.4 :/

--=20
Mac!eKs


