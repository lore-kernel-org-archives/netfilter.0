From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: filtering HTTP signatures/headers ? (nfcan: addressed to 
 exclusive sender for this address)
Date: Thu, 2 Mar 2006 12:04:15 +0100 (CET)
Message-ID: <56702.193.173.147.3.1141297455.squirrel@webmail.sterenborg.info>
References: <20060302040400.27574.qmail@web51111.mail.yahoo.com>
	<20060302053738.GK11698@salty>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060302053738.GK11698@salty>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org


On Thu, March 2, 2006 06:37, Jim Laurino wrote:
> On 2006.03.01 23:04, S t i n g r a y - fasi_74@yahoo.com wrote:
>> The problem is that , i have a proxy/firewall box that
>> provides internet to my internal users, now i have
>> only permitted the common ports like
>> ftp,http,smtp,pop3 etc etc & blocked all other , now
>> there are couple of p2p applications out there that
>> tunnel through my port 80 as its open, this is taking
>> up my internet bandwith, i want to stop that ...
>
> Well, then what Rob said before applies.
> Netfilter is not good for solving this problem.
> Squid is reputed to be very good for this problem.

AFAIK squid will not proxy P2P traffic, however, this could be of help :
http://www.netfilter.org/projects/patch-o-matic/pom-extra.html#pom-extra-=
ipp2p

The example says :
iptables -A FORWARD -m ipp2p --edk --kazaa --bit -j DROP

But maybe you can also use it as :
iptables -A FORWARD -m ipp2p -j DROP


Gr,
Rob


>>   regards
>>
>>
>> --- Rob Sterenborg <rob@sterenborg.info> wrote:
>>
>> > On Wed, March 1, 2006 16:40, S t i n g r a y wrote:
>> > > will it filter out HTTP tunneling also ?
>> >
>> > Do you mean you have a VPN tunnel which transfers
>> > http, or what ? If that is
>> > the case, I don't think so ; Squid can only inspect
>> > traffic that it can see of
>> > course. However, if the Squid-box is at the end of
>> > the tunnel you may be able
>> > to do it.
>> > But maybe I don't understand correctly what problem
>> > you are trying to solve.
>> >
>> >
>> > Gr,
>> > Rob
>> >
>> > > --- Rob Sterenborg <rob@sterenborg.info> wrote:
>> > >> On Wed, March 1, 2006 12:45, S t i n g r a y
>> > wrote:
>> > >> > Is it possible to filter HTTP
>> > signatures/headers
>> > >> > with Iptables ? or is there addon for it ?
>> > >>
>> > >> You may be able to use the String match but you
>> > can
>> > >> only filter the payload of 1 packet at a time :
>> > if a
>> > >> signature/header spans multiple packets then it
>> > >> won't work.
>> > >>
>> > >> Netfilter is not meant to do content filtering.
>> > >> Perhaps you can use Squid.
>> > >>
>> > >>
>> > >> Gr,
>> > >> Rob
>> >
>> >
>> >
>> >
>>
>>
>> *=BA=A4., =B8=B8,.=A4=BA*=A8=A8=A8*=A4 Stingray *=BA=A4., =B8=B8,.=A4=BA=
*=A8=A8*=A4
>>
>>
>>
>>
>> __________________________________________________
>> Do You Yahoo!?
>> Tired of spam?  Yahoo! Mail has the best spam protection around
>> http://mail.yahoo.com
>>
>>
>>
>
> --
> Jim Laurino
> nfcan.x.jimlaur@dfgh.net
> Please reply to the list.
> Only mail from the listserver reaches this address.
>
>


--=20
"Inspraak zonder inzicht resulteert in uitspraak zonder uitzicht."



