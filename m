From: Data Shock <datashock@hotmail.com>
Subject: RE: iptables - Trying to understand "no longer support implicit
 source local NAT"
Date: Mon, 6 Apr 2009 18:30:37 -0400
Message-ID: <BLU149-W217A490D4492B6FD80862BA3840@phx.gbl>
References: <BLU149-W20F12BA9B98E9D4E82C7CBA3960@phx.gbl>
 <49C2A535.1040700@kis.keele.ac.uk>
    <BLU149-W849B5068E4BA2E436CB5E8A3960@phx.gbl>
   <BLU149-W19F71A94268C5665748337A3910@phx.gbl>
  <BLU149-W50503F474EE1377D0A838A3840@phx.gbl>
 <BLU149-W698B4E09B730ADF7B6660A3840@phx.gbl> <49DA7962.6050600@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DA7962.6050600@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org


Hot diggity!  Thanks Mart.

This seems to be the solution.

I replaced the nat rule:

-A sendtolocal -d 10.1.2.3 -j DNAT --to-destination 127.0.0.1


with:

-A sendtolocal -d 10.1.2.3 -j REDIRECT


and that did it.  WooHoo!  It seems so simple now.  Why didn't I find t=
hat? :)

I'll experiment some more with this approach and then try it with our l=
ive system.  I'll report back with the final verdict.


=46YI:  I tried this on an older Linux box too (with iptables v1.2.8) a=
nd found that it automatically SNATed the packet to 127.0.0.1.  However=
 on my newer box (with iptables v1.3.5), it didn't SNAT the packet.  It=
s source remained the external interface of the box.  Interesting...


Thanks,

-Frank


>
> I'm not 100% sure, but maybe the REDIRECT target is of use for that
> particular case:
>
> from `man iptables':
>
> REDIRECT
> This target is only valid in the nat table, in the
> PREROUTING and OUTPUT chains, and user-defined chains which are only
> called from those chains. It
> redirects the packet to the machine itself by changing the
> destination IP to the primary address of the incoming interface
> (locally-generated packets are
> mapped to the 127.0.0.1 address). It takes one option:
>
> --to-ports port[-port]
> This specifies a destination port or range of ports to
> use: without this, the destination port is never altered. This is onl=
y
> valid if the rule
> also specifies -p tcp or -p udp.
>
>
> Greets
>
> Mart


_________________________________________________________________
Rediscover Hotmail=AE: Get quick friend updates right in your inbox.=20
http://windowslive.com/RediscoverHotmail?ocid=3DTXT_TAGLM_WL_HM_Redisco=
ver_Updates1_042009