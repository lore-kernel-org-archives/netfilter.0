From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: netfilter_queue: how to obtain address info from queued packet
Date: Tue, 23 Jan 2007 13:33:46 +0100
Message-ID: <1169555626.4178.78.camel@anduril.intranet.cartel-securite.net>
References: <45B5DD80.70809@siemens.com> <45B5DF09.6030001@freemail.hu>
	<45B5E0DC.2020703@siemens.com>
	<1169548315.4178.61.camel@anduril.intranet.cartel-securite.net>
	<45B5F74C.9060903@siemens.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45B5F74C.9060903@siemens.com>
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
To: Michal Martinek <michal.martinek@siemens.com>
Cc: netfilter@lists.netfilter.org

Le mardi 23 janvier 2007 =E0 12:53 +0100, Michal Martinek a =E9crit :
> Thanks for help, I've already written some userspace packet analyzer=20
> acting as a NFQUEUE target, but the problem is, that not all of the=20
> packets I'd like to handle (mostly drop) are recognizable. It is a video=20
> stream, in which I can detect only some "key packets", but the rest=20
> remains unclear.

OK, so if I understand you correctly... You have a video stream
containing key packets you can spot. This video stream occurs on non
predictable ports.

First solution, and apologies to G=E1sp=E1r, use string match to identify
your key packets. Then mark the entire connection using CONNMARK and
drop it.

Something like:

	iptables -t mangle -A FORWARD -m string --string "yourmagic" \
		-j CONNMARK --set-mark 0x1
	iptables -A FORWARD -m connmark --mark 0x1 -j DROP

This means once you've detected a key packet, you'll drop it as well as
all further packets from the same connection.

Second solution, you write a helper. Maybe I don't quite well get your
situation, but this stream does not come from nowhere. It's ports have
to be negociated in some previous connection so your client application
can open the right port. Thus, your helper would follow this negociation
connection to identify on the fly streaming ports and block the entire
video stream.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

