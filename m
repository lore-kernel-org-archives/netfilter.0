From: "Josh Berry" <josh.berry@linknet-solutions.com>
Subject: RE: Time changes
Date: Thu, 23 Oct 2003 10:09:35 -0500 (CDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <12771.204.214.145.6.1066921775.squirrel@mail.linknet-solutions.com>
References: <9FEBBE3B5C27D311B0B90050041E59B00439EFAF@ziggy.prideindustries.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9FEBBE3B5C27D311B0B90050041E59B00439EFAF@ziggy.prideindustries.com>
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
To: netfilter@lists.netfilter.org

You could also use the IPTables time patch instead of using a crontabs
entry that enables and disables the rule at specific times.


> Just a side note, if the kid isn't savvy today he will be tomorrow, and
> could change the ip address of his machine.
>
> If you have other machines and allow your internal class C to get out, you
> could restrict the kid's machine by mac address matching, as it is a
> little
> harder to forge.  Not impossible, but harder than changing an IP address.
>
> Just my $.02.
>
> -=Ray
> ---------------------------------------
> [Inexperienced] pilots are really blind in the air for the first couple of
> months.
> Colonel Erich "Bubi" Hartmann, GAF, World's Leading Ace, Luftwaffe, WWII,
> 352 Victories
>
>
>> -----Original Message-----
>> From: Joel Newkirk [mailto:firewalldude@newkirk.us]
>> Sent: Wednesday, October 22, 2003 5:35 PM
>> To: sbisgaard@xtrasource.com
>> Cc: netfilter@lists.netfilter.org
>> Subject: Re: Time changes
>>
>>
>> On Wed, 2003-10-22 at 15:44, Steffen Bisgaard - Xtrasource wrote:
>> > Hallo list,
>> >
>> > A quick question: Is it possible to block access to and
>> from a PC (say
>> > 10.2.0.3) at a specific time, for example 21:00, and re-enable it at
>> > 08:00 the next day using iptables - and if so how?? Yes this is the
>> > kids PC...
>> > It used to be real simple with ipfw - I can't remember the
>> syntax but
>> > something along the lines of ipfw -add (or -remove) deny (or allow)
>> > 10.2.0.3 all
>> >
>> > Any ideas? Or do I need two separate iptables scripts?
>>
>> Not full scripts.  Try creating two cron jobs - one running
>> at 21:00 the
>> other at 08:00.  One is just:
>> iptables -I FORWARD 1 -s 10.2.0.3 -j REJECT
>> the other
>> iptables -D FORWARD -s 10.2.0.3 -j REJECT
>>
>> j
>>
>>
>>
>


Thanks,
Josh Berry, CTO
LinkNet-Solutions
469-831-8543
josh.berry@linknet-solutions.com


