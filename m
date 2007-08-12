From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: pptp
Date: Mon, 13 Aug 2007 00:58:00 +0200
Message-ID: <46BF9078.7080007@plouf.fr.eu.org>
References: <33152.202.69.36.149.1186819159.squirrel@khimail.comsats.net.pk>
	<9255886c0708121441h3265684ep8699d7ee771f53c2@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <9255886c0708121441h3265684ep8699d7ee771f53c2@mail.gmail.com>
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

Rodrigo Montoro (Sp0oKeR) a =E9crit :
>    you need ip_pptp_conntrack module enable.

ip_conntrack_pptp, or nf_conntrack_pptp depending on the kernel version=20
and/or options.
And probably ip_nat_pptp or nf_nat_pptp, as there seems to be some NAT.

