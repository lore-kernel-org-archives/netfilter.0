From: "Alex Sirbu" <alex@as.ro>
Subject: Re: over a 1,000,000,000 individual ips to block
Date: Mon, 28 Jun 2004 16:04:59 +0300 (EEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <42481.194.102.197.244.1088427899.squirrel@www.as.ro>
References: <20040624145732.25300.qmail@team.outblaze.com>
    <20040628064501.3bab3f3c@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040628064501.3bab3f3c@mgalepc.utilitran.com>
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
To: Michael Gale <michael.gale@utilitran.com>
Cc: netfilter@lists.netfilter.org

For blocking pourposes why don't you use blackholes ?
I have a webserver that is permanently under DoS attacks , so I use black=
holes.

Routing table can have million of rules or static routes, so is not a pro=
blem .

Let's say you want to block ip 11.22.33.44 . just type :

#ip route add blackhole 11.22.33.44/32

and all packets to 11.22.33.44  will be discarded.

if you type than :
#ip ro | grep blackhole
you will see all blackholes defined by you

you can blackhole your incomming traffic, but be carefull what you are do=
ing .


> Hello,
>
> 	Why don't you block networks ??
>
> Firewall - SYN Cookie enabling ?
>
> Mail servers - use RBL list - this list will contain networks of IP's t=
hat
> belong to home users. So they do not need to connect directly to your m=
ail
> server.
>
> Web servers -- rate limiting ? block networks ? Better web server ?
>
> If you blocked networks ? The estimated max number of rules a packet mi=
ght have
> to match would be 254 ... plus the rest of your filtering for ports and=
 other
> needs. This could slow down network access because of all the rules to =
check for
> each packet.
>
> If you are not using network addresses the list would become to long.
>
> Michael.
>
>
> On Thu, 24 Jun 2004 22:57:32 +0800
> "Timothy Webster" <timothyw@outblaze.com> wrote:
>
>> I have a need to block 1 -> 2 million ips.
>> This edge firewall will be blocking dos attackers, spammers
>> from hitting our proxys, and mail/web servers.
>> I also need to be able to reload the 1 -> 2 million blocked
>> ips from time to time as they change.
>> But this list is not changing continuously.
>>
>> Thoughts how to do this?
>> What would you recommend for a hardware?
>> The iptables set patch, what else?
>>
>>
>> I need to come of with a plan so I can begin testing for
>> deployment.
>>
>> Thanks,
>>
>> -Tim
>>
>>
>>
>>
>>
>
>
> --
> Michael Gale
> Network Administrator
> Utilitran Corporation
>
>
>



-----------------------------------------------------------------------
As.Ro - Cont gratuit de Email si 50MB free webhosting. http://www.as.ro


