From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: a sort of n00b question here but I'ld like to know.
Date: Mon, 20 Oct 2003 17:02:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5122E71@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Eric Marchionni <mailing-lists@gmx.ch>, netfilter@lists.netfilter.org

Iptables is just a program that loads your rules into the kernel. The
kernel modules running to support the firewall system is commonly known
as 'Netfilter'.

These modules run under the networking sub-system in the kernel, so it
doesn't need to spawn a kernel process. Kernel processes are the
programs with [ ] around them when running ps.

I think you can have non-kernel processes with the [], but I don't know
when that is the case.

-----Original Message-----
From: Eric Marchionni [mailto:mailing-lists@gmx.ch]=20
Sent: Monday, October 20, 2003 4:37 PM
To: netfilter@lists.netfilter.org
Subject: Re: a sort of n00b question here but I'ld like to know.

SBlaze wrote:

>As I said this is probably a n00bish question but i'm curious. Since
iptables
>is hooked into the kernel; would it show up as usage in the top or
uptime statistics?
>
i'd like to know that as well ;-D

cheers,
eric





