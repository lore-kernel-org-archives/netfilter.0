From: Robb Bossley <robb.bossley@gmail.com>
Subject: Re: Dynamic Natting or Mobile ip
Date: Sun, 2 Oct 2005 17:34:42 -0400
Message-ID: <5c6851530510021434s10780cb2i4a0db76c38d1b506@mail.gmail.com>
References: <433d6d9a.27388a40.617b.76d3SMTPIN_ADDED@mx.gmail.com>
Reply-To: Robb Bossley <robb.bossley@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <433d6d9a.27388a40.617b.76d3SMTPIN_ADDED@mx.gmail.com>
Content-Disposition: inline
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
To: Brent Wilkinson <brent@air2data.com>
Cc: netfilter@lists.netfilter.org

On 9/30/05, Brent Wilkinson <brent@air2data.com> wrote:
> I am trying to figure out a feature I saw on a dlink router.
>
> I am creating some routers/servers for a few hotels. There requirements s=
ay
> I must have a dynamic nat router. What it does is allow anyone with any
> static ip to be able to connect to the network and get internet access.
>
> Example:
>
> Router/server
> Ip:192.168.100.1/24
> Dhcp server range: 192.168.100.50-192.168.100.200
>
> Example client
> Static ip: 10.1.2.47
> Subnet: 255.255.255.180
> Gateway: 10.1.2.1
> Dns: 1.1.1.1
>
> What I want to do is allow the client through the network without changin=
g
> there ip info. I have heard of something called mobile ip or dynamic
> natting. Is anyone familiar with what I am describing and/or has done it?=
 If
> you have do you have any web pages that give information on it.
>
> Thanks
>
> Brent Wilkinson
>
>

Brent,

The IP you gave as an example was a private IP address.  There are
three ranges of private IP addresses.  They consist of 192.168.x.x,
10.x.x.x, and 172.16.x.x through 172.31.x.x.  An IP address of this
type would not be visible beyond the LAN to which you connected.

I am not sure how this would work, as the DNS servers and gateway that
the machine would need for outbound access would have to be updated.

If you are trying to get a machine to have the same IP address no
matter when or where it is attached to the same network, you can put
that information into the DHCP configuration file for that network so
that it will assign a certain address based upon the MAC address.

Robb

