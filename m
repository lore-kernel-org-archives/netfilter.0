From: Axel Heinrici <heinrici76@gmx.de>
Subject: Re: ftp connection tracking (solved)
Date: Tue, 29 Jul 2003 17:22:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307291722.40881.heinrici76@gmx.de>
References: <200307291322.04698.heinrici76@gmx.de> <1059478900.844.18.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1059478900.844.18.camel@elendil.intranet.cartel-securite.net>
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

Hi

On Tuesday 29 July 2003 13:41, Cedric Blancher wrote:
> Le mar 29/07/2003 =E0 13:22, Axel Heinrici a =E9crit :
> > I have problem connecting to a ftp-server on a non-standard port.
>
> [...]
>
> > What options do I have to aply when inserting the modules?
>
> As far as I can remember :
>
> 	modprobe ip_conntrack_ftp port=3D21,2121
>
> You can track 8 ports this way.

To avoid anyone is searching the archives and getting insane later.....
The correct parameter is "ports" and not "port" :-)

Axel


