From: "curby ." <curby.public@gmail.com>
Subject: Re: rc.local
Date: Wed, 27 Jul 2005 10:42:46 -0600
Message-ID: <5d2f37910507270942577f9173@mail.gmail.com>
References: <42e607e9.6446401e.6174.46a7SMTPIN_ADDED@mx.gmail.com>
	<9927912d0507260430275d8239@mail.gmail.com>
	<5d2f379105072608385caaee15@mail.gmail.com>
	<9927912d050726221615fe208f@mail.gmail.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9927912d050726221615fe208f@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: Visham Ramsurrun <vishamr2000@gmail.com>
Cc: Netfilter User Mailing List <netfilter@lists.netfilter.org>

On 7/26/05, Visham Ramsurrun <vishamr2000@gmail.com> wrote:
> you are right..i'm having a scripting problem..i don't know how to
> make a script execute every time a packet is sent by my PC. how can i
> do that?

You don't want to execute a script for each packet... you could be
easily DoSed. Try:

http://netfilter.org/patch-o-matic/pom-base.html#pom-base-nth

Please reply to the list, so everyone can help and learn. =3D)

