From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: iptables related
Date: Mon, 8 Dec 2003 12:19:20 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679079@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Jeffrin <jeffrin@gamebox.net>, Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Because ping is a PROTOCOL called ICMP. It has two different packet
types, ICMP type 0 and 8.

0 =3D=3D Reply
8 =3D=3D Request

Hence, if you want to ping the system, you should add the ability for
those protocols to be accepted.

iptables -A INPUT -p icmp --icmp-type 8 -j ACCEPT

Please do SOME research before asking such elementary questions on a
tools list. This is not a networking newbie list (although there really
should be one somewhere). This is for netfilter related material, but
what you seem to lack is a general misunderstanding of networks.

Arr. I've gotten a lot more impatient with ppl ever since I got a junior
admin... Sorry man, I know you're just learning and all.

-----Original Message-----
From: Jeffrin [mailto:jeffrin@gamebox.net]=20
Sent: Monday, December 08, 2003 11:45 AM
To: Antony Stone
Cc: netfilter@lists.netfilter.org
Subject: Re: iptables related


hello ,

iptables -P INPUT DROP
iptables -A INPUT -p tcp --sport 80 -j ACCEPT

Iam not able to ping. why ?



