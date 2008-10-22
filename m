From: "Joey" <Joey@Web56.net>
Subject: RE: iptables-save ?
Date: Wed, 22 Oct 2008 09:56:02 -0400
Message-ID: <003401c9344d$eba9f500$c2fddf00$@net>
References: <002f01c93421$227ad450$67707cf0$@net> <003001c93449$cf7d1d70$6e775850$@net> <op.ujfhknzmrtqp7s@chiyo.azt>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <op.ujfhknzmrtqp7s@chiyo.azt>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: IPTables <netfilter@vger.kernel.org>

> -----Original Message-----
> From: Eljas Alakulppi [mailto:Buzer@buzer.net]
> Sent: Wednesday, October 22, 2008 9:40 AM
> To: Joey; IPTables
> Subject: Re: iptables-save ?
> 
> First is the packets matched by this rule, second is bytes matched by this
> rule. In user-defined chains counters are always zero (of course, if the
> packet is matched by some of the rules, that rule's counter is updated).
> 
> -Eljas Alakulppi
> 

Hi Eljas,

So since I am generating this file through my own code should I put 
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]



> On Wed, 22 Oct 2008 16:26:37 +0300, Joey <Joey@web56.net> wrote:
> 
> > What significance do the numbers between the brackets have?
> >
> > print ":INPUT ACCEPT [6180932:1244590784]\n";
> > print ":OUTPUT ACCEPT [6574901:1313953477]\n";
> >
> > I got those from executing a iptables-save so I can see what format I
> > needed
> > to match in generating my own save file from our IP DB.
> >
> >
> > Thanks!
> >
> > Joey
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html

