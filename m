From: Michal Martinek <michal.martinek@siemens.com>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 13:50:31 +0100
Message-ID: <45B60497.5050100@siemens.com>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>	
	<45B5E0DC.2020703@siemens.com>	
	<1169548315.4178.61.camel@anduril.intranet.cartel-securite.net>	
	<45B5F74C.9060903@siemens.com>
	<1169555626.4178.78.camel@anduril.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1169555626.4178.78.camel@anduril.intranet.cartel-securite.net>
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

Thanks a lot!

The solution with CONNMARK seems to be exactly what I need. It is also=20
much better than drop everything on a given port :-).

Have a nice day,

Michal

Cedric Blancher wrote:
> Le mardi 23 janvier 2007 =E0 12:53 +0100, Michal Martinek a =E9crit :
>> Thanks for help, I've already written some userspace packet analyzer=20
>> acting as a NFQUEUE target, but the problem is, that not all of the=20
>> packets I'd like to handle (mostly drop) are recognizable. It is a vid=
eo=20
>> stream, in which I can detect only some "key packets", but the rest=20
>> remains unclear.
>=20
> OK, so if I understand you correctly... You have a video stream
> containing key packets you can spot. This video stream occurs on non
> predictable ports.
>=20
> First solution, and apologies to G=E1sp=E1r, use string match to identi=
fy
> your key packets. Then mark the entire connection using CONNMARK and
> drop it.
>=20
> Something like:
>=20
> 	iptables -t mangle -A FORWARD -m string --string "yourmagic" \
> 		-j CONNMARK --set-mark 0x1
> 	iptables -A FORWARD -m connmark --mark 0x1 -j DROP
>=20
> This means once you've detected a key packet, you'll drop it as well as
> all further packets from the same connection.
>=20
> Second solution, you write a helper. Maybe I don't quite well get your
> situation, but this stream does not come from nowhere. It's ports have
> to be negociated in some previous connection so your client application
> can open the right port. Thus, your helper would follow this negociatio=
n
> connection to identify on the fly streaming ports and block the entire
> video stream.
>=20
>=20

