From: "Jonathan Villa" <jvilla@e37.net>
Subject: Re: allow range syntax - perplexed
Date: Tue, 15 Jun 2004 15:40:46 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <2051.64.2.245.108.1087332046.squirrel@64.2.245.108>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
    <200406151952.48641.Antony@Soft-Solutions.co.uk>
    <1921.64.2.245.108.1087327479.squirrel@64.2.245.108>
    <200406152055.30204.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406152055.30204.Antony@Soft-Solutions.co.uk>
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
To: netfilter <netfilter@lists.netfilter.org>

> On Tuesday 15 June 2004 8:24 pm, Jonathan Villa wrote:
>
>> > The output from "iptables -L -nvx" would be useful, as it shows us t=
he
>> > rules
>> > in the correct order, which interfaces they apply to, and the packet=
 /
>> > byte
>> > counts so we can see how many times particular rules have been
>> matched.
>>
>> here is the output for iptables -L -nvx. I've also attached a txt file
>> in
>> case you want to see a cleaner output
>
> Nice.   The .txt file was much easier to read :)
>
> The first thing I notice about the ruleset you have posted is that none=
 of
> the
> rules which included your network range matched any packets at all.

My serious bad!!!!  I am so overworked that I was staring at the ip
addresses and never realized that I was using xx1. rather than xx3 which
is the correct one.  It now works as expected.

>
> Therefore that doesn't tell us much about what source address/es the
> packets
> you are having problems with are coming from.
>
> Maybe the timing was just unfortunate, but I can't see any TCP port 330=
6
> packets at all.   Therefore I think a LOG rule would be a good idea, to
> try
> and track down where the packets are coming from, which your
> carefully-crafted -s xxx.xxx.xx.0/24 rules aren't apparently matching.
>
> Try something like the following:
>
> iptables -A INPUT -p tcp --dport 3306 -j LOG
thanks, this will help

>
> The -A will ensure that the rule comes after all your other rules (whic=
h
> are
> supposed to ACCEPT the packets one way or another).   However, I notice
> you
> have a default ACCEPT policy (ugh)

I agree.  When I planned the rules, it was set to DROP however with the
"issue" I was having, I changed it.

and a final rule which DROPs all
> non-loopback packets.   I suggest you change this to a default DROP pol=
icy
> and a final rule which ACCEPTs all the loopback packets.   Then the rul=
e
> above will become the final rule in your chain, guaranteeing that you L=
OG
> any
> packets destined for MySQL just before they get (unfortunately) DROPped=
.
>

One quick question regarding logging.  Where does it get logged to?  I
check  /var/log/messages and see lots of traffic being logged at a rapid
rate.  I've read that syslog takes care logging, but I would prefer to
have a separate log.

Again, my original issue was a silly mistake.  Sorry for wasting anyone's
time.


