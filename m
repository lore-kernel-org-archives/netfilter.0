From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: security question
Date: Thu, 3 Jun 2004 16:12:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406031612.36846.Antony@Soft-Solutions.co.uk>
References: <40BF3E60.2060206@efn.uncor.edu>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40BF3E60.2060206@efn.uncor.edu>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Thursday 03 June 2004 4:06 pm, Mart=EDn Chikilian wrote:

> a.westendoerpf@gmx.de wrote:
> >
> > My goal is to drop everything coming from the wlan by default. I do
> > this with:
> >
> > # iptables -t nat -P PREROUTING  DROP

That is a terrible thing to do - it will drop all sorts of packets you do=
n't=20
want dropped.   Do not filter packets in the nat tables - filter them in =
the=20
filter tables.

I know it may look innocuous enough, but don't do it - it will mess up yo=
ur=20
network.

Regards,

Antony.

--=20
Anyone that's normal doesn't really achieve much.

 - Mark Blair, Australian rocket engineer

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


