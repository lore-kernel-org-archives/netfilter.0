From: Benoit Panizzon <panizzon@woody.ch>
Subject: Re: Preventing to bind an interface (or solving that problem with
Date: Thu, 10 Mar 2005 22:39:53 +0100
Message-ID: <200503102239.54233.panizzon@woody.ch>
References: <1110442915@ksbase>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1110442915@ksbase>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Am Donnerstag, 10. M=E4rz 2005 14.20 schrieb Not Here:
> Thursday March 10 2005 11:33, Benoit Panizzon wrote to All:
>
>
>  eth0 =3D>> $IP from Cable ISP.
>  eth1 =3D>> x.y.z.1 (my own IP with correct PTR Entries etc.) on LAN.
>
>  BP> Now unfortunately bind, sendmail and everything binds on both
>  BP> IP-Addresses.
>
> Set gateways for both networks.

There can only be one active default route, or what do you mean by gateways?

=2DBenoit-

