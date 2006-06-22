From: "Rodrigo Montoro" <spooker@gmail.com>
Subject: Re: iptables -L command
Date: Thu, 22 Jun 2006 09:01:33 -0300
Message-ID: <9255886c0606220501k2795c9c3n3b359084978dcd24@mail.gmail.com>
References: <3720.10.0.1.96.1150908419.squirrel@www.di.ubi.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3720.10.0.1.96.1150908419.squirrel@www.di.ubi.pt>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "David Alexandre M. de Carvalho" <david@di.ubi.pt>
Cc: netfilter@lists.netfilter.org

you can try

Conntrack Viewer is a perl script to view the masquerading connections
with kernel 2.4.x, it uses /proc/net/ip_conntrack

With kernel 2.2.x, it was extremely easy to view the masquerading
connections, 'netstat -M' or 'netstat --masquerade' gave you the result
right away.

But since generation 2.4, if you try this you will get: "netstat: no
support for `ip_masquerade' on this system.". With kernel 2.4.x, the
informations regarding the masquerading connections are accesible via
/proc/net/ip_conntrack wich is extremely hard to read.

And here is where Conntrack Viewer become so usefull.

Conntrack viewer is free and protected by the GPL license.


http://cv.intellos.net/conntrack-viewer-1.3/conntrack-viewer.pl

Regards,

Sp0oKeR

On 6/21/06, David Alexandre M. de Carvalho <david@di.ubi.pt> wrote:
> Hi !
> How can I do something equivalent to "ipchains -L -M" ?
> I want to see active masq/nat rules.
> iptables -t nat -L is not enough. I need to see active connections.
> Thanks !
> Best regards
> David
>
>



-- 
=====================
 Rodrigo Ribeiro Montoro
Desenvolvedor BRMAlinux
  spooker@brc.com.br
       RHCE/LPIC-I
=====================

