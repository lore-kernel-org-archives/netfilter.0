From: John Lister <john.lister@kickstone.co.uk>
Subject: Re: Help with packet marking
Date: Thu, 29 Mar 2012 17:12:59 +0100
Message-ID: <4F748A0B.1040506@kickstone.co.uk>
References: <4F74194E.9030608@kickstone.co.uk> <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CACuyg262eXScuo6aLusyOScU4NEo7PEjbUqEOX_G0E-gaKS=XQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: =?ISO-8859-1?Q?Humberto_Juc=E1?= <betolj@gmail.com>
Cc: netfilter@vger.kernel.org

On 29/03/2012 15:55, Humberto Juc=E1 wrote:
> 2012/3/29 John Lister<john.lister@kickstone.co.uk>:
>> It seems to be selecting the correct route using the marks as iptabl=
es
>> reports the correct interface in the log files.
>> However the packet then goes out of a different interface.
> Show us all firewall and routing rules (at least the main)...
>     iptables -t mangle -nL -v
>     ip rule ls
I'm out of the office at the minute but will extract them later today.
>> This has always worked before, the default route is in the main tabl=
e (maybe
>> not clear before) and is used so that
>> the box can route local packets out. Your example (below) would do t=
he same
>> except skip the fwmark rules
> Not exactly. In my example, to skip the fwmark process the destinatio=
n
> address must be known by the main table. And you dont need to treat
> your essential routes in alternative tables (only default gw). For
> this reason,  you couldnt use a default gw in main table (*my
> example*).
Ok, misread that and still had a default in main in my head. Makes sens=
e now
> But, i still not sure why your setup has stopped working.
Neither do I? The only thing I can think of is a new kernel=20
inadvertently installed by a colleague but without doing a reboot. As i=
t=20
all worked fine until it was rebooted (to physically move it). Also,=20
oddly before I left last night, it was occasionally connecting  when=20
doing some tests
>
>> Yes, sorry when doing the example missed off the -m state --state NE=
W bit...
>> I still find it strange that recently packets I'd expect to be in th=
e NEW
>> state are ESTABLISHED. eg doing
>> ping blah
>> ping blah
>> results in the first outgoing packet being NEW, but the second ping =
is
>> ESTABLISHED, surely this is a bug?
> Why you need to work with connection STATEs in firewall MARKs?
I guess I don't need to, I wanted to only mark new connections and the=20
use save-mark and restore-mark to mark further packets. The plan is tha=
t=20
each new connection is marked using the statisic module and routed base=
d=20
on the mark.

It still seems like a bug that subsequent independent connections are=20
labelled as ESTABLISHED?
> Tell me more about your configuration.
> I can check your firewall confs if you open your ssh access for me
> (send me account in pvt - if you like).
I may well do if I can't sort it quickly

--=20
www.pricegoblin.co.uk

