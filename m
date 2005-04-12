From: "Wennie V. Lagmay" <wlagmay@yanbulink.net>
Subject: Re: msn and yahoo messenger voice chat
Date: Tue, 12 Apr 2005 15:27:21 +0300
Message-ID: <000501c53f60$a8e81700$dc0aa8c0@winntpro>
References: <002a01c53ccd$9fd13f60$6e5577d4@winntpro>
	<20050411221940.GA23947@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

Thank you Jason, I just want to confirm is it to be writen

like this alone:
iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
xxx.xxx.85.113-xxx.xxx.85.115

or the original SNAT plus SAME like this :
IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j SNAT --to-source
xxx.xxx.85.113-xxx.xxx.85.115
iptables -t nat -A POSTROUTING -s 192.169.10.0/24  -j SAME --to
xxx.xxx.85.113-xxx.xxx.85.115

wennie

----- Original Message -----
From: "Jason Opperisano" <opie@817west.com>
To: <netfilter@lists.netfilter.org>
Sent: Tuesday, April 12, 2005 1:19 AM
Subject: Re: msn and yahoo messenger voice chat


> On Sat, Apr 09, 2005 at 09:30:29AM +0300, Wennie V. Lagmay wrote:
> > Hi all,
> >
> > Below are the config I tested and results:
> >
> > 1. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j
SNAT --to-source
> > xxx.xxx.85.113-xxx.xxx.85.115
> > 2. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -d
> > xxx.xxx.85.113 -j MASQUERADE
> > 3. IPTABLES -A POSTROUTING -s 192.169.10.0/255.255.255.0 -j MASQUERADE
> >
> > config 1, everything is working fine except  msn and yahoo messenger
voice
> > chat.
> > config 2, everything is working fine except  msn and yahoo messenger
voice
> > chat.
> > config 3, everything is working fine including msn and yahoo messenger
voice
> > chat, the only problem is that this configuration is not fitted to our
> > setup. Can anybody have an idea on using config 1 and 2 with msn and
yahoo
> > messenger voice chat enable? or do you have any solution enabling
similar to
> > config 1 with all features enable?
>
> use the SAME target from PoM to tell iptables to use the same SNAT IP
> for subsequent connections between the same src and dst IP:
>
>   iptables -t nat -A POSTROUTING -s 192.169.10.0/24 \
>     -j SAME --to xxx.xxx.85.113-xxx.xxx.85.115
>
> -j
>
> --
> "Peter: You wanna talk about awkward moments? Once, during sex,
>  I called Lois "Frank". Your move, Sherlock."
>         --Family Guy
>
>



