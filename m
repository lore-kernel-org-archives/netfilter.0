From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Tarpit usage question
Date: Fri, 13 May 2005 08:16:53 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290738D@pxtbenexd01.pxt.primeexalia.com>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>, netfilter@lists.netfilter.org

Grant,=20

This all makes complete sense.  I should have everything I need now to
make this work.  What you have suggested is exactly what I wanted to do
anyways.  I just wanted to make sure that my overall understanding of
the raw table was correct.

> Well the idea that I was after was that you explicitly handle anything
> except what you know to (likely) be valid traffic in such a way that
it
> will not be connection tracked and ultimately TARPITed.  Thus if you
have
> multiple valid source IP / port combinations you would want to do a
series
> of ACCEPT targets.

Gary Wayne Smith

