From: "=?ISO-8859-1?Q?Boutin_Ma=EBl?=" <mael.boutin@laposte.net>
Subject: Re: Re IPv6 MARK support
Date: Wed, 28 Feb 2007 10:55:01 +0100
Message-ID: <2acb06d50702280155x6b6f89e3o89097e070880ae3e@mail.gmail.com>
References: <2acb06d50702280004r5dae5aa1p6fb1f0bc9543a3d3@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:sender:to:subject:in-reply-to:mime-version:content-type:content-transfer-encoding:content-disposition:references:x-google-sender-auth;
	b=Tzo7Pv+UmSAOy9LEDsewcmC0WAJk4oLq0Hmp5SgdBJKOxQn5OfrXoI1PpXDqW9avlex/dfd64GIcqpc1MWootqgqo5NTfwM5KmZa422gaTRbB+Vk6dgE4W4pSCBhTtsNNrW3wheWX88w3uBz9aGWUDBGUhtH4VN8n/hmKRRGCFU=
In-Reply-To: <2acb06d50702280004r5dae5aa1p6fb1f0bc9543a3d3@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@lists.netfilter.org>

After some tests, it appears that it is the OUTPUT chain that does not
work. Indeed with the PREROUTING chain the mark is taken into account
by iproute and the packet is routed as indicated in the corresponding
tables.

Is it a bug or something i missed ?

On 2/28/07, Boutin Ma=EBl <mael.boutin@laposte.net> wrote:
> No one have an idea ? Is RPDB (routing policy database) working in
> Ipv6 ?? Seems to me that it should work, since NEPL (Nemo
> implementation for linux) is using it...
>
>
> On 2/27/07,  mael.boutin@laposte.net <mael.boutin@laposte.net> wrote:
> >  Hi,
> >
> >   I have a problem with the MARK target support. I want to MARK locally=
 generated IPv6 packets (UDP, TCP, ICMP ...). For this i use the following =
ip6tables command :
> >
> > ip6tables -t mangle -A OUTPUT -p udp -j MARK 0x1
> > ip6tables -t mangle -A OUTPUT -p tcp -j MARK 0x2
> >
> > All works fine, the rule is added in the OUPUT chain of mangle table. N=
ow i want to retrieve this mark and route packets according to their mark :
> >
> > ip -6 route add 2001:688:dd00::5 via 2001:688:bb00::5 dev eth0 table TE=
ST1
> > ip -6 route add 2001:688:dd00::5 via 2001:688:cc00::5 dev eth1 table TE=
ST2
> >
> > =3D> Routes seems to be taken into account and added to the tables (it =
doesn't appear but when you type ip -6 route show table 0 | grep TEST1 you =
can see the rules in TEST1)
> >
> > ip -6 rule add fwmark 0x1 table TEST1
> > ip -6 rule add fwmark 0x2 table TEST2
> >
> > =3D> Rules are added and can be viewed with ip -6 rule show
> >
> > The test bed is set up correctly (all interfaces can be pinged).
> >
> > My problem is that when i generate a UDP flow (via nc) the packets are =
not marked (i suppose) by ip6tables and therefore iproute does not lookup t=
able TEST1 as it should.
> >
> > My kernel is  2.6.19.3 with ip6tables compiled as module with all avail=
able targets, IPv6 multiple routing tables is built in as well as "use netf=
ilter MARK value as routing key"
> >
> > Best regards,
> >
> > Ma=EBl
> >
> > Envoyez vos cartes de voeux depuis  www.laposte.net
> > Elles seront ensuite distribu=E9es par le facteur : pratique et malin !
> >
> >
> >
>
>
>
> --
> echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbx=
q'|dc
>
> --
> echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbx=
q'|dc
>


--=20
echo '[q]sa[ln0=3Daln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq'=
|dc

