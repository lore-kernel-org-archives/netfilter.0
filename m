From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Policy routing with mark not working.
Date: Fri, 12 May 2006 12:54:06 +0200
Message-ID: <4464694E.8030309@plouf.fr.eu.org>
References: <20060510202615.51988.qmail@web53303.mail.yahoo.com>	<44625A23.30606@zoomnet.ro>
	<803aaa110605111701v56ea7d8dg39b278888321b1ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <803aaa110605111701v56ea7d8dg39b278888321b1ee@mail.gmail.com>
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

Frank a =E9crit :
> Also, after much time banging my head against the wall trying to
> figure out why my marks were ignored, I discovered that in spite of
> what the netfilter packet traversal diagram shows, marks set in
> PREROUTING are ignored for packets originating on the box doing the
> routing, and the marks need to be set on the OUTPUT chain for that
> case

"In spite" ? What are you tacking about ? That's exactly what the=20
Netfilter diagram shows : locally generated packets don't go through the=20
PREROUTING chain - except when sent to (and therefore received back=20
from) the loopback interface.

