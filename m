From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: queue buffer size increasing howto?
Date: Sun, 22 Aug 2004 10:55:00 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <876ef97a040822075556951a4@mail.gmail.com>
References: <1093182015.17276.24.camel@debian> <876ef97a0408220750591cc852@mail.gmail.com>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <876ef97a0408220750591cc852@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Sun, 22 Aug 2004 15:40:16 +0200, Banszki Gabor
<banszki.gabor@chello.hu> wrote:
>
> Hi everybody!
>
> Greetings for you! I am a new member of this list.
>
> Please somebody help me!
>
> I am developing an application for counting and processing packets in a
> linux box with using the ip_queue module.
>
> It is working properly, but sometimes I have a problem, that I get often
> this message:
>
> Failed to receive netlink message, No buffer space available

This message indicates the the buffer for the netlink socket was full.
This is different from the queue that ip_queue has internally for
packets to be sent to userspace. You will need to open the netlink
socket with a larger buffer, which can be accomplished by using
setsockopt(2):

int fd, rv, size = LARGE_SOCKET_BUFFER;

fd = socket( PF_NETLINK, SOCK_RAW, NETLINK_FIREWALL);
rv = setsockopt( fd, SOL_SOCKET, SO_RCVBUF, &size, sizeof( size));
...

> With this command: watch -n 0 "cat /proc/net/ip_queue" during my
> application running the biggest number of "Queue length" is 255.
>
> I don't understand it, because the "Queue max. length" is 2048.

See above. You should be able to increase the size of the socket
receive buffer in your userspace process without changing the length
of ip_queue's internal packet queue, but test that out to make sure.
You will probably need to run the process with root privileges to
change your socket receive buffer size, however.

--
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

