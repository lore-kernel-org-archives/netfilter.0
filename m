From: TAC Forums <tac.forums@gmail.com>
Subject: Re: Firewall and a FTP server
Date: Tue, 20 Dec 2005 11:00:59 +0530
Message-ID: <b552223b0512192130u79ace0dof6706aaf944f14d7@mail.gmail.com>
References: <b552223b0512190352v25209da9p7d3d685b58ea9e6d@mail.gmail.com>
	<43A6A2D0.8050305@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43A6A2D0.8050305@gmail.com>
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
To: Askar Ali <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi Askar,

On 12/19/05, Askar Ali <askarali@gmail.com> wrote:
> TAC Forums wrote:
>
> >Hi All,
> >
> >We have a FTP server, (Red Hat Linux 7) behind a firewall, the
> >
> >
> why are you still using historic version of rh ? :)
>
Well, we are stuck with a Sun Cobalt Raq 550 server for our life!!

> >firewall allows only incomming and established connections on ports
> >20,21  from any where and evry where.
> >
> >The Problem is, when the customers use FTP clients, the manage to
> >login , but cannot upload/download files if they use PASSIVE FTP
> >connections.
> >
> >Can smeone suggest, how the best way to get out of this situation,
> >should we enable all ports above 1023?
> >
> >Regards,
> >Boskey
> >
> >--
> >TAC Support Team
> >
> >
> >
> >
> hi Tac
>
> verify that modules
>
> ip_conntrack_ftp
> ip_nat_ftp
>
> are loaded, if not try to load them with "modprobe ip_conntrack_ftp" and
> put it in your firewall startup script so that modules at boot time.
>
>
Thank you, ths is already done.
Regards,
Boskey
>
>
> regards,
>
> askar
>


--
TAC Support Team

