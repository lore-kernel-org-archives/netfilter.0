From: Buddy wu <ejournal4me@gmail.com>
Subject: Re: why can't use connlimit ??
Date: Fri, 28 Oct 2005 18:23:21 +0800
Message-ID: <43a0cdcb0510280323m62d85108l@mail.gmail.com>
References: <43a0cdcb0510272319m69a7a1d4g@mail.gmail.com>
	<64005.193.173.147.3.1130483580.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280027x6236afeco@mail.gmail.com>
	<50475.193.173.147.3.1130485511.squirrel@webmail.sterenborg.info>
	<43a0cdcb0510280051u1fd2aabcv@mail.gmail.com>
	<50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <50262.193.173.147.3.1130490146.squirrel@webmail.sterenborg.info>
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
To: Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

>
> What if you try with the latest POM and kernel (20051027 and 2.6.14
> resp.) ?
>
> I'm not a programmer so if this won't work, I don't know. I also find
> it strange that you do have a .so, but not a .ko file.
>
>
> Gr,
> Rob

Thanks anyway.
I will try it, but i Don't think it can be work. Justnow I have read
an article, It paste parts of the source, but i found it is diffrent
with that in my machine. I don't know which is the 'right'. but that's
code not the latest, it maybe may or jul's.

here's the code of him
  if (0 =3D=3D memcmp(&conn->tuple,&tuple,sizeof(tuple)) &&
    found !=3D NULL && (found_ct =3D tuplehash_to_ctrack(found)) !=3D NULL =
&&
    found_ct->proto.tcp.state !=3D TCP_CONNTRACK_TIME_WAIT) {

anzhen then is in my machine
  if (0 =3D=3D memcmp(&conn->tuple,&tuple,sizeof(tuple)) &&
    found !=3D NULL &&
    found->proto.tcp.state !=3D TCP_CONNTRACK_TIME_WAIT) {

you can found the diffrent with them. I think it is big. but I don't
know which will be right.
And He said he's code was not right too, should be modify to these:
  if (found !=3D NULL && (found_ct =3D tuplehash_to_ctrack(found)) !=3D NUL=
L &&
    0 =3D=3D memcmp(&conn->tuple,&tuple,sizeof(tuple)) &&
    found_ct->proto.tcp.state !=3D TCP_CONNTRACK_TIME_WAIT) {
or else it will be let the linux crazy, and the errors were (
<0>Kernel panic - not syncing: Fatal exception in interrupt)  ^_^

