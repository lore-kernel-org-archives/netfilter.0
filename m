From: clister <clist@uah.es>
Subject: Re: selective connection tracking?
Date: Wed, 12 May 2004 19:53:22 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405121953.22409.clist@uah.es>
References: <1084383723.40a261ebb1122@mail.borderware.com>
Reply-To: clist@uah.es
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1084383723.40a261ebb1122@mail.borderware.com>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

i think , thereis a raw target on POM and something as NOTRACK in order to=
=20
ignore conntracking for those connections...=20
Try it

El Mi=E9rcoles, 12 de Mayo de 2004 19:42, fming@borderware.com escribi=F3:
> Hi,
>
> I am from the FreeBSD/ipfilter world. I recently switched to Linux and
> netfilter. One question I have with netfilter connection tracking is
> whether there I can instruct the connection tracking to selectively
> tracking connections.
>
> Looks to me once I loaded the conn_track modules, everything was tracked.
> Is there a way I can specify, for example, that I only want http to be
> tracked? All other traffic will be dropped anyway, tracked or not.
>
> Regards,
> Ming

