From: "Samuel Jean" <sjean@cookinglinux.org>
Subject: Re: best way of knowning what matches and targets are available
Date: Thu, 29 Jul 2004 08:31:55 -0400 (EDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3197.216.239.71.162.1091104315.squirrel@216.239.71.162>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

Hi Victor.

 Victor wrote:
>I have found /proc/net/ip_tables_matches and /proc/net/targets. Is readi=
ng
>those 'files' the way to go? Can i be sure that if a match is listed
>in /proc/net/ip_tables_matches i can really use it?

Sure you can, except for 'ERROR' (which is spaced from other targets).
All targets/tables/matches register against iptables at load time and,
built-in or modules, those are listed in
/proc/net/ip_tables_{matches,targets,names}

As far as I know, this is the best way to do it.

>Regards,
>Victor

Cheers,

--=20
Samuel Jean
SysAdmin & NetAdmin
at cookinglinux.org


