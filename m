From: alexb@atix.com.br
Subject: Re: nat & ip accounting
Date: Wed, 26 Mar 2003 19:51:26 -0300 (BRT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1048719086.3e822eeeb4d7e@www.spsul.com.br>
References: <001b01c2f3dc$37348a20$1001a8c0@s3ac> <200303262251.45912.kimj@dawn.dk>
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

If you havn't to many diferent ip/ip-ranges to monitor you can enter iptabl=
es
filter rules for that ips with no action, just to count the trafic, than us=
e a
script and mrtg to show them. something like:

iptables -A FORWARD -s [MonitoredIP] -i [NIC_conecting_to_IP]
iptables -A FORWARD -d {MonitoredIP] -o [NIC_conecting_to_IP]

make a script to grab the bytecount and output them as mrtg expect
(IN,OUT,UPTIME,HOSTNAME). Change ^[1,2] to select your rules
in the chain where you grab the trafic.

iptables -nvxL FORWARD --line-numbers|egrep ^[1,2]|awk '{print $3}'


C=F3pia Kim Jensen <kimj@dawn.dk>:

> On Wednesday 26 March 2003 22:11, Rowan Reid wrote:
> > I have an answer but you also got me thinking.  A good tool to keep
> > track of traffic via ip addresses would be mrtg. However is there an
> > mrtg type tool that uses the counters in iptables rules to keep track
> of
> > traffic and output it in a user friendly form.
>=20
> If you wish to see things in a more user friendly way (or usable way, as
> no=20
> system is friendly :-) can be hard as you have to define what in what
> you=20
> wish to see things!
>=20
> mrtg is quite good, since you get the results on a webpage, but for
> tracking=20
> ip specific things - I don't know, as I don't think the kernel remembers
> this=20
> statistic. You can read per interface but not from each ip connecting to
> an=20
> interface.
>=20
> /Kim
>=20
>=20

