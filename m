From: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
Subject: Re: [RFC PATCH 1/2] landlock: TCP network hooks implementation
Date: Mon, 7 Feb 2022 05:35:36 +0300
Message-ID: <19ad3a01-d76e-0e73-7833-99acd4afd97e@huawei.com>
References: <20220124080215.265538-1-konstantin.meskhidze@huawei.com>
 <20220124080215.265538-2-konstantin.meskhidze@huawei.com>
 <CA+FuTSf4EjgjBCCOiu-PHJcTMia41UkTh8QJ0+qdxL_J8445EA@mail.gmail.com>
 <0934a27a-d167-87ea-97d2-b3ac952832ff@huawei.com>
 <CA+FuTSc8ZAeaHWVYf-zmn6i5QLJysYGJppAEfb7tRbtho7_DKA@mail.gmail.com>
 <9442f950-4d9e-cd76-0fc1-1c5f68f7f909@digikod.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <linux-security-module-owner@vger.kernel.org>
Content-Language: ru
In-Reply-To: <9442f950-4d9e-cd76-0fc1-1c5f68f7f909@digikod.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: =?UTF-8?Q?Micka=c3=abl_Sala=c3=bcn?= <mic@digikod.net>, Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: linux-security-module@vger.kernel.org, netdev@vger.kernel.org, netfilter@vger.kernel.org, yusongping@huawei.com, artem.kuzin@huawei.com



2/1/2022 3:28 PM, Mickaël Salaün пишет:
> 
> On 26/01/2022 15:15, Willem de Bruijn wrote:
>> On Wed, Jan 26, 2022 at 3:06 AM Konstantin Meskhidze
>> <konstantin.meskhidze@huawei.com> wrote:
>>>
>>>
>>>
>>> 1/25/2022 5:17 PM, Willem de Bruijn пишет:
>>>> On Mon, Jan 24, 2022 at 3:02 AM Konstantin Meskhidze
>>>> <konstantin.meskhidze@huawei.com> wrote:
>>>>>
>>>>> Support of socket_bind() and socket_connect() hooks.
>>>>> Current prototype can restrict binding and connecting of TCP
>>>>> types of sockets. Its just basic idea how Landlock could support
>>>>> network confinement.
>>>>>
>>>>> Changes:
>>>>> 1. Access masks array refactored into 1D one and changed
>>>>> to 32 bits. Filesystem masks occupy 16 lower bits and network
>>>>> masks reside in 16 upper bits.
>>>>> 2. Refactor API functions in ruleset.c:
>>>>>       1. Add void *object argument.
>>>>>       2. Add u16 rule_type argument.
>>>>> 3. Use two rb_trees in ruleset structure:
>>>>>       1. root_inode - for filesystem objects
>>>>>       2. root_net_port - for network port objects
>>>>>
>>>>> Signed-off-by: Konstantin Meskhidze <konstantin.meskhidze@huawei.com>
>>>>
>>>>> +static int hook_socket_connect(struct socket *sock, struct 
>>>>> sockaddr *address, int addrlen)
>>>>> +{
>>>>> +       short socket_type;
>>>>> +       struct sockaddr_in *sockaddr;
>>>>> +       u16 port;
>>>>> +       const struct landlock_ruleset *const dom = 
>>>>> landlock_get_current_domain();
>>>>> +
>>>>> +       /* Check if the hook is AF_INET* socket's action */
>>>>> +       if ((address->sa_family != AF_INET) && (address->sa_family 
>>>>> != AF_INET6))
>>>>> +               return 0;
>>>>
>>>> Should this be a check on the socket family (sock->ops->family)
>>>> instead of the address family?
>>>
>>> Actually connect() function checks address family:
>>>
>>> int __inet_stream_connect(... ,struct sockaddr *uaddr ,...) {
>>> ...
>>>          if (uaddr) {
>>>                  if (addr_len < sizeof(uaddr->sa_family))
>>>                  return -EINVAL;
>>>
>>>                  if (uaddr->sa_family == AF_UNSPEC) {
>>>                          err = sk->sk_prot->disconnect(sk, flags);
>>>                          sock->state = err ? SS_DISCONNECTING :
>>>                          SS_UNCONNECTED;
>>>                  goto out;
>>>                  }
>>>          }
>>>
>>> ...
>>> }
>>
>> Right. My question is: is the intent of this feature to be limited to
>> sockets of type AF_INET(6) or to addresses?
> 
> This feature should handle all "TCP" sockets/ports, IPv4 or IPv6 or 
> unspecified, the same way. What do you suggest to not miss corner cases? 
> What are the guarantees about socket types we can trust/rely on?
> 
> 
>>
>> I would think the first. Then you also want to catch operations on
>> such sockets that may pass a different address family. AF_UNSPEC is
>> the known offender that will effect a state change on AF_INET(6)
>> sockets.
> 
> Indeed, Landlock needs to handle this case to avoid bypasses. This must 
> be part of the tests.

  Agree. I will add into tests a case with AF_UNSPEC.
> 
> 
>>
>>>>
>>>> It is valid to pass an address with AF_UNSPEC to a PF_INET(6) socket.
>>>> And there are legitimate reasons to want to deny this. Such as passing
>>>> a connection to a unprivileged process and disallow it from disconnect
>>>> and opening a different new connection.
>>>
>>> As far as I know using AF_UNSPEC to unconnect takes effect on
>>> UDP(DATAGRAM) sockets.
>>> To unconnect a UDP socket, we call connect but set the family member of
>>> the socket address structure (sin_family for IPv4 or sin6_family for
>>> IPv6) to AF_UNSPEC. It is the process of calling connect on an already
>>> connected UDP socket that causes the socket to become unconnected.
>>>
>>> This RFC patch just supports TCP connections. I need to check the logic
>>> if AF_UNSPEC provided in connenct() function for TCP(STREAM) sockets.
>>> Does it disconnect already established TCP connection?
>>>
>>> Thank you for noticing about this issue. Need to think through how
>>> to manage it with Landlock network restrictions for both TCP and UDP
>>> sockets.
>>
>> AF_UNSPEC also disconnects TCP.
>>
>>>>
>>>>> +
>>>>> +       socket_type = sock->type;
>>>>> +       /* Check if it's a TCP socket */
>>>>> +       if (socket_type != SOCK_STREAM)
>>>>> +               return 0;
>>>>> +
>>>>> +       if (!dom)
>>>>> +               return 0;
>>>>> +
>>>>> +       /* Get port value in host byte order */
>>>>> +       sockaddr = (struct sockaddr_in *)address;
>>>>> +       port = ntohs(sockaddr->sin_port);
>>>>> +
>>>>> +       return check_socket_access(dom, port, 
>>>>> LANDLOCK_ACCESS_NET_CONNECT_TCP);
>>>>> +}
>>>> .
> .
