From: Jeffrey Laramie <JALaramie@Loudoun-Fairfax.com>
Subject: Re: TWO ROUTING
Date: Thu, 20 Nov 2003 09:43:33 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FBCD315.3020902@Loudoun-Fairfax.com>
References: <E1AMU5R-0001oJ-Io@vishnu.netfilter.org> <3FBCC194.1080008@Loudoun-Fairfax.com> <200311201340.hAKDeN722163@onyx.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311201340.hAKDeN722163@onyx.rockstone.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Antony Stone wrote:

>On Thursday 20 November 2003 1:28 pm, Jeffrey Laramie wrote:
>
> =20
>
>>Jos=E9 Gomes wrote:
>>   =20
>>
>>>I Need to setup one Linux box with 3 Nics and two valid ip address, my
>>>question is:
>>>
>>>Nic1: 192.168.14.0/24
>>>
>>>Nic2: 200.204.x.x/29 route to internet
>>>
>>>Nic3: 200.171.x.x/29 route to internet
>>>
>>>How can both Ips with different routes response to requests with both
>>>routes enable ???
>>>     =20
>>>
>>I'm not clear what it is you're asking. Setting routes doesn't involve
>>iptables or netfilter. If you could give some more information we can
>>try to help.
>>   =20
>>
>
>I think he's simply asking whether Linux can use two default routes on one=
=20
>machine at the same time.
> =20
>

Oh, I see. I don't think that's possible at the routing level. That=20
sounds like a job for a load balancer but I'm not a technical guy and=20
routing isn't my strong suit. I'm really much better at filter rules,=20
logging, and sarcasm.  ;-)

>Agreed, not a netfilter question, but I see the same thing asked on the Sq=
uid=20
>mailing list too....
>
> =20
>

I also see similar questions on multiple lists. I often have to check=20
the mail header to see what list they're posting to so I know the=20
context of the question. On a similar vein, does netfilter have any=20
mailing list usage guidelines posted anywhere? I looked around the other=20
day and couldn't find any. I've seen some sites with a link to=20
guidelines and etiquette on the list subscription page. Something like=20
that might be useful for this list.

Jeff


