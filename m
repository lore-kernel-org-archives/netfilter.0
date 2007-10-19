From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Packet duplication
Date: Fri, 19 Oct 2007 12:11:28 +0200
Message-ID: <471882D0.2060602@freemail.hu>
References: <47184C6D.40202@netsys.co.za> <47186FC3.6030402@freemail.hu> <471875A4.8010000@netsys.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <471875A4.8010000@netsys.co.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Tiaan Wessels <tiaan@netsys.co.za>

Tiaan Wessels =EDrta:
> G=E1sp=E1r Lajos wrote:
>> Tiaan Wessels =EDrta:
>>> Hi,
>>> Not sure there is any life on this list but in case someone picks m=
e=20
>>> up on netfilter user SETI here goes:
>> There is life !!! :D
>>> How do I go about duplicating a UDP packet arriving at a machine.=20
>>> Essentially I want to have it go to its original recipient but to=20
>>> another new one also.
>>> -j ROUTE --tee seems not to be supported anymore.
>> False... It is supported but you need the patch-o-matic(-ng) stuff..=
=2E
>>
>>       --tee  Make a copy of the packet, and route that copy to the=20
>> given destination. For the original, uncopied packet, behave like a=20
>> non-terminating tar-
>>              get and continue traversing the rules.  Not valid in=20
>> combination with `--iif' or `--continue'
>>
>>> Thanks
>>
>>
>> Swifty
>>
>>
> Getting this to work for a novice like me seems to be impossible.
It is not so hard... :D
> Doing a man on my FC5 system shows --tee to be there under the ROUTE=20
> extension and I quote from the man page
> 'iptables can use extended target modules: the following are included=
=20
> in the standard distribution'
> however using iptables results in
>
> [root@nst2 ~]# /sbin/iptables -A PREROUTING -t mangle -p udp -d=20
> 192.168.3.77 --dport 9090 -j ROUTE --tee
> iptables v1.3.5: Unknown arg `--tee'
Note that you may need the --oif option too with tee...
(I woukd be glad If anyone could confirm!)
> locate libipt_ROUTE.so yields nothing which makes me believe the man=20
> page was talking bollocks when claiming the extensions to be part of=20
> the 'standard distribution'
>
Bad manpage... :D
> After further reading I also came to the conclusion patch-o-matic=20
> needed to be used to install the ROUTE module. going to netfilter=20
> extensions HOWTO I see I have to get the latest update from CVS like=20
> in so
>
> cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
>
>
> but when I do this with password cvs I get
>
> [root@nst2 ~]# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic l=
ogin
> Logging in to :pserver:cvs@pserver.netfilter.org:2401/cvspublic
> CVS password:
> cvs [login aborted]: connect to=20
> pserver.netfilter.org(213.95.27.115):2401 failed: Connection refused
>
> any ideas ?
=46orget cvs... try svn...

Swifty

