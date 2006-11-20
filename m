From: "Gary W. Smith" <gary@primeexalia.com>
Subject: RE: Dynamic chain alternatives
Date: Mon, 20 Nov 2006 08:21:49 -0800
Message-ID: <57F9959B46E0FA4D8BA88AEDFBE5829024ED16@pxtbenexd01.pxt.primeexalia.com>
References: <20061120065509.GA18079@zion.homelinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <20061120065509.GA18079@zion.homelinux.com>
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
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org

That should work.  Thanks.

-----Original Message-----
From: Sven Schuster [mailto:schuster.sven@gmx.de]=20
Sent: Sunday, November 19, 2006 10:55 PM
To: Gary W. Smith
Cc: netfilter@lists.netfilter.org
Subject: Re: Dynamic chain alternatives


Hi Gary,

On Sun, Nov 19, 2006 at 05:23:53PM -0800, Gary W. Smith told us:
> I have a need to create a dynamic table in that will have random IP's
> inserted and deleted on a regular basis.  Currently we do this by
> creating a chain at load time and on a scheduled basis we flush that
> chain and then to a iptables-restore -n < dynamic_rules.txt. =20
>
> Is there a better approach to doing this?

what about using ipset??
http://www.netfilter.org/projects/ipset/index.html

hope that helps,


Sven

> Gary Wayne Smith
>

--=20
Linux zion.homelinux.com 2.6.18-1.2849.fc6xen #1 SMP Fri Nov 10 13:56:52
EST 2006 i686 athlon i386 GNU/Linux
 07:54:34 up 4 days,  9:12,  1 user,  load average: 0.07, 0.13, 0.13

