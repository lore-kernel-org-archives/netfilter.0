From: "Alex Sirbu" <alex@as.ro>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 16:52:04 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <45879.194.102.197.244.1088430724.squirrel@www.as.ro>
References: <20040624145732.25300.qmail@team.outblaze.com>   
    <20040628064501.3bab3f3c@mgalepc.utilitran.com>
    <42481.194.102.197.244.1088427899.squirrel@www.as.ro>
    <40E01ED9.6050607@linuxmail.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40E01ED9.6050607@linuxmail.org>
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
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter@lists.netfilter.org

> Alex Sirbu wrote:
>> For blocking pourposes why don't you use blackholes ?
>> I have a webserver that is permanently under DoS attacks , so I use bl=
ackholes.
>>
>> Routing table can have million of rules or static routes, so is not a =
problem .
>>
>> Let's say you want to block ip 11.22.33.44 . just type :
>>
>> #ip route add blackhole 11.22.33.44/32
>>
>> and all packets to 11.22.33.44  will be discarded.
>
> All packets to 11.22.33.44 is discarded...but will 11.22.33.44 be able
> to generate a connection socket?

if you put a blackhole to destination, all pakets to that ip addres will =
get "Network is
unrecheable" so a TCP connection will never be established.

>>
>> if you type than :
>> #ip ro | grep blackhole
>> you will see all blackholes defined by you
>
> How maintainable is such a list compared to iptables which has
> iptables-save and iptables-restore?

you can write your own script ( bash, perl , etc. ) that can manage the b=
lackhole list and have it
running in start, stop, restart, dump, clear, panic , add or delete.
you can even keep all the information into a flatfile or database

I wrote my own script , and it's working very well. I can add or remove I=
Ps to/from blackholes
list , I can remove all blackholes at once , I can make a bulk dump of ru=
nning routing table
containing blackholes.

>>
>> you can blackhole your incomming traffic, but be carefull what you are=
 doing .
>>
>
> Is there something I am missing here?

if , by mistake, you block your own IP net or even loopback address (127.=
0.0.1) you will get a lot
of trouble ( that can be fixed if you have direct access to that server -=
 I mean keyboard or
serial terminal )
>
>
>



-----------------------------------------------------------------------
As.Ro - Cont gratuit de Email si 50MB free webhosting. http://www.as.ro


