From: "Matthew Hellman" <mhellman@raccoon.com>
Subject: Re: hosts.deny
Date: Mon, 8 Jul 2002 07:07:06 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <004301c22677$fa8b1da0$020aa8c0@matttm9svd8lrh>
References: <EPEHIDPIPEBFNAHLCHPGAEMPCEAA.dennis@core-enterprises.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Dennis Cardinale <dennis@core-enterprises.com>, Netfilter Mailing List <netfilter@lists.samba.org>

IMHO, most definitely. Good security is best accomplished in layers. What if
a remote exploit is released for netfilter? Continue to "harden" your box
just like you would if you didn't even have netfilter. Remove uneeded
services, tighter permissions, configure tcp wrappers, etc, etc.

----- Original Message -----
From: "Dennis Cardinale" <dennis@core-enterprises.com>
To: "Netfilter Mailing List" <netfilter@lists.samba.org>
Sent: Sunday, July 07, 2002 5:54 PM
Subject: hosts.deny


> When running a netfilter firewall, is there any reason to continue using
the
> hosts.deny and hosts.allow files, or is this just superfluous?
>
> Thanks,
>
> Dennis
>
>



