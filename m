From: "Joey" <Joey@Web56.net>
Subject: RE: tool to search within cidr blocks
Date: Thu, 23 Oct 2008 20:38:20 -0400
Message-ID: <006901c93570$d080a1b0$7181e510$@net>
References: <004301c9347c$6ab0a3c0$4011eb40$@net> <48FFB233.1070706@riverviewtech.net> <006801c93551$1d93fa30$58bbee90$@net> <op.ujhwj8rhrtqp7s@chiyo.azt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.ujhwj8rhrtqp7s@chiyo.azt>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

Eljas, 
Great catch I totally missed that in my code that builds the save file.
That has been corrected.
http://web56.net/iptables-save.cfg

this is the result of iptables-save http://web56.net/iptables-save-output
Thanks!



> -----Original Message-----
> From: Eljas Alakulppi [mailto:Buzer@buzer.net]
> Sent: Thursday, October 23, 2008 4:59 PM
> To: Joey; IPTables
> Subject: Re: tool to search within cidr blocks
> 
> As a first note, all of your -A LOG_* rules are for ASIA only. For
example:
> 
> :LOG_IISG - [0:0]
> :CIDR-IISG - [0:0]
> -A SMTP_TRAFFIC -j CIDR-IISG
> -A LOG_ASIAN -j LOG --log-prefix "SPAM-BLOCK-CIDR-IISG"
> -A LOG_ASIAN -j DROP
> -A CIDR-IISG -s 137.39.110.153 -j LOG_IISG
> 
> They should change depending on the rule, in this case it should be
> LOG_IISG
> 
> Now, this does not explain why anything would ever generate
> SPAM-BLOCK-CIDR-TURKEY message as your LOG_TURKEY should be empty. Could
> you run
> iptables -L LOG_ASIAN -v -n
> iptables -L LOG_TURKEY -v -n
> before fixing the logging issue and also after applying the fix?
> 
> Could you paste iptables-save output just in case?
> 
> -Eljas Alakulppi
> 
> On Thu, 23 Oct 2008 23:51:26 +0300, Joey <Joey@web56.net> wrote:
> 
> >> -----Original Message-----
> >> From: netfilter-owner@vger.kernel.org
> > [mailto:netfilter-owner@vger.kernel.org]
> >> On Behalf Of Grant Taylor
> >> Sent: Wednesday, October 22, 2008 7:08 PM
> >> To: Mail List - Netfilter
> >> Subject: Re: tool to search within cidr blocks
> >>
> >> On 10/22/2008 2:28 PM, Joey wrote:
> >> > I have several ranges of IP's being put into iptables.
> >> > The IP ranges look like this:
> >> > 62.29.0.0/17
> >> > 62.68.192.0/19
> >> > 78.40.224.0/21
> >> > 78.111.96.0/20
> >> > 78.135.0.0/17
> >> >
> >> > I am blocking a specific IP from the firewall as logged in messages
> >> > 71.74.56.125.
> >> > In looking at each block of ip's and using a CIDR calculator I can't
> > figure
> >> > out what range it's really coming from.  The list I have is pretty
> >> huge.
> >> > Is there a tool or a way to ask iptables what rule it matches?  Based
> >> on
> > all
> >> > my calculations I don't have anything declared that would block that
> >> IP.
> >> >
> >> > Thanks!
> >>
> >> Um, 71.74.56.125 is not part of any of the Class A ranges that you are
> >> blocking (62., 77., 78.).  So... that sort of implies that something
> >> else is blocking it.
> >>
> >> Do you care to provide the (sanitized) output of an 'iptables-save' for
> >> us to look at?
> >>
> >>
> > OK, I have unloaded, flushed, reloaded, regenerated my ip lists and I
> > can't
> > find why we are blocking the IP number.
> >
> > Here are the block messages:
> > Oct 22 01:27:16 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.122
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=46 ID=45805 PROTO=TCP
> > SPT=40388 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:27:30 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.122
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=46 ID=45806 PROTO=TCP
> > SPT=40388 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:27:57 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.123
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=47 ID=45807 PROTO=TCP
> > SPT=40388 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:34:09 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.125
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=43 ID=35071 PROTO=TCP
> > SPT=46522 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:34:12 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.125
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=43 ID=35072 PROTO=TCP
> > SPT=46522 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:34:19 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.125
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=43 ID=35073 PROTO=TCP
> > SPT=46522 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:34:32 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.124
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=42 ID=35074 PROTO=TCP
> > SPT=46522 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> > Oct 22 01:34:59 pluto kernel: SPAM-BLOCK-CIDR-TURKEYIN=eth0 OUT=
> > MAC=00:0e:0c:67:16:a2:00:e0:1e:cd:e1:23:08:00 SRC=71.74.56.125
> > DST=218.144.124.7 LEN=64 TOS=0x00 PREC=0x00 TTL=43 ID=35075 PROTO=TCP
> > SPT=46522 DPT=25 WINDOW=32850 RES=0x00 SYN URGP=0
> >
> > Here is the list of IP numbers in an iptables-save format, we build this
> > from our ip numbers lists merging into this which then gets loaded at
> > each
> > respective server.
> >
> > http://web56.net/iptables-save.cfg
> >
> >
> > Any ideas?  This is crazy.
> >
> > Thanks!
> >
> > Joey
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> 
> 
> --
> Using Opera's revolutionary e-mail client: http://www.opera.com/mail/

