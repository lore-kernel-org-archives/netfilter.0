From: "Maxime Ducharme" <mducharme@cybergeneration.com>
Subject: Re: ever block *outgoing* packets on your firewall?
Date: Fri, 14 Jan 2005 15:16:58 -0500
Message-ID: <04d601c4fa76$0054f830$b000a8c0@cybergeneration.com>
References: <20050114200228.GA21562@spawar.navy.mil>
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
To: seberino@spawar.navy.mil, netfilter@lists.netfilter.org


Hello

Blocking outgoing can be useful in several situations :

- corporate network where you do not want people
to send confidential information outside

- public networks you do not want to be used
for abuse / spam / hacking

- simply control what is going out of your network

- talking of hacking, some trojans / exploits
can create outbound connections and defeat the
firewall security if it doesn't care about outbound
connections.
See
http://www.thc.org/papers/fw-backd.htm

Another example, JPEG of Death reverse connect will
connect outside just by viewing a jpeg file you downloaded
(if you do not have patches ;] )
http://www.hackernews.com.br/arquivos/JpegOfDeathAll.c

So I usually set up some control of outbound connections ;)

Have a nice day

Maxime Ducharme
Programmeur / Sp=E9cialiste en s=E9curit=E9 r=E9seau

----- Original Message -----=20
From: <seberino@spawar.navy.mil>
To: <netfilter@lists.netfilter.org>
Sent: Friday, January 14, 2005 3:02 PM
Subject: ever block *outgoing* packets on your firewall?


>
> I'm wondering if it is ever necessary to block
> *outgoing* packets at your firewall.
>
> As long as you block /incoming/ carefully no hacker
> on the Internet can send spam through a node on
> your network or anything nasty like that right?
>
> (I'm wondering for a wifi hotspot if any nastiness
> will happen if I don't block outgoing.  I block
> virtually all incoming except ssh.)
>
> CS
>


