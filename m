From: kenr@redergaard-it.no
Subject: Losing packets using IPSec
Date: Mon, 20 Oct 2003 13:03:32 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3333.213.236.166.80.1066647812.squirrel@nymedia.no>
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

Hi,

Have any of you experienced loosing bytes at the end of a packet when
using IPSec (FreeSwan) ?

I've turned on debugging in klips, and it prints the complete package
before calling netif_rx(). I guess the problem must be related to iptable=
s
?

With regards,
Ken A. Rederg=E5rd

