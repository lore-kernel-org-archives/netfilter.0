From: Casey Scott <casey@phantombsd.org>
Subject: Re: verifying set-mark
Date: Fri, 22 Feb 2008 14:40:59 -0800 (PST)
Message-ID: <19868574.151203720059187.JavaMail.root@tomcat.phantombsd.org>
References: <1203716662.27608.48.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1203716662.27608.48.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matt Zagrabelny <mzagrabe@d.umn.edu>
Cc: Rob Sterenborg <rob@sterenborg.info>, netfilter@vger.kernel.org

Ultimately, I am trying to mark packets for a tc filter. Should I
not be using the iptables set-mark to do that?

Casey

----- "Matt Zagrabelny" <mzagrabe@d.umn.edu> wrote:

> On Fri, 2008-02-22 at 12:53 -0800, Casey Scott wrote:
> > Good suggestion. Tried just tried that. Traffic gets logged, but 
> > the mark is not set. E.g. (from dump)
> > 
> > Feb 22 12:50:52 tomcat kernel: IN= OUT=eth0 SRC=66.93.87.2 
> > DST=192.168.1.7 LEN=1500 TOS=0x00 PREC=0x20 TTL=54 ID=4397 
> > DF PROTO=TCP SPT=80 DPT=4322 WINDOW=17520 RES=0x00 ACK URGP=0
> > 
> > Feb 22 12:50:52 tomcat kernel: IN=eth0 OUT=eth1 SRC=192.168.1.7 
> > DST=66.93.87.2 LEN=40 TOS=0x00 PREC=0x00 TTL=127 ID=18031 DF 
> > PROTO=TCP SPT=4322 DPT=80 WINDOW=64240 RES=0x00 ACK URGP=0
> > 
> > Feb 22 12:50:52 tomcat kernel: IN= OUT=eth0 SRC=66.93.87.2 
> > DST=192.168.1.7 LEN=1500 TOS=0x00 PREC=0x20 TTL=54 ID=4398 
> > DF PROTO=TCP SPT=80 DPT=4322 WINDOW=17520 RES=0x00 ACK URGP=0
> > 
> > 
> > Notice all the TOS is still 0x00. I am setting marks to 3 or 4 
> > depending on traffic type.
> 
> AFAIK, setting TOS is not the same as marking. [goes to check]
> The man page confirms that.
> 
> > Casey
> > 
> > ----- "Rob Sterenborg" <rob@sterenborg.info> wrote:
> > 
> > > > How can I detemine whether or not a iptables set-mark operation
> > > > is working? iptables -t mangle -nvL shows packets matching the
> > > > rules with the set-mark. However, with a tcpdump -vvv -i
> > > > <interface>
> > > > I can not see the mark. I am looking at the tos field, and I
> > > > don't see a tos field matching the marks I am trying to set.
> > > 
> > > Did you try to match the mark in a subsequent rule and LOG the
> packet
> > > when the rule hits?
> > > See also man iptables:
> > > 
> > > mark
> > > This module matches the netfilter mark field associated with a
> packet
> > > (which can be set using the  MARK  target below).
> > > --mark value[/mask] Matches packets with the given unsigned mark
> value
> > > (if a mask is specified, this is logically ANDed with the mask
> before
> > > the comparison).
> > > 
> > > 
> > > Grts,
> > > Rob
> > > 
> > > 
> > > -
> > > To unsubscribe from this list: send the line "unsubscribe
> netfilter"
> > > in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at 
> http://vger.kernel.org/majordomo-info.html
> > -
> > To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> -- 
> Matt Zagrabelny - mzagrabe@d.umn.edu - (218) 726 8844
> University of Minnesota Duluth
> Information Technology Systems & Services
> PGP key 1024D/84E22DA2 2005-11-07
> Fingerprint: 78F9 18B3 EF58 56F5 FC85  C5CA 53E7 887F 84E2 2DA2
> 
> He is not a fool who gives up what he cannot keep to gain what he
> cannot
> lose.
> -Jim Elliot
