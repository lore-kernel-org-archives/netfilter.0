From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to remove TCP options when doing NAT?
Date: Wed, 27 Jun 2007 17:12:59 +0200
Message-ID: <1182957179.4157.14.camel@localhost>
References: <917D8AC5A524D343B28848D8BBFFEC0701B22523@klmail1.kl.imgtec.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <917D8AC5A524D343B28848D8BBFFEC0701B22523@klmail1.kl.imgtec.org>
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

Le mercredi 27 juin 2007 =E0 10:51 +0100, Fabrice Triboix a =E9crit :
> I have noticed that to handle masquerading, linux adds some TCP
> options to the output packets (for a TCP stream, of course).

What kind of options ? I just looked at a NATed (by a Linux box) TCP
stream between 2 linux boxes, and I don't see any additional TCP option.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!


