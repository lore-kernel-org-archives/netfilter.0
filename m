From: Kim Jensen <kimj@dawn.dk>
Subject: Re: nat & ip accounting
Date: Wed, 26 Mar 2003 22:51:45 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200303262251.45912.kimj@dawn.dk>
References: <001b01c2f3dc$37348a20$1001a8c0@s3ac>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c2f3dc$37348a20$1001a8c0@s3ac>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Rowan Reid <rreid@studio3arc.com>, 'Alexandru Coseru' <alexcos@home.ro>, netfilter@lists.netfilter.org

On Wednesday 26 March 2003 22:11, Rowan Reid wrote:
> I have an answer but you also got me thinking.  A good tool to keep
> track of traffic via ip addresses would be mrtg. However is there an
> mrtg type tool that uses the counters in iptables rules to keep track o=
f
> traffic and output it in a user friendly form.

If you wish to see things in a more user friendly way (or usable way, as =
no=20
system is friendly :-) can be hard as you have to define what in what you=
=20
wish to see things!

mrtg is quite good, since you get the results on a webpage, but for track=
ing=20
ip specific things - I don't know, as I don't think the kernel remembers =
this=20
statistic. You can read per interface but not from each ip connecting to =
an=20
interface.

/Kim


