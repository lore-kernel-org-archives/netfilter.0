From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: UDP forwarding: multiple targets
Date: Tue, 17 Feb 2004 12:16:04 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402171216.04825.Antony@Soft-Solutions.co.uk>
References: <002501c3f54e$4a6c94b0$0200a8c0@wobstation>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002501c3f54e$4a6c94b0$0200a8c0@wobstation>
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
To: netfilter@lists.netfilter.org

On Tuesday 17 February 2004 12:05 pm, Jan Kleinsorge wrote:

> Hi,
>
> I have a problem concerning UDP forwarding. My local network is connected
> to the internet. One of the local computers receives a constant stream of
> UDP data - this stream gets forwarded by a linux-based gateway. The
> situation now is as follows: I need to route a 'copy' of that stream to
> another local computer.
>
> Is it possible to forward to multiple targets ?

No.   Netfilter can change the destination of packets it sees, or it can stop 
them going anywhere, but it cannot send one packet to two or more places.

> Another way I thought of is to reset the header-information, creating
> broadcast-packets out of those unicasts.

You may well that setting up multicast (which is nothing to do with netfilter) 
is the best solution to this requirement.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


