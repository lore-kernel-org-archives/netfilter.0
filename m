From: Bjorn Ruberg <bjorn@ruberg.no>
Subject: Re: nat & ip accounting
Date: 27 Mar 2003 00:17:54 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048720674.18872.19.camel@mikke>
References: <001b01c2f3dc$37348a20$1001a8c0@s3ac> 
	<200303262251.45912.kimj@dawn.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200303262251.45912.kimj@dawn.dk>
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

On Wed, 2003-03-26 at 22:51, Kim Jensen wrote:
> On Wednesday 26 March 2003 22:11, Rowan Reid wrote:
> > I have an answer but you also got me thinking.  A good tool to keep
> > track of traffic via ip addresses would be mrtg. However is there an
> > mrtg type tool that uses the counters in iptables rules to keep track o=
f
> > traffic and output it in a user friendly form.
>=20
> If you wish to see things in a more user friendly way (or usable way, as =
no=20
> system is friendly :-) can be hard as you have to define what in what you=
=20
> wish to see things!
>=20
> mrtg is quite good, since you get the results on a webpage, but for track=
ing=20
> ip specific things - I don't know, as I don't think the kernel remembers =
this=20
> statistic. You can read per interface but not from each ip connecting to =
an=20
> interface.

You can indeed log from each IP connecting. In fact you may read
whatever you configure iptables to log. You may end up with one heck of
a ruleset, as you need one iptables rule for every different parameter
you want to log.


Bj=F8rn


