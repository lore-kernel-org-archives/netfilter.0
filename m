From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: randomly changing IPs from different subnets (Google Mail)
Date: Wed, 23 Jun 2010 11:33:55 +0200
Message-ID: <4C21D503.9040505@chello.at>
References: <B993B335-596D-48D3-9767-F3565C3B1112@gmail.com> <alpine.LSU.2.01.1006222018140.31071@obet.zrqbmnf.qr> <6BE62F49-0B12-4DCB-A421-7D90BDFF0615@gmail.com> <4C210C24.9050605@gmail.com> <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <DC83A9D5-A181-42B0-9FED-13EB46F2D24A@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 23.06.2010 10:53, Florian Effenberger wrote:

>
> Am 22.06.2010 um 21:16 schrieb Lars Nooden:
> >
>> The chain is a drop-through list of ip addresses that you have decided are good.  Then make a rule or pair of rules to send tcp traffic for port 993 and port 537 to that user-defined chain.
>
> If I run a script every 60 seconds per cron and add the hostname, it will automatically add all IPs returned by the DNS at that time. However, this changes randomly, and change time is not predictable.
>
> If I add ten times the host and it resolves to the same IP, iptables doesn't recognize that, and I have 10 similar rules. Is there any check for duplicates possible?
>
> If not, how many entries can the table have before it gets sluggish and slow? If I add two rules every 60 seconds, that would make 120 per hour, 2880 per day. Is that too much, do I need to purge them before? I have no experience with large filtering tables...
>
> Florian--


ipset
http://ipset.netfilter.org/

is the answer to that problem, if you insist on doing it with iptables.
all your cron job would have to do is to (pseudo code):

ipset --list gmailset

diff newlist oldlist

ipset --add new_entries
ipset --del dead_IPs


you might have to tinker with your kernel before.

best regards


Mart
