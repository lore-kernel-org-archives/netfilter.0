From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: log interpreter , for report ...
Date: Tue, 13 Jan 2004 14:18:11 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401131418.11546.Antony@Soft-Solutions.co.uk>
References: <200401131457.38240.mrakotom@free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200401131457.38240.mrakotom@free.fr>
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

On Tuesday 13 January 2004 1:57 pm, Rakotomandimby Mihamina wrote:

> Hi again ,
>
> 1=B0) This is a line of iptables log
> IN=3Dppp0 OUT=3D MAC=3D SRC=3D80.14.205.152 DST=3D80.15.220.67 LEN=3D48=
 TOS=3D0x00
> PREC=3D0x00 TTL=3D121 ID=3D64444 DF PROTO=3DTCP SPT=3D4717 DPT=3D135 WI=
NDOW=3D16384
> RES=3D0x00 SYN URGP=3D0
>
> How to see what port have been attempted ?

PROTO=3DTCP DPT=3D135

This means TCP, destination port 135.

> 2=B0) Is  fwlogwatch a tool that will help me to make the logs more rea=
dable
> , or a tool that will tell me that something is attempting to @#$=A3 my
> network ?
>
> What i'm looking for is something like this :
> http://www.gege.org/iptables/
> but i dont want to install SQL nor Apache /PHP .

Export your log files to another machine and run SQL / Apache / PHP on th=
at.

> I just want a kind of report of what has been DROPped but in a readable
> format ...
>
> Anyway , the logging format can be read , but it needs training , and i
> have no training .

If you are managing a firewall you will soon learn how to read the logs.

If you want some sort of log analysis tool without installing extra softw=
are=20
on your firewall then export the logs to a machine which you can do the=20
analysis on.

Regards,

Antony.

--=20
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the =
list;
                                                           please don't C=
C me.


