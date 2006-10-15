From: Martijn Lievaart <m@rtij.nl>
Subject: Re: Can't get access to local servers using external IP
Date: Sun, 15 Oct 2006 20:05:07 +0200
Message-ID: <45327853.4070101@rtij.nl>
References: <BAY102-F34366D66CEBC07CEBB779FBC0A0@phx.gbl>	<453111A5.8000603@rtij.nl>
	<45322F80.3090502@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45322F80.3090502@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Pascal Hambourg wrote:

> Hello,
>
> Martijn Lievaart a =E9crit :
>
>>
>> There are several ways you can make this work.
>>
>> 1) When packets from $local_lan arrive destined for the webserver, 
>> not only DNAT them, but SNAT them as well to an ip of the firewall. 
>> The disadvantage is that the webserverlogs will not acurately report 
>> the source address for these connections. This is probably what the 
>> linksys did.
>
>
> Hint : using NETMAP to do the source NAT, you can do a 1:1 mapping so 
> you can retrieve the original source address.


I thought about this, but the documentation on NETMAP is actually pretty=
 
bad, so I decided I would not advertise this route.

>
> [...]
>
>> 6) Probably lots of other solutions I didn't think about.
>
>
> If you access the server by name instead of by IP address :
>
> 7) Put the private address and the name in the /etc/hosts file of your=
 
> workstations. Quick and dirty, does not scale.
>
> 8) Set up a "split DNS" server so the internal requests receive the 
> private address and the external request receive the public address.
>

I do that too, it may actually be the best advice from this list. A 
bitch to set up[1], but once it's working it works like a charm.

M4

[1] I don't exactly recall my troubles setting it up, it may have been 
just my situation.


