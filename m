From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Messages in log with SNAT target
Date: Tue, 25 Jul 2006 15:21:02 +0200
Message-ID: <44C61ABE.3000306@plouf.fr.eu.org>
References: <44C4903B.3080004@gmail.com> <44C49FC6.6030504@plouf.fr.eu.org>
	<02BB8A4AC86C564C89C7F14CF98CE0C40127D8@knowledge.wizdom.nu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <02BB8A4AC86C564C89C7F14CF98CE0C40127D8@knowledge.wizdom.nu>
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

Sietse van Zanen a =E9crit :
> It's NOT default behaviour of NT to drop ICMP Redirects.

You're right, my mistake.
I had tested that some time ago, but I must have made a mistake. I just=20
tested again Windows NT4, 2000 and XP as well as Windows 98 and they all=20
accept ICMP redirects by default.

> It IS default behaviour not to accept gateways, that are not on the loc=
al subnet.=20

I hope this is not only default behaviour but permanent fixed behaviour.

