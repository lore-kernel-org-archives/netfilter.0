From: "Mario Ohnewald" <mario.Ohnewald@gmx.de>
Subject: NAT FROM public ip TO public ip
Date: Fri, 7 Jan 2005 05:36:48 +0100 (MET)
Message-ID: <10459.1105072608@www72.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hello List!

This is a real easy question, but i will explain it in detail so that you
know what i am on about ;)

I have two internet boxes, both have only one nic.
Box A is my root box.
Box B is a ftp server (where i am not admin, but i have an ftp account).

Both, Box A and B have a public ip address.
You can NOT access the ftp server from the outside.
ONLY Box A can connect to that ftp server (Box B).

So i though i could simply nat a connection through my Box A, to Box B.
If i connect from the real bad world, to my Box A, port 2121. Box A could
forward/NAT that to the internal ftp box.

I have tried it with this rule:
$IPT -t nat -A PREROUTING -i eth0 -p tcp -d 123.123.123.123 -m helper
--helper ftp-2121 -j DNAT --to-destination 123.123.123.111

and

modprobe ip_conntrack_ftp ports=3D21,2121


But it looks like its not working.
I did a tcpdump -i eth0 -n host 123.123.123.111


And no packages where transfered to the ftp box (123.123.123.111).
Any idea why? Am i going the right way at all?

Thanks, Mario

--=20
+++ GMX - die erste Adresse f=FCr Mail, Message, More +++
1 GB Mailbox bereits in GMX FreeMail http://www.gmx.net/de/go/mail

