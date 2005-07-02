From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Is anyone else getting these.
Date: Fri, 1 Jul 2005 18:53:35 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290741F@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="----_=_NextPart_001_01C57EA8.DC05F722"
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
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

------_=_NextPart_001_01C57EA8.DC05F722
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

I have verified my IP's not to on relays.ordb.org.  I'm wondering if =
they blacklisted netfilter.org?



FW: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail server =
found=20
on relays.ordb.org

-----Original Message-----
From: Systemadministrator [mailto:postmaster@echtzeit.com]=20
Sent: Friday, July 01, 2005 2:11 PM
To: Gary W. Smith
Subject: Unzustellbar: [SPAM] - Crazy portmap request - Sending mail =
server found on relays.ordb.org

Your message

  To:      netfilter@lists.netfilter.org
  Subject: [SPAM] - Crazy portmap request - Sending mail server found on
relays.ordb.org
  Sent:    Fri, 1 Jul 2005 00:56:12 +0200

did not reach the following recipient(s):

phergenhahn@echtzeit.de on Fri, 1 Jul 2005 23:11:28 +0200
    Der Name des Empf=E4ngers wurde nicht erkannt.
	Die MTS-ID der urspr=FCnglichen Nachricht ist: c=3Dde;a=3D =
;p=3Dechtzeit
gmbh ? ;l=3DEZMXS0507012111NLNP7YNT
    MSEXCH:IMS:Echtzeit GmbH & Co. KG:ECHTZEIT:EZMXS 0 (000C05A6)
Unbekannter Empf=E4nger



------_=_NextPart_001_01C57EA8.DC05F722
Content-Type: message/rfc822
Content-Transfer-Encoding: 7bit

X-MS-Embedded-Report: 
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable
X-Mailer: Internet Mail Service (5.5.2653.19)
Content-class: urn:content-classes:message
X-MimeOLE: Produced By Microsoft Exchange V6.5.7226.0
Subject: [SPAM] - Crazy portmap request - Sending mail server found on
	relays.ordb.org
Date: Thu, 30 Jun 2005 15:56:12 -0700
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE58290741D@pxtbenexd01.pxt.primeexalia.com>
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
From: "Gary W. Smith" <gary@primeexalia.com>
To: <netfilter@lists.netfilter.org>

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

------_=_NextPart_001_01C57EA8.DC05F722--

