From: Tomas Mudrunka <mudrunka@spoje.net>
Subject: Re: Counters for individual elements in maps and
 =?UTF-8?Q?sets=3F?=
Date: Fri, 10 Nov 2017 14:09:29 +0100
Message-ID: <cc5ae755d98ceba9be4d2e30f42e64ee@spoje.net>
References: <869ba4d3be90adbb2519654c489285d0@spoje.net>
 <CAOkSjBhjbdmBw3QgHDcRjuO6KfVfWEhT5Owrdkx3=bkhCH1FKQ@mail.gmail.com>
 <20171110070750.GA6027@salvia>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1510319381;
        bh=4MkPoM23JfsiIUeutbqtQwpi3QJeIqPioBZD7kRc3Pg=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=Nw2LiuQtMkwJJ3aYMjmbUEdPn5417j51+3miT/HVbl5DztUZhFqPqzmrlpOt9+Vsk
         +qhKPPxML6SoMLwuCBNUq20uIDFyznD771L+Iwhk18zor+W4urr61BWQ0TP4OkQKaQ
         /y8Un+rhZyTyiYyGhi0gg4SsMAkhZ5JK2d8dg90U=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=spoje.net;
        s=spojemail; t=1510319369;
        bh=4MkPoM23JfsiIUeutbqtQwpi3QJeIqPioBZD7kRc3Pg=;
        h=Date:From:To:Subject:In-Reply-To:References:From;
        b=AHIUi6ADGYLzvBWOEUKhgCd1XOhmh9T5m75vPnqVVirD0bQSliqVKk8SV8EpbqfgL
         zEPku/4HWCyrSn1ScbUFJD2H7xuDMnC4jNBnRaMyRXXKj2OIHk/ei41+X7TSCXYUjq
         9B2/0aL2f+L72eAfn87aXjLaOSXGyqVw5y/O3w+4=
In-Reply-To: <20171110070750.GA6027@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Dne 2017-11-10 08:07, Pablo Neira Ayuso napsal:
> On Tue, Nov 07, 2017 at 07:44:13PM +0100, Arturo Borrero Gonzalez 
> wrote:
>> On 7 November 2017 at 14:09, Tomas Mudrunka <mudrunka@spoje.net> 
>> wrote:
>> > Hello,
>> > i've figured it's possible to simplify my rules by using maps and sets
>> > instead of using individual rules, but i need to account traffic for each
>> > address in the map separately. Maybe this can be implemented using flags in
>> > map/set, so i will be able to enable it like this:
>> >
>> >         map prometheus {
>> >                 type ipv4_addr : classid;
>> >                 flags interval, counter;
>> >                 elements = {
>> >                         1.1.1.2 : 2:2222 counter packets 10 bytes 5120,
>> >                         1.1.1.3 : 3:3333 counter packets 3 bytes 489
>> >                 }
>> >         }
>> >
>> > just to make it clear, the same map without counters looks like this right
>> > now:
>> >
>> >         map prometheus {
>> >                 type ipv4_addr : classid
>> >                 flags interval
>> >                 elements = {
>> >                         1.1.1.2 : 2:2222,
>> >                         1.1.1.3 : 3:3333
>> >                 }
>> >         }
>> >
>> >
>> > Will it be ever possible to have per element counters for maps and sets?
>> >
>> 
>> you are probably looking for something like this:
>> https://wiki.nftables.org/wiki-nftables/index.php/Flow_tables
> 
> This looks like a different usecase we don't support yet, that doesn't
> fit into flow tables.
> 
> There's a ticket in bugzilla asking for something like this, we plan
> to add support for this indeed.


I guess that this can be done using flow tables, HOWEVER in such case 
each packet has to be matched two times. Once for classification and 
once for traffic accounting.

Similar problem is with sets and maps. AFAIK you can't really use one 
map for multiple rules.
Eg.: I wish to have single map that would contain ip adress key, then ip 
adress for NAT, class for TC and counter.

So i can use that map as if it was set. So i can have rule that will 
just ACCEPT anything that is in the map, another rule that will do NAT 
to different IP stored in the same map and set classid of that packet 
according to same map. And finaly update counters on that element in 
map.

This would require that maps can have multiple columns (sorta like SQL 
DB) and possibly multiple keys.
Right now, you can have map that matches multiple "keys" eg. using "ip 
saddr . tcp dport", but what if i want to add another rule, that would 
use the same map to match just by "ip saddr". this is not possible and i 
have to make another map for that.

Having this option to define both multiple keys and multiple values in 
single element of map might simplify and even speed up packet processing 
when used well. (let's say that i want to define map that would map NAT 
from ip:port to another ip:port. right now i have to match two maps. one 
for ip:port to ip and one for same ip:port to port).

-- 
S pozdravem
Best regards
      Tomáš Mudruňka - SPOJE.NET s.r.o.
