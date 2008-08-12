From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrackd working, but netfilter not impressed
Date: Tue, 12 Aug 2008 13:40:18 +0200
Message-ID: <48A176A2.6000301@netfilter.org>
References: <BD9F23BEBBF883939AE367D6@Dirks-MacBook-Pro.local> <200808111322.58469.misch@multinet.de> <0F0E3430135185A207EFA41A@Dirks-MacBook-Pro.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <0F0E3430135185A207EFA41A@Dirks-MacBook-Pro.local>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Dirk H. Schulz" <dirk.schulz@kinzesberg.de>
Cc: netfilter@vger.kernel.org

Dirk H. Schulz wrote:
> <misch@multinet.de> wrote:
>> Did you conntrackd tell to import sync'ed tables into the kernel tables?
>> Scripts see:
>> /usr/share/doc/examples/sync/ftfw/script_master.sh
> 
> That is what I missed. I have looked into the example script now - it
> looks like committing the external cache into the kernel tables is
> something to do manually?!?

No. The scripts are there for for the primary-backup or multi-primary
with flow persistency, ie. when we can guarantee that the same firewall
handles the same subset of flows at any time - symmetric routing.

> That means in an active-active setup like mine I would have to commit
> every second - which of course can be done, but does that make sense? I
> would have expected conntrackd to do it automatically or to have an
> option that makes it do it automatically.

The CacheWriteThrough clause should do that for you but with some
important considerations: higher CPU consumption and possible race
conditions - the time to transmit the state to the other firewall
replica should be smaller than the RTT between the firewall and the
end-peer. This is generally true if your firewall is connected to a DSL
line or whatever that inherently inserts some latency in the communications.

Anyhow, the multi-primary setup with asynchronous routing is really bad
design for stateful firewalls. The key problem is that stateful
firewalling works with at flow-level and OSPF only knows about packets.
The preferred way to go should be the multi-primary with symmetric
routing or simply use primary-backup instead if you cannot guarantee the
previous statement.

I'm finishing some documentation for the upcoming release that should
stop this confusion, that will be out soon.

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
