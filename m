From: DCulp@mcleodhealth.org
Subject: Re: Losing packets using IPSec
Date: Tue, 21 Oct 2003 11:05:12 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OFA71B7840.697574FA-ON85256DC6.0052D65F@org>
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
To: kenr@redergaard-it.no
Cc: netfilter@lists.netfilter.org





Check your MTU at both ends.
  David





kenr@redergaard-it.no@lists.netfilter.org on 10/20/2003 07:03:32 AM

Sent by:    netfilter-admin@lists.netfilter.org


To:    netfilter@lists.netfilter.org
cc:

Subject:    Losing packets using IPSec


Hi,

Have any of you experienced loosing bytes at the end of a packet when
using IPSec (FreeSwan) ?

I've turned on debugging in klips, and it prints the complete package
before calling netif_rx(). I guess the problem must be related to iptab=
les
?

With regards,
Ken A. Rederg=E5rd

=



