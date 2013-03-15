From: Jim Mellander <jmellander@lbl.gov>
Subject: Re: Netfilter applied to specific interfaces only
Date: Fri, 15 Mar 2013 10:36:51 -0700
Message-ID: <CADju=b5nayBex9bE8CkYAFWq++r7BrrxdTSC8Ry2_wZnCwu0cQ@mail.gmail.com>
References: <201303102246.48024.neal.p.murphy@alum.wpi.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <201303102246.48024.neal.p.murphy@alum.wpi.edu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: neal.p.murphy@alum.wpi.edu
Cc: netfilter@vger.kernel.org

On Sun, Mar 10, 2013 at 7:46 PM, Neal Murphy <neal.p.murphy@alum.wpi.ed=
u> wrote:
> On Sunday, March 10, 2013 10:34:36 AM Humberto Juc=E1 wrote:
>> Hi,
>>
>> This is an much discussed issue in firewall forums.
>> I need to study a little more about it, but my current opinion:
>>
>> 1. The servers should not do "any filtering" - except in specific
>> cases. They should be placed in a DMZ segment or serverfarm. However=
,
>> the access to these segments is controlled by a firewall (clustered =
or
>> not). So, you can focus on optimizing firewalls.
>
> I humbly disagree. Any server exposed to the internet should be confi=
gured to
> limit inbound and outbound access to exactly that which is needed for=
 it to
> operate. For example, an simple web server should allow only new inco=
ming
> conns to ports HTTP and HTTPS from internet; they should block new ou=
tgoing
> conns (since a simple web server only serves data over existing conns=
).
> Management ports, like ssh, should be limited to the least reasonable=
 set of
> addresses expected. Periodic audits should show if these limits have =
been
> altered. The server is its own first line of defense. The nearest fir=
ewall is
> the second line of defense. The perimeter firewall is the last line o=
f
> defense.
>
> Of course, when talking about multi-Gbps links, one needs to install =
hardware
> that can handle filtering that much data. If the OP has all his inter=
-LAN
> traffic passing through a firewall, I might suggest his firewall is u=
nder-
> powered, or might suggest his network topology should be reviewed. If=
 no
> topology changes are possible, then the only recourse is to install a=
 firewall
> that *can* handle filtering that much data.
> --

Thanks for all the insightful comments - we will check out xt2.  In
the meantime, we employ tcpwrappers, application access control, etc.
(as well as an advanced IDS: Bro).

A firewall is not appropriate for our environment, at least for the
big iron systems which service a worldwide diverse community, for a
number of reasons:

1. A 100Gps pipe restricts/eliminates firewall choices
2. User community, running a wide range of standard codes, and
homegrown protocols create an impossible task of firewall maintenance
anyway, except for standard ports <1024 & well known high ports that
are used.
3. Basic cutting edge network research occurring - firewalls often
subtly modify the packets (packet reassembly, etc.) and certainly
introduce unacceptable latency.

We certainly believe in the 'belt-and-suspenders' approach to
security, with router ACLs, tcpwrappers, and (in testing) libunaccept
in our arsenal.  It is unfortunate that iptables can't be a part of
this mix (at least for the big iron systems, and our IDS's), but we
look forward to testing xt2 for our purposes.

The NERSC environment is fairly unique, so our solutions are similarly
unique and innovative.

Thanks all,

Jim Mellander
NERSC Cybersecurity
