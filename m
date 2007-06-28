From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: How to remove TCP options when doing NAT?
Date: Thu, 28 Jun 2007 13:32:28 +0200
Message-ID: <1183030348.8967.41.camel@localhost>
References: <917D8AC5A524D343B28848D8BBFFEC0701B226A4@klmail1.kl.imgtec.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <917D8AC5A524D343B28848D8BBFFEC0701B226A4@klmail1.kl.imgtec.org>
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
To: Fabrice Triboix <Fabrice.Triboix@imgtec.com>
Cc: netfilter@lists.netfilter.org

Le jeudi 28 juin 2007 =E0 12:00 +0100, Fabrice Triboix a =E9crit :
> From ethereal, I can see 20 bytes of options added on each TCP packets.
> These are TCP options that are added after the standard TCP header of 2=
0
> bytes, thus the total TCP header size is 40 bytes.
> These 20 bytes of options are (dixit ethereal):
>  - Maximum segment size: 1460 bytes (I can understand that: 1500 - 40)
>  - SACK permitted
>  - Timestamps: TSval 360225, TSecr 0
>  - NOP
>  - Window scale: 0 (multiply by 1)

What were the options that were not present _before_ the gateway ?

> Anyone knows how I can configure Linux not to do that?

I don't know of any mangling extension for TCP options, like
IPV4OPTSSTRIP for IP options.



PS: pls keep the list Cced...

--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!


