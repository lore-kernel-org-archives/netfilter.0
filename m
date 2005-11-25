From: "Paul Collen" <paul.collen@brahler-ics.co.uk>
Subject: RE: Letting out port 80 traffic
Date: Fri, 25 Nov 2005 15:58:33 -0000
Message-ID: <08ABA55F2AFD764F93022E0FEBD4DB8D2EF42E@server.cambridge.brahler-ics.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

 Hello,

Yep, it's working now but I don't know how. As far as I can see it's
configured the same way it was when I started this morning, but Squid
isn't running so theoretically we shouldn't have web access. I don't
want to fiddle with it anymore today (being POETS day) but I'm sure I'll
break it again on Monday.

Thanks for your help with this problem.

Cheers,

Paul.


-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Rob
Sterenborg
Sent: 25 November 2005 15:36
To: netfilter@lists.netfilter.org
Subject: Re: Letting out port 80 traffic

On Fri, November 25, 2005 16:19, Edmundo Carmona wrote:
> Did you have it working as a transparent proxy? In that case, you must

> have some rules "bothering" in prerouting.

I got an email from the OP saying that it seems to be working, somehow.


Gr,
Rob



> On 11/25/05, Eray Aslan <eray.aslan@caf.com.tr> wrote:
>> netfilter-bounces@lists.netfilter.org <> wrote:
>> > Can
>> > someone tell me where I have to put the rules to gurantee I can get

>> > port 80 traffic out of my network please? :o)
>> >
>>
>> Check your routing tables.  By the way, "I've added port 80 rules in=20
>> several places but can't get it to work" is not a good problem=20
>> description.
>>
>> HTH
>> Eray
>>
>> 90% of networking problems are routing problems.
>> 9 of the remaining 10% are routing problems in the other direction.
>> The remaining 1% might be something else, but check the routing=20
>> anyway.
>>
>>
>
>


--
"Inspraak zonder inzicht resulteert in uitspraak zonder uitzicht."




