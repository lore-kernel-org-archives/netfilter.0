From: Ashutosh Naik <ashutosh@teneoris.com>
Subject: Re: Questions about the workings of iptables
Date: Wed, 28 Jul 2004 09:30:04 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <opsbtxeefvsueqbq@192.168.1.10>
References: <564DE4477544D411AD2C00508BDF0B6A21C4DABE@usahm018.exmi01.exch.eds.com> <opsbsb0q0j2fsc0m@192.168.1.10> <1090935679.25639.78.camel@localhost> <200407271522.40503.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407271522.40503.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="flowed"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 27 Jul 2004 15:22:40 +0100, Antony Stone 
<Antony@Soft-Solutions.co.uk> wrote:

> On Tuesday 27 July 2004 2:41 pm, John A. Sullivan III wrote:
>
>> On Tue, 2004-07-27 at 03:20, Ashutosh wrote:
>> > > No.   AFAIK the connection tracking in netfilter checks only src+dst
>> > > IP+port,
>> > > nothing else.
>> >
>> > .. And the Protocol
>>
>> and I would assume there is a timer - John
>
> Oh yes, there are timers, but that's not part of the information from the
> original packet which gets matched in future packets, which is what I was
> discussing, and what I think the original question was about (!?).

Yes, What actually get matched is only the 5 tuples.. 
srcIP+destIP+srcport+destport+Protocol



-- 
Ashutosh Naik
Teneoris Networks India Pvt. Ltd.

