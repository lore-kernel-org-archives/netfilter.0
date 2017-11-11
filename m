From: Raymond Burkholder <ray@oneunified.net>
Subject: Re: Counters for individual elements in maps and sets?
Date: Sat, 11 Nov 2017 16:29:17 -0400
Message-ID: <48d93081-d530-2064-6e54-f7b18e50e310@oneunified.net>
References: <869ba4d3be90adbb2519654c489285d0@spoje.net>
 <CAOkSjBhjbdmBw3QgHDcRjuO6KfVfWEhT5Owrdkx3=bkhCH1FKQ@mail.gmail.com>
 <20171110070750.GA6027@salvia> <cc5ae755d98ceba9be4d2e30f42e64ee@spoje.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <cc5ae755d98ceba9be4d2e30f42e64ee@spoje.net>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Tomas Mudrunka <mudrunka@spoje.net>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 11/10/2017 09:09 AM, Tomas Mudrunka wrote:
> Dne 2017-11-10 08:07, Pablo Neira Ayuso napsal:
>> On Tue, Nov 07, 2017 at 07:44:13PM +0100, Arturo Borrero Gonzalez wrote:
>>> On 7 November 2017 at 14:09, Tomas Mudrunka <mudrunka@spoje.net> wrote:
>>> > Hello,
>>> > i've figured it's possible to simplify my rules by using maps and sets
>>> > instead of using individual rules, but i need to account traffic 
>>> for each
>>> > address in the map separately. Maybe this can be implemented using 
>>> flags in
>>> > map/set, so i will be able to enable it like this:
>>> >
>>>
>>> you are probably looking for something like this:
>>> https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables
>>
>> This looks like a different usecase we don't support yet, that doesn't
>> fit into flow tables.
>>
> I guess that this can be done using flow tables, HOWEVER in such case 
> each packet has to be matched two times. Once for classification and 
> once for traffic accounting.
> 

Doing a free association here, in case it is of interest, use connection 
tracking in Open vSwitch.  It deals with flows, makes use of connection 
tracking, and maintains flow statistics.

It is an interesting technology combination, and I am working to convert 
infrastructure for which I am responsible to this style of security: 
security rules are built into the routing and switching mechanism at 
endpoints as well as midpoints.

There are many other related concepts which spring to mind for those 
interested in this mix.

--
Raymond Burkholder
https://blog.raymond.burkholder.net


-- 
This message has been scanned for viruses and
dangerous content by MailScanner, and is
believed to be clean.

