From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Crazy portmap request
Date: Thu, 30 Jun 2005 15:56:12 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290741D@pxtbenexd01.pxt.primeexalia.com>
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

Hello,=20

I have a new challenge of trying to map some IP's to a single IP but
with a static port.  Here is a sample.

Given 1 externally public IP I need to publish the entire internal class
C subnet worth of machines using their internal static IP address but
mapping them to different ports.

Each workstation has a TCP processing running on a fixed port.  For all
intents and purposes let's say it's SMTP.  What I need to do, using the
single static IP address is map out a single port for each server behind
it.

So, given 10.99.0.x it we want something like this

10.99.0.1:25 =3D 199.199.80.41:30001
10.99.0.2:25 =3D 199.199.80.41:30002
...
10.99.0.250:25 =3D 199.199.80.41:30250

Is there a simple way to do this?  Currently we have a pre/post routing
line per entry.  Is there a better way?

Thanks,=20

Gary Smith


