From: Daniel <sertys@supportivo.org>
Subject: Re: Port-forwarding Perfomance
Date: Thu, 24 Feb 2005 14:53:22 +0200
Message-ID: <opsmpcq8t8do0wqz@supportivo.org>
References: <421D2F04.8090100@wildcash.com>	<1109156169.11713.2.camel@nostromo.bgsecm.com>	<421DE4AF.6040702@wildcash.com>
	<20050223211053.GA12107@bender.817west.com>
	<421E6E14.5020905@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <421E6E14.5020905@wildcash.com>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 24 Feb 2005 16:15:16 -0800, Rudi Starcevic <tech@wildcash.com>=20
wrote:

> Hi,
>
>
> I'm still seeing slow performance with my port-forwarding but
> have found something interesting that may be problematic.
>
> Just to re-cap:
>
> I have one Linux 66.283.12.21 box and one Windows box 192.168.0.10
> I can download a file of the linux box at around 140K/s
> That very same file download on the Windows machine is around 15K/s=20
> using DNAT and Masq/Forwarding.
>
> However we can upload to the Windows box at 140k/s.
>
> So it is only slow, 15K/s, when the data is coming from Windows then=20
> through the Linux Iptables Masq/Forwarding Firewall.
>
> I contacted an earlier Admin for the Windows machine and was informed=20
> the TCP window size has been manually increased.
>
> Could this affect Forwarding in Iptables ?
>
> The default maximum TCP window size in Win2000 is 17520 bytes (12=20
> segments).
> The current value is set at 131400.
>
> 90% of the traffic being port-forwarded are Digital video files.
> These range in size from 2MB to 200MB.
>
> So I assume with large files like these Windows would opt for it's=20
> largest TCP window size.
>
> I guess the next step is to lower these to their default values and see=
=20
> if it affect bandwidth.
>
> Your thoughts on that would be much appreciated.
>
> Thanks.
> Regards,
> Rudi
>
>
>
>

Your increased windows size should not affect the network performance.=20
Windows machine performance - maybe, but not network overall. The tcp=20
window is like a bucket representation. When your host is flooded with=20
packets, it will send back syn/ack packets with win 0, which will make th=
e=20
source host retransmit the data again later until window > 1.



--=20
Using M2, Opera's revolutionary e-mail client: http://www.opera.com/m2/

