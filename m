From: Linux at Michael Kollmitzer <linux.kollmitzer@inode.at>
Subject: Re: Weird HTTP connection issue
Date: Tue, 15 Nov 2005 20:38:34 +0100
Message-ID: <1132083514.5251.17.camel@Osgiliath>
References: <FAC4E024BF776842876169173CE2F01309A5F9@mailbox.vikus.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <FAC4E024BF776842876169173CE2F01309A5F9@mailbox.vikus.com>
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

On Mon, 2005-11-14 at 13:21 -0500, Derick Anderson wrote:
> I've got a weird HTTP connection issue with a particular site and I'm
> wondering if anyone here can lend some help. It appears to be a
> fragmentation issue, and I suspected our firewall (which I did not
> write, and am in the process of completely re-doing), since the site
> loads much faster from my home connection (Charter cable). However, our
> test machine at work (completely outside the firewall, stock Linksys
> WRT54G for a router) has the same issue.
>  
> A summary of what happens is this:
>  
> 1. Client (me) requests the index page from Server 1.
> 2. Server 1 (not related to Servers 2 and 3) acknowledges the request
> and sends a frameset containing a single HTML frame, the source of which
> is Server 2.
> 3. Client acknowledges the transfer.
> 4. Server 1 closes the connection.
> 5. Client requests frame source from Server 2 (one of the problem
> servers).
> 6. Server 2 acknowledges the request but sends no data. All of this
> happens within half a second.
> 7. 75 seconds later, Server 2 and Server 3 (the other problem server)
> start sending data for 4 more seconds - Client acknowledges all data.
> 8. Data transfer is interrupted again for about 16 seconds, after which
> one of data connections is closed.
> 9. 31 seconds later Server 2 resets the connection that was closed in
> #8.
> 10. 24 seconds later Client resets a connection from Server 3, which was
> never closed properly. Client waited 75 seconds before resetting the
> hung connection.
> 11. 20 seconds later Client resets a connection from Server 2. Client
> waited 75 seconds for data which it finally received from Server 2, and
> another 15 seconds before Server 2 closed the connection.
> 
> I've Googled the 75 second delay and it seems that TCP times out 75
> seconds after a SYN if no response is received.
> 
> I've attached a summary of an Ethereal capture of the whole bit. If
> needed I'll post the iptables-save of the firewall script (which the
> list told me was too big to include with the rest of this).
> 
> Thanks in advance for any help,
> 
> Derick Anderson


i had a similar problem like you described once. it didn't have anything
to do with the firewall at all. i've just set mtu/mru to 1492 on one of
our routers and everything seemed to work fine. we just were not able to
connect to one server anymore (we had changed so many things in the
network then that we couldn't figure out where the problem came from.
the firewall logs showed nothing at all). it turned out to be something
like this:

client sends syn to server
server sends ack syn back
client sends ack
and then, no data packets come in and just because these packets had
1500 bytes size and the router in between refused these packets.

i hope that helps. good luck :)

Michael




