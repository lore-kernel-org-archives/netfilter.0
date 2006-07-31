From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: routing, source-address rewriting
Date: Mon, 31 Jul 2006 15:37:09 +0200
Message-ID: <44CE0785.3010508@plouf.fr.eu.org>
References: <20060730111458.99932.qmail@web57106.mail.re3.yahoo.com>
	<a17923b1c77e594d5af02a3236065958@former03.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <a17923b1c77e594d5af02a3236065958@former03.de>
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
To: netfilter@lists.netfilter.org

Hello,

former03 | Baltasar Cevc a =E9crit :
> Does pc2 try to send out the packets (see tcpdump output)? - If yes,
> it's probably your ISP blocking 'spoofed' packets (packets which come
> from adresses that are not supposed to be on that subnet).

Right. But even though the ISP does not block "spoofed" packets, I=20
replied in comp.protocols.tcp-ip that an SNAT rule cannot change the=20
source address of a reply packet.

