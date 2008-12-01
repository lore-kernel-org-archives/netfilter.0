From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: conntrackd reports message before expected seq [was Re: [ANNOUNCE]
 libnetfilter_conntrack 0.0.98 release]
Date: Mon, 01 Dec 2008 20:50:24 +0100
Message-ID: <49344000.5060004@netfilter.org>
References: <49313A4F.6090904@netfilter.org> <20081130094646.GE9523@bla.fasel.org> <20081130100314.GF9523@bla.fasel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20081130100314.GF9523@bla.fasel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Wolfram Schlich <lists@wolfram.schlich.org>

Hi Wolfram,

Wolfram Schlich wrote:
> * Wolfram Schlich <lists@wolfram.schlich.org> [2008-11-30 10:47]:
>> After upgrading to 0.0.98 and restarting conntrackd, I constantly
>> get such messages on the backup firewall, even after restarting
>> conntrackd on both firewalls once again:
>>
>> 2008-11-30 10:40:08 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038103 before expected seq=1228039271
>> 2008-11-30 10:40:09 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038104 before expected seq=1228039271
>> 2008-11-30 10:40:10 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038105 before expected seq=1228039273
>> 2008-11-30 10:40:11 +01:00; hafw2; daemon.warning; conntrack-tools[29154]: Received seq=1228038106 before expected seq=1228039274
>>
>> The numbers look kinda confusing to me.
>>
>> What's wrong? :)
> 
> Interesting... it went away after rebooting both machines at once.

There are two possible reasons for this:

* There is a bug in the hello'ing, actually there was one in 0.9.7 (race 
condition, not that easy to trigger) but it is fixed in 0.9.8. When 
conntrackd starts in one node in ft-fw mode, it sets its hello flag in 
every message until the other node replies with a hello back. This is 
used to reset the sequence tracking. If the node does not see any hello, 
it does not reset its sequence tracking, reporting a similar log message.

* This has happened to me once: You (or your script) has deleted the 
/var/lock/conntrack.lock file of an existing conntrackd instance, then 
you launched conntrackd. At this moment you have two instances of 
conntrackd running in ft-fw mode (but you did not notice), each sending 
messages with their own sequence number. Then, the other point drops the 
messages of one of the instances as they are before the expected 
sequence number.

I think your problem is the second, as the expected sequence is 
increasing (so this means the node is accepting the messages from one 
instance or somewhere else). A bug in the hello'ing (as described in the 
first point) would keep the expected sequence the same.

I'm not sure how to fix a situation in which the lock file is deleted 
accidentally and two instances of conntrackd run at the same time in 
ft-fw mode. Let me think about this, probably the init scripts can check 
this before relaunching conntrackd?

-- 
"Los honestos son inadaptados sociales" -- Les Luthiers
