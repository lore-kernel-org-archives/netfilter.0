From: "John A. Novak" <jnovak@blueshiftinc.com>
Subject: RE: DNAT and multiple public IP addresses; was RE: netfilter and multiple virtual interfaces
Date: Fri, 3 Jan 2003 17:04:27 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <F635E25A78F69C41B85DC6CB18972A9A474710@kepler.blueshiftinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Class: urn:content-classes:message
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
To: David Boone <netfilter@wizdom.net>, Andy Meader <ameader@corp.Lcom.net>
Cc: netfilter@lists.netfilter.org

I have a firewall configured to work similarly with the exception that =
the public IP addresses are all on the same subnet, so my public web =
servers would be at 1.1.1.2, 1.1.1.3 and 1.1.1.4, with the external =
interface as 1.1.1.1.  This works as long as the external interface has =
all the public IP addresses used assigned to it.

JN =20

-----Original Message-----
From: David Boone [mailto:netfilter@wizdom.net]
Sent: Friday, January 03, 2003 4:15 PM
To: 'Andy Meader'
Cc: netfilter@lists.netfilter.org
Subject: DNAT and multiple public IP addresses; was RE: netfilter and
multiple virtual interfaces


netfilter won't work with virtual interfaces, so I'm left trying to get
packets to flow between a public and a private network.

How would be a good way to assign multiple IP addresses to the same
interface and then have answers to those IP addresses be forwarded to
servers on a private network?

Here's an example:

Internet
   |
eth0 (1.1.1.1/24)
   |
netfilter Router=20
   |
eth1 (192.168.1.1/24)
          |
   +------+-----------+-------------+
   |                  |             |
Web server 1     Web server 2    Web server 3
(192.168.1.2)   (192.168.1.3)    (192.168.1.4)

Where:
web server 1 has public IP 1.1.2.1/24
web server 2 has public IP 1.1.2.2/24
web server 3 has public IP 1.1.2.3/24

I've tried setting up static arp entries, but I'm having some
difficulties with routing, I think, since the web server's public IP's
are on a separate network than the firewall's Internet IP (1.1.2 instead
of 1.1.1).

Thanks for any suggestions,
Dave Boone

-----Original Message-----
From: netfilter-admin@lists.netfilter.org
[mailto:netfilter-admin@lists.netfilter.org] On Behalf Of Andy Meader
Sent: Friday, December 20, 2002 9:05 PM
To: David Boone
Cc: netfilter@lists.netfilter.org
Subject: Re: netfilter and multiple virtual interfaces


Hi Dave,

I know that on RH 7.1 that netfilter only sees an interface and its
multineted (virtual) interfaces as the same interface. Possibly newer
versions are different.

Good luck.

Andy

On Fri, 20 Dec 2002, David Boone wrote:

> Hi,
>
> I know you can apply a + (plus sign) to adapters in the form eth+ or
> ppp+, but I'm setting up a firewall that will have several web servers
> behind it and I would like to do something like eth0+ and/or eth0:+ in
> the rules.  Does anyone know if this will work or do I have to enter
> every single virtual adapter by hand?
>
> Thanks,
> Dave Boone
>
>
>





