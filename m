From: Michal Martinek <michal.martinek@siemens.com>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 12:53:48 +0100
Message-ID: <45B5F74C.9060903@siemens.com>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>	
	<45B5E0DC.2020703@siemens.com>
	<1169548315.4178.61.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169548315.4178.61.camel@anduril.intranet.cartel-securite.net>
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
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.netfilter.org



Cedric Blancher wrote:
> Le mardi 23 janvier 2007 =E0 11:18 +0100, Michal Martinek a =E9crit :
>>> Do you know the STRING module ?
>> I'm afraid not. Can you give me some explanation (or link)?
>=20
> http://www.google.com/search?q=3Dnetfilter+string
>=20
> By the way, string match is completely irrelevant to your question as i=
t
> would allow you to match a given packet with a fixed already known
> value, not to extract a value you don't know from the packet.
>=20
> What you want to achieve is a conntrack helper. You can have a look at
> existing ones, such as ip_conntrack_ftp, ip_conntack_irc, etc. You coul=
d
> also use QUEUE target to do the job in userland.

Thanks for help, I've already written some userspace packet analyzer=20
acting as a NFQUEUE target, but the problem is, that not all of the=20
packets I'd like to handle (mostly drop) are recognizable. It is a video=20
stream, in which I can detect only some "key packets", but the rest=20
remains unclear.

The easiest would be (at least I think), to drop everything on the port=20
where I've detected those "key packets". But I don't know how to obtain=20
the port number inside the (NF)QUEUE handler.

Do you think, that conntrack helper will help me with it?


