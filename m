From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Public IP to Private IP
Date: Sun, 02 Feb 2014 16:45:15 +0100
Message-ID: <52EE680B.6090407@plouf.fr.eu.org>
References: <CAFPGR9jhpurA644xdfWc6dF58iVCc5t7mbUw6NsjxPqYQxtUHw@mail.gmail.com>	<CALFTrnO7SAm0ghr7b1p+o9cWnbwtRJQMtSmtJy_VXJxd-xxkcw@mail.gmail.com> <CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAFPGR9guTGspBJ8yfOVNZAAMy44YGS+UeV+QmYNLpAJ+ZxTuxw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Scott Mayo <scotgmayo@gmail.com>
Cc: Ray Soucy <rps@maine.edu>, netfilter list <netfilter@vger.kernel.org>

Hello,

Scott Mayo a =E9crit :
> On Mon, Jan 27, 2014 at 2:48 PM, Ray Soucy <rps@maine.edu> wrote:
>> The term you're looking for is "NAT reflection" or "hairpin NAT".
>>
>> If you're not running split DNS, then trying to reach a system via i=
ts
>> "outside" IP from an internal system will present a problem because
>> the source IP of the request is seen as on-link by the server, so th=
e
>> server responds directly from an unexpected source IP and the
>> requesting host drops the request.
>>
>> You can get around this issue by NATing the return traffic when its =
to
>> and from the internal network.
>>
>> Assuming that your inside interface is eth1, and your inside IP
>> network is 192.168.0.0/23:
>>
>> iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 =
-j
>> MASQUERADE

Instead of masquerading I would suggest to 1:1 map the source addresses
to a different (unused) private subnet, so that the source address seen
by the final server can be mapped back to the real source address.

E.g. :
iptables -A POSTROUTING -s 192.168.0.0/23 -d 192.168.0.0/23 -o eth1 \
  -j NETMAP --to 192.168.8.0/23

> That did not seem to work either.  Getting the same results.  Thanks.

Also make sure that "reflected" packets from eth1 to eth1 (replace with
the real internal interface name) in the FORWARD chain are ACCEPTed.
