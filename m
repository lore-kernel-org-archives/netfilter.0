From: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>
Subject: Re: [RFC PATCH 0/2] Landlock network PoC implementation
Date: Sat, 18 Dec 2021 11:59:26 +0100
Message-ID: <1344bc15-6dec-fcc2-8523-215aad17a535@digikod.net>
References: <20211210072123.386713-1-konstantin.meskhidze@huawei.com>
 <b50ed53a-683e-77cf-9dc2-f4ae1b5fa0fd@digikod.net>
 <12467d8418f04fbf9fd4a456a2a999f1@huawei.com>
 <b535d1d4-3564-b2af-a5e8-3ba6c0fa86c9@digikod.net>
 <c8588051-8795-9b8a-cb36-f5440b590581@digikod.net>
 <CA+FuTSd8RxC9UGfJZA99p3CMxAQhESR_huXYScgwJWGonwbxOw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
In-Reply-To: <CA+FuTSd8RxC9UGfJZA99p3CMxAQhESR_huXYScgwJWGonwbxOw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>, yusongping <yusongping@huawei.com>, Artem Kuzin <artem.kuzin@huawei.com>, linux-security-module <linux-security-module@vger.kernel.org>, Network Development <netdev@vger.kernel.org>, netfilter@vger.kernel.org

Here is the beginning of the thread: 
https://lore.kernel.org/linux-security-module/a1769c4239ee4e8aadb65f9ebb6061d8@huawei.com/

On 17/12/2021 22:29, Willem de Bruijn wrote:
> On Fri, Dec 17, 2021 at 4:38 AM Mickaël Salaün <mic@digikod.net> wrote:

[...]

>>>>
>>>> Accesses/suffixes should be:
>>>> - CREATE
>>>> - ACCEPT
>>>> - BIND
>>>> - LISTEN
>>>> - CONNECT
>>>> - RECEIVE (RECEIVE_FROM and SEND_TO should not be needed)
>>>> - SEND
>>>> - SHUTDOWN
>>>> - GET_OPTION (GETSOCKOPT)
>>>> - SET_OPTION (SETSOCKOPT)
>>
>> For now, the only access rights should be LANDLOCK_ACCESS_NET_BIND_TCP
>> and LANDLOCK_ACCESS_NET_CONNECT_TCP (tie to two LSM hooks with struct
>> sockaddr).
>>
>> These attribute and access right changes reduce the scope of the network
>> access control and make it simpler but still really useful. Datagram
>> (e.g. UDP, which could add BIND_UDP and SEND_UDP) sockets will be more
>> complex to restrict correctly and should then come in another patch
>> series, once TCP is supported.
> 
> Thanks for cc:ing the netdev list. I miss some of context, assume that
> limits are configured on a socket basis.
> 
> One practical use-case I had for voluntary relinquish of privileges:
> do not allow connect AF_UNSPEC. This is a little-used feature that
> allows an already established connection to disconnect and create a
> new connection. Without this option, it is possible for a privileged
> process to create connections and hand those off to a less privileged
> process. Also, do not allow listen calls, to avoid elevating a socket
> to a listener.

Thanks for the heads up. connect + AF_UNSPEC is a nice trick but the 
security_socket_connect() hook should handle that, and then the 
LANDOCK_ACCESS_NET_CONNECT_TCP right too. This should be part of tests 
though.
