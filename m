From: "David Boone" <netfilter@wizdom.net>
Subject: DNAT and multiple public IP addresses; was RE: netfilter and multiple virtual interfaces
Date: Fri, 3 Jan 2003 19:15:27 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7ED10BBB6654124E9AFFF27155322BBBB781@corp03.nc.ehomecare.com>
References: <Pine.LNX.4.33.0212202004040.13035-100000@wltis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.33.0212202004040.13035-100000@wltis.com>
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
To: 'Andy Meader' <ameader@corp.Lcom.net>
Cc: netfilter@lists.netfilter.org

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
netfilter Router 
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




