From: Stefan Majer <stefan.majer@gmail.com>
Subject: Re: conntrackd high cpu usage
Date: Mon, 16 Jan 2012 20:53:23 +0100
Message-ID: <CADdPHGvZFsZa1hzwAsxFuvYr7dX=ATq64_Z2hF4zQNuUUB0pNQ@mail.gmail.com>
References: <CADdPHGu4WFrVantzmr6rn6jvPkoxmxPMdOrPzSkRYKMbbtZWKQ@mail.gmail.com>
	<20120116112807.GA11934@1984>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=M5ZEtL8YcpwCv1tNvsO7yWo7AvcZpQcRcBxHHg1r5yU=;
        b=eUeW7m9oQV4u5TGLCpy9Vf81CMchScS7POOsODaEG//d1L70w2Kl1UsWJdze7qaaFR
         KeMkl//+fsnwepIeY2JiqK/NuPg4IJlj9sgPzstJzLkIh6GMbxgEYBNegF7SzNNTI03O
         4Ikyb7S6HN4gvk4yLDqBkbr285/BHbIevwmIg=
In-Reply-To: <20120116112807.GA11934@1984>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

Hi Pablo,



On Mon, Jan 16, 2012 at 12:28 PM, Pablo Neira Ayuso <pablo@netfilter.or=
g> wrote:
> Hi Stefan,
>
> On Mon, Jan 09, 2012 at 07:49:55PM +0100, Stefan Majer wrote:
>> Hi,
>>
>> we have 2 8core Xeon Boxes with 2 Intel X520 10GBit Adapter running
>> rhel 6.1 as redundant firewall.
>
> Interesting setup. So far, the reports of conntrackd usage that
> I've received are deployments with 1GBit NICs and smaller machines
> (up to 2-4 cores).
>
>> On every node we have conntrackd installed with a FTFW mode, we
>> synchronize all states.
>> Synchronization is made over multicast on a dedicated vlan interface=
=2E
>> The Firewall itself actually have around 300 vlans active.
>>
>> Actually we see permanent ~400 new connections/sec with peaks at 800
>> conn/sec.
>
> I've been abled to reach up to 20000 sessions/sec with 6 years old
> hardward (dual core, 2.4GHz, 1Gbit links). I know people that
> got better results in more modern hardware.

This would be sufficient for our use case but...

>
> You may want to enable the reliable synchronization option in
> conntrackd. With it, conntrackd starts dropping packets if the
> synchronization does not happen timely.

This is probably not what we want as this prevent a working state on
the secondary machine at any time right ?

>> With this load the conntrackd consumes about 15 - 25 % CPU from one
>> CPU on the active side and about 5% CPU usage on the passive side.
>> Is this expected ?
>
> What tool are you using to obtain those measurements?

This was actually with measured with top.

> top is fine for estimated load, but it's inaccurate.
>
> Still, full state synchronization is a resource consuming task

Is it possible to reduce the synchronization of specifc state events
to ESTABLISHED, and NEW for example
without loosing a working state on the secondary side ?

>
>> This is our Testing environment, and we expect much higher (~10 - 20
>> times) connection rates.
>>
>> This would not be possible with the current setup, as this would be
>> cpu bound on the conntrackd, as this daemon is single threaded.
>> Is there any way to make this process faster, eg. make the
>> synchronization multi threaded ?
>
> There several things that we can do to improve conntrackd performance
> (from the development side):
>
> 1) port conntrackd to libmnl to use recvmmsg system call.
> 2) implement netlink multi-queue, we discussed this during the
> NFWS2010. The idea is to implement something similar to the existing
> nfqueue multiqueue load balancing (see --queue-balance in iptables's
> NFQUEUE). It's similar to multi-threading that you're proposing.
> 3) implement batching for the commit operation.
>
> So far, nobody has come to show interest on these tasks. Recent
> enhancements for conntrackd have focused on adding new features.

This sounds all great but i have no idea how much this would increase
performance.
We will first try to measure our current environment how many conn/sec
we are able to synchronize.


>> I already did some perf analysis, but they didnt gave us much light.
>
> What tools are you using?

we were using perf record, see man 1 perf.

>
> I suggest you to have a look at Willy Tarreau's tool (httpterm). You
> may want to use my http client instead of inject32.
>
> http://1984.lsi.us.es/git/http-client-benchmark/

I will check both, but yours wont compile with:

make
gcc -g -c alarm.c -o alarm.o
gcc -g -c client.c -o client.o
client.c: In function =91print_alarm_cb=92:
client.c:335:3: warning: format =91%llu=92 expects argument of type =91=
long
long unsigned int=92, but argument 5 has type =91uint64_t=92 [-Wformat]
client.c:335:3: warning: format =91%u=92 expects argument of type
=91unsigned int=92, but argument 10 has type =91__time_t=92 [-Wformat]
client.c:335:3: warning: format =91%u=92 expects argument of type
=91unsigned int=92, but argument 11 has type =91__suseconds_t=92 [-Wfor=
mat]
client.c: In function =91main=92:
client.c:404:5: error: variable-sized object may not be initialized
make: *** [all] Error 1


Greetings
--=20
Stefan Majer
