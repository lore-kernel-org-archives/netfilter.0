From: Askar Ali Khan <askarali@gmail.com>
Subject: Re: droping in forward/postrouting
Date: Fri, 30 Jul 2004 11:15:57 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504072923151d18afa3@mail.gmail.com>
References: <OF314C1F3E.9AD1008B-ON80256EE0.005745C8@start-global.com> <a0f69e504072913084fc39ee8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <a0f69e504072913084fc39ee8@mail.gmail.com>
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
To: "richardo@start-global.com" <richardo@start-global.com>
Cc: netfilter <netfilter@lists.netfilter.org>

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

On Fri, 30 Jul 2004 02:08:46 +0600, Askar Ali Khan <askarali@gmail.com> wrote:
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
> >   >-------------------------------------------------------------------------------------------------------------------------|
> >   |                                                                                                                         |
> >   |       To:     netfilter <netfilter@lists.netfilter.org>                                                                 |
> >   |       cc:                                                                                                               |
> >   |       Subject:     droping in forward/postrouting                                                                       |
> >   >-------------------------------------------------------------------------------------------------------------------------|
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

