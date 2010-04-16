From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: can we design a modified fail2ban ?
Date: Fri, 16 Apr 2010 17:29:43 +0200
Message-ID: <4BC88267.5010005@plouf.fr.eu.org>
References: <4BC7E028.8050209@infoservices.in>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BC7E028.8050209@infoservices.in>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

J. Bakshi a =E9crit :
>=20
> fail2ban is a popular application to prevent the brute-force attack
> against ssh and also against imap, pop3 etc.. But fail2ban actually
> blacklist the IP and this is what fail2ban has been designed for. Now=
 a
> days we can design the same with iptables. I wonder if iptables can
> provide more liberty to match IP as well as port combination so that =
we
> don't need to blacklist the IP but only block the attempts from the I=
P
> based on port. Say more than 3 ssh attempt from IP xxx.xxx.xxx.xxx is
> detected and no more ssh attempt from the same ip is no more possible
> but pop and imap still works. Is it really possible with iptables ?

Detected how ? fail2ban detects authentication failures by parsing the
server logs. iptables cannot do this, and IHMO should not do this. This
is just not its purpose.
