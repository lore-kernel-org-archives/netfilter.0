From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Configuring netfilter for pptp connections
Date: Fri, 26 May 2006 15:06:31 +0200
Message-ID: <4476FD57.90601@plouf.fr.eu.org>
References: <4472499F.2000200@uga.edu>	<53942.193.173.147.3.1148372693.squirrel@webmail.sterenborg.info>
	<02BB8A4AC86C564C89C7F14CF98CE0C401276A@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C401276A@knowledge.wizdom.nu>
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

Sietse van Zanen a =E9crit :
> For PPTP/GRE to work you need to add two rules:
> 1 for the PPTP connection (TCP Port 1723) and 1 for the GRE Protocol (I=
P proto 47).
> =20
> If you want your machine to connect to a PPTP server on the Internet,
> allow PPTP OUTBOUND towards that server and GRE INBOUND from that serve=
r.
> If you want a client on the Internet connect to your PPTP server,
> allow both PPTP and GRE INBOUND to your server.

According to this, neither the client or the server are allowed to=20
establish an outbound GRE connection. How can this work ?

