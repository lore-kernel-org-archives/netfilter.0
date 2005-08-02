From: Sp0oKeR <spooker@gmail.com>
Subject: Re: Blocking a range of source IPs to a specific port
Date: Tue, 2 Aug 2005 10:35:56 -0300
Message-ID: <9255886c0508020635713bb51a@mail.gmail.com>
References: <42EE63E6.6070801@blackicehosting.com>
Reply-To: Sp0oKeR <spooker@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42EE63E6.6070801@blackicehosting.com>
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
To: James Harrison <jamesharrison@blackicehosting.com>
Cc: netfilter <netfilter@lists.netfilter.org>

 you can use ipset
 http://ipset.netfilter.org/

Regards,

Sp0oKeR

On 8/1/05, James Harrison <jamesharrison@blackicehosting.com> wrote:
> Hi,
>=20
> I'm trying to use iptables to block a range of source IP addresses, but
> I can't figure out how to specify ranges- i'm trying to block everything
> from 172.150-250.*.* on port 8676- can someone help me out with the rule
> for this?
>=20
> Thanks,
> James Harrison
>=20
>

