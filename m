From: "Patrick Ahler" <patrick@vikus.com>
Subject: RE: String Replace
Date: Wed, 17 Mar 2004 14:58:24 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <810BC538117E9F4E9BB152E0C100DF1F0A5422@farmer.vikus.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Daniel Chemko <dchemko@smgtec.com>

UDP protocol (port 53), DNS

-----Original Message-----
From: Daniel Chemko [mailto:dchemko@smgtec.com]=20
Sent: Wednesday, March 17, 2004 1:34 PM
To: Patrick Ahler; netfilter@lists.netfilter.org
Subject: RE: String Replace


Patrick Ahler wrote:
> Am looking for a way to mangle packets forwarding from port X with
> string "foo" in the packet and replace with "bar". Possible?=20

Someone needs to write a protocol helper for that. Since you don't
really say what protocol it is, I would say no.

