From: "dave beach" <drbeach@rogers.com>
Subject: RE: Iptables, nat, and IPSec
Date: Wed, 6 Apr 2005 07:10:47 -0400
Message-ID: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAA+1cYJf7sR0Sh2A7HkLkwFgEAAAAA@rogers.com>
References: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAAaKAgxwShUi++SQ7B9ssOAEAAAAA@rogers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <!~!UENERkVCMDkAAQACAAAAAAAAAAAAAAAAABgAAAAAAAAAqrTb2LYes02Oflamihm4wwL6DwAQAAAAAaKAgxwShUi++SQ7B9ssOAEAAAAA@rogers.com>
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
To: 'Daniel Lopes' <lopsch@lopsch.com>, netfilter@lists.netfilter.org

 > It=B4s an IPSec problem. I don=B4t want to go into detail but you =
probably
should try NAT-Traversal.
 > For the theory http://www.ipsec-howto.org/x180.html

Okay, I've read the reference. If I understand correctly, I need to use =
a
NAT methodology that implements "NAT Traversal" (the reference is a =
little
vague on this; in fairness, it does say "There are no RFCs at the =
moment").
It might be therefore fair to say that the Linksys implementation =
includes
NAT Traversal, enabling it to handle multiple IPSec passthrough =
connections.

Which leads me to what I suppose was the original question, now slightly
modified: does iptables support NAT Traversal?


