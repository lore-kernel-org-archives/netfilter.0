From: "Gary W. Smith" <gary@primeexalia.com>
Subject: DNAT/SNAT question
Date: Thu, 14 Apr 2005 10:25:27 -0700
Message-ID: <27594E8BA9D5CA458F5EF87D88B6B48F019A89@pxtvjoexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a set of external IP's which are SNAT'd/DNAT's to a private
range.  On this particular network there are 64 of them.  In the part we
create a 1:1 SNAT and a 1:1 DNAT for each IP.  Since we have a /26 is it
possible to do this in a single line rather than having 64 entries?  I
know that if we specificy multiple --souce or --destinations it says it
will do round robin, which is not what we want.

Gary Smith

