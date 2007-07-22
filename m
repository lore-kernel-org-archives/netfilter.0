From: Georg Hohenberger <Georg@Hohenberger-online.de>
Subject: Re: linux server as load-balanced gateway inside a network with 2
 routers using only one network interface
Date: Sun, 22 Jul 2007 19:59:10 +0200
Message-ID: <46A39AEE.3000605@Hohenberger-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Thank you Maximilian, I think thats exactly what I need

Georg from Germany

Maximilian Wilhelm schrieb:
> Am Sunday, den 22 July hub Georg Hohenberger folgendes in die Tasten:
>
> Hi!
>
> Please reply to the list, so everone can answer and read the mail.
> I redirected the thread to the list again.
>
>  =20
>> Maximilian Wilhelm schrieb:
>>    =20
>>> Sorry, I don=C2=B4t get what you want to do.
>>> What exactly should your file-server load-balance?
>>> The access to the internet using both DSL routers?
>>>      =20
>
>  =20
>> yes, inside my lan there are 2 routers which schould be used by my=20
>> server to do load-balancing to share a gateway to the other  pc's in my =
lan
>>    =20
>
> That should be possible.
>
> The basic concept is to point the default gateway of all your boxes to
> your linux box and let the linux box decide where to push the traffic
> along.
>
> If you just have two normal DSL lines you will most probably not be
> able to do *real* loadbalancing as your ISP would have to help you.
>
> What you can do is to push different types of connections along the
> two routers, but you have to take care the a connection (e.g. a ssh
> session) is routed along the same path while active.
>
> So you may want to set up two routing tables on your linux box (one
> for each DSL router which becomes default gateway in that table) and
> set up some iptables rules which decide which traffic should be routed
> via which routing table (think: DSL router).
>
> Have a look at
> http://lists.netfilter.org/pipermail/netfilter/2007-June/069142.html
> to get an idea about how to set something like this up (It is not an
> exact example, just a similar one, but the general idea should become
> clear)
>
> HTH
> Ciao
> Max


