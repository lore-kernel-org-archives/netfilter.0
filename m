From: "Federico Lombardo" <egopfe@hotmail.com>
Subject: Re: SYN Cookies
Date: Tue, 24 Dec 2002 09:49:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OE30pOUd0j7Mtb9z9tj00009428@hotmail.com>
References: <H7D5MZ$I9Or4RCoD4e51vPZvonZ6tDR2AGxyE1hroSPZ3lJTgKD@bol.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

http://cr.yp.to/syncookies.html

Syn Cookies are a Kernel Capabilities, not a Netfilter one.

The rate limit just "rate" incoming TCP packet with SYN flag set.


----- Original Message -----
From: "augusto.favari" <augusto.favari@bol.com.br>
To: <netfilter@lists.netfilter.org>
Sent: Thursday, December 19, 2002 12:08 PM
Subject: SYN Cookies


Hi! I was looking for SYN Cookies help about SYN
flooding.

What is the difference about just allowing the SYN
cookies system by default in the kernel and using the IP
tables rate-limit function ?

Iptables can use SYN cookies, can't it?

Thanks,

Augusto



__________________________________________________________________________
Venha para a VilaBOL!
O melhor lugar para voc=EA construir seu site. F=E1cil e gr=E1tis!
http://vila.bol.com.br

