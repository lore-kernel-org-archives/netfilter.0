From: richardo@start-global.com
Subject: Re: droping in forward/postrouting
Date: Fri, 30 Jul 2004 09:15:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF6B793C47.2027DD5E-ON80256EE1.002BA1B6@start-global.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: Askar Ali Khan <askarali@gmail.com>
Cc: netfilter@lists.netfilter.org


HI Askar,

This seems a little odd, as the rules below should be dropping the packets
destined for the ip's that are listed. Are these rules being run on a
seperate firewall machine to the machines that you are trying to block ? ie
are the packets to be dropped being generated on the machine that is doing
the filtering ?


Regards,
Richard.

Richard Oatridge
Head of IT, Start-global Ltd
http://www.start-global.com
tel :  +44 1564 779297
email : richardo@start-global.com


|--------+----------------------->
|        |          Askar Ali    |
|        |          Khan         |
|        |          <askarali@gma|
|        |          il.com>      |
|        |                       |
|        |          30/07/2004   |
|        |          07:15        |
|        |                       |
|--------+----------------------->
  >-------------------------------------------------------------------------------------------------------------------------|
  |                                                                                                                         |
  |       To:     "richardo@start-global.com" <richardo@start-global.com>                                                   |
  |       cc:     netfilter <netfilter@lists.netfilter.org>                                                                 |
  |       Subject:     Re: droping in forward/postrouting                                                                   |
  >-------------------------------------------------------------------------------------------------------------------------|




hi
I duno but filter table "FORWARD" not blocking/dropping any of these
site actaully these are spywares a gift from windowz and why i want to
drop these dirty shits coz they consume lot of my precious bandwidth
"dialup" ;)

iptables -I FORWARD -s 0/0 -d 66.35.229.0/24 -j DROP
iptables -I FORWARD -s 0/0 -d  212.4.208.105 -j DROP
iptables -I FORWARD -s 0/0 -d 66.35.229.185 -j DROP
iptables -I FORWARD -s 0/0 -d  64.152.73.0/24 -j DROP
iptables -I FORWARD -s 0/0 -d  66.35.229.236 -j DROP

However PREROUTING do working and dropping it :)

iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.0/24 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  212.4.208.105 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d 66.35.229.185 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  64.152.73.0/24 -j DROP
iptables -t nat -I PREROUTING -s 0/0 -d  66.35.229.236 -j DROP

Therefore my confusion still exists, as rule is that to filter in
fiter table and other things NATting , mangling in nat and mangle
table respectively.

Then why FOWARD not blocking these sites and nat PREROUTING does?

Im in learning stages of netfilter thing, and I will greatly
appreciate if someone clear this to me :)

regards
Askar

On Fri, 30 Jul 2004 02:08:46 +0600, Askar Ali Khan <askarali@gmail.com>
wrote:
> Hi Richard
>
> Thanks for the reply :) yeah now its clear to me filtering rules must
> go into filter table and other such NATting or mangling in NAT and
> Mangle table respectively.
>
> Regards
> Askar
>
>
>
> On Thu, 29 Jul 2004 16:54:47 +0100, richardo@start-global.com
> <richardo@start-global.com> wrote:
> >
> > hi Askar,
> >
> > This is a filtering rule, and so, in my opinion, this should be in the
> > filter table, ie FORWARD.
> >
> > Regards,
> > Richard.
> >
> > Richard Oatridge
> > Head of IT, Start-global Ltd
> > http://www.start-global.com
> > tel :  +44 1564 779297
> > email : richardo@start-global.com
> >
> > |--------+----------------------------------->
> > |        |          Askar Ali Khan           |
> > |        |          <askarali@gmail.com>     |
> > |        |          Sent by:                 |
> > |        |          netfilter-admin@lists.net|
> > |        |          filter.org               |
> > |        |                                   |
> > |        |                                   |
> > |        |          29/07/2004 11:19         |
> > |        |                                   |
> > |--------+----------------------------------->
> >   >
-------------------------------------------------------------------------------------------------------------------------|

> >   |
|
> >   |       To:     netfilter <netfilter@lists.netfilter.org>
|
> >   |       cc:
|
> >   |       Subject:     droping in forward/postrouting
|
> >   >
-------------------------------------------------------------------------------------------------------------------------|

> >
> >
> >
> >
> > hi all
> >
> > Im afraid i am again with a very simple/stupid question :), even
> > though things not clear to me yet.
> >
> > im droping/blocking certain sites mainly gator sites on my
> > router/firewall to LAN users, using slackware kernel 2.4.26.
> >
> > im doing this with the below rule
> > $iptables -t nat -A POSTROUTING -s 0/0 -d  212.4.208.105 -j DROP
> >    This is working fine, however im kinda confuse whether this is the
> > proper table/chain for accomplished this or may I do it with FORWARD
> > chain like ...
> >
> >   $iptables -A FORWARD -s 0/0 -d 212.4.208.105 -p tcp -j DROP
> >
> > which approach is recommended ?
> > 1)nat/POSTROUTING
> > OR
> > 2) FORWARD
> >
> > thanks in advance
> >
> > regards
> > Askar
> >
> >
>





