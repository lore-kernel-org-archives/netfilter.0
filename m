From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: multiprimary conntrackd setup
Date: Tue, 24 Jun 2008 18:06:42 +0200
Message-ID: <48611B92.3060200@netfilter.org>
References: <279239c70806170402j47f89251s2379d0909c1bca0e@mail.gmail.com>	 <48590828.2060206@netfilter.org>	 <279239c70806222346r834dd7bpa6e260794237cdba@mail.gmail.com>	 <485F6849.7030606@netfilter.org> <279239c70806230542h1f68765eha99fb21721a9ca6c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <279239c70806230542h1f68765eha99fb21721a9ca6c@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Sebastian Vieira <sebvieira@gmail.com>
Cc: netfilter@vger.kernel.org

Sebastian Vieira wrote:
> On Mon, Jun 23, 2008 at 11:09 AM, Pablo Neira Ayuso <pablo@netfilter.org> wrote:
> 
> First of all, thanks alot for the (quick) response, i appreciate it!
> 
>> As you said, replicating ICMP does not make too much sense to me either.
>>
>> Some considerations on this setup: There's a shortcoming in the
>> asymmetric approach. conntrackd performs much better in a flow-based
>> multiprimary setup.
>>
>> The multipath setup that you're using works fine iif the RTT between the
>> FW cluster and the server peer is greater than the time to send and
>> inject the state change from FW1 to FW2. Otherwise, you'll probably
>> notice a slow down in the connection setup. This condition fulfills if
>> the server peer is in the Internet (DSL RTT is ~30 ms and the
>> synchronization messages barely take 0.01 ms here). This limitation
>> happens due to the asynchronous nature of the solution. The design of
>> conntrackd supports this scenario but flow-based performs much better.
> 
> Right. Is there any way to measure these synchronization times? The
> setup is located on the LAN where even the synchronization messages
> are passing through a switch. Maybe we can overcome this by hooking up
> a crosscable but that depends, i don't know if we have free NIC :)

Actually, the nodes must use a dedicated link, otherwise you risk to
leak state information. And please, elaborate your setup a bit more.

>> Well, I need to know which replication approach you're using. Anyhow,
>> I'll try to do several assumptions from the information that you've posted.
>>
>> Basically, that output means that node1 has try to destroy 7334
>> connections that were not available it its cache. Since you have trimmed
>> the output, I don't know if it's the internal or external cache.
> 
> Both is the output of internal cache. I'll paste it in full below.
> Note that conntrackd was just restarted a couple of minutes ago:
> 
> node1:
> cache internal:
> current active connections:            15200
> connections created:                   28326    failed:            0
> connections updated:                   68477    failed:            0
> connections destroyed:                 13126    failed:            1
> 
> cache external:
> current active connections:              167
> connections created:                     167    failed:            0
> connections updated:                     434    failed:            0
> connections destroyed:                     0    failed:            0
> 
> traffic processed:
>                    0 Bytes                         0 Pckts
> 
> multicast traffic:
>              6735580 Bytes sent                53708 Bytes recv
>                75025 Pckts sent                  596 Pckts recv
>                    0 Error send                    0 Error recv
> 
> multicast sequence tracking:
>                    0 Pckts mfrm                    0 Pckts lost
> 
> 
> node2:
> cache internal:
> current active connections:             1699
> connections created:                    1826    failed:            0
> connections updated:                     636    failed:            0
> connections destroyed:                   127    failed:          804
> 
> cache external:
> current active connections:            11893
> connections created:                   11989    failed:            0
> connections updated:                   68991    failed:            0
> connections destroyed:                    96    failed:            0
> 
> traffic processed:
>                    0 Bytes                         0 Pckts
> 
> multicast traffic:
>                58372 Bytes sent              6810200 Bytes recv
>                  646 Pckts sent                75940 Pckts recv
>                    0 Error send                    0 Error recv
> 
> multicast sequence tracking:
>                    0 Pckts mfrm                    0 Pckts lost
> 
> 
> 
> And for completeness' sake, the conntrackd.conf for both nodes (where
> only IPv4_interface differs) :
> 
> fw02:~# cat /etc/conntrackd/conntrackd.conf
> Sync {
>         Mode NOTRACK {
>                 CommitTimeout 180
>         }

If you're using NOTRACK, the nodes do not seem to be in sync as the
number of internal cache entries in node1 must be equal to node2's in
the external cache. I guess that you've been testing the failover
several times before posting this results. BTW, which HA manager are you
using? The HA manager is required to assist conntrackd as it invokes
several important commands (see the scripts).

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
