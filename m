From: Banszki Gabor <banszki.gabor@chello.hu>
Subject: Re: queue buffer size increasing howto?  -  solved
Date: Tue, 07 Sep 2004 18:30:26 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094574626.15915.4.camel@debian>
References: <1093182015.17276.24.camel@debian>
	<876ef97a0408220750591cc852@mail.gmail.com>
	<1094285774.6293.44.camel@debian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1094285774.6293.44.camel@debian>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

Hi everybody!

I solved the problem by using pthread.h

The main thread in my process is reading from the queue buffer and open
new threads for the long time tasks.

In this case I don't need to increase the buffer size of the netlink
socket.

G.




On Sat, 2004-09-04 at 10:16, Banszki Gabor wrote:
> Hi Everybody!
> 
> Thank for answer of Tobias!!
> 
> I could get the buffer size by the getsockopt (107520).
> 
> After this I was able to increase the size of buffer to 215040 by your
> suggestion:
> 
>    int size, size_len;
>    size_len = sizeof(size);
>    rv = getsockopt (fd, SOL_SOCKET, SO_RCVBUF, &size, &size_len); 
>    printf ("Oldsize of buffer: %i \n",size); { I've got 107520)
> 
>    size = 1256000;
>    rv = setsockopt (fd, SOL_SOCKET, SO_RCVBUF, &size, size_len); 
> 
>    rv = getsockopt (fd, SOL_SOCKET, SO_RCVBUF, &size, &size_len); 
>    printf ("New size of buffer: %i \n",size); ( I've got 215040 )
> 
> After this I can see the same situation with this command....
> 
>  watch -n 0 "cat /proc/net/ip_queue"
> 
> ...like earlier... 
> The maximum number is around 252 - 258, and I still get the netlink
> error message "No buffer space....."
> 
> I think it didn't help... Why?
> Maybee I should increase the SO_RCVBUF by more? But how?
> 
> Thnx..
> other tasks 
> G.
> 
> On Sun, 2004-08-22 at 16:50, Tobias DiPasquale wrote:
> > On Sun, 22 Aug 2004 15:40:16 +0200, Banszki Gabor
> > setsockopt(2):
> > 
> > int fd, rv, size = LARGE_SOCKET_BUFFER;
> > 
> > fd = socket( PF_NETLINK, SOCK_RAW, NETLINK_FIREWALL);
> > rv = setsockopt( fd, SOL_SOCKET, SO_RCVBUF, &size, sizeof( size));
> > ...
> > 
> > > With this command: watch -n 0 "cat /proc/net/ip_queue" during my
> > > application running the biggest number of "Queue length" is 255.
> > > 
> > > I don't understand it, because the "Queue max. length" is 2048.
> > 
> > See above. You should be able to increase the size of the socket
> > receive buffer in your userspace process without changing the length
> > of ip_queue's internal packet queue, but test that out to make sure.
> > You will probably need to run the process with root privileges to
> > change your socket receive buffer size, however.
> 

