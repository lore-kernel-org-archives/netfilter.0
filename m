From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: SNAT question
Date: Fri, 20 Feb 2004 21:05:23 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402202105.23417.Antony@Soft-Solutions.co.uk>
References: <40366adb.53af.0@arbbs.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40366adb.53af.0@arbbs.net>
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

On Friday 20 February 2004 8:15 pm, John Black wrote:

> Everything works, when i do the lazy way and go to the web page
> www.whatismyipaddress.com.
>
>
> but my question is when i went to the MS chat room, it was showing me the
> 192.168.x.x ipaddress.
>
> why is this?

Because Microsoft always do things differently from everyone else :) ?


No, seriously though, some protocols embed the IP address of the machines 
which are communicating inside the data which is transferred, so each end 
knows what the other end's true IP address is, even if this then means they 
can't talk to each other because one or both ends has an unroutable address.

As far as I'm aware MS Chat is one of these protocols, although I've certainly 
never used it myself.


One thing you should be aware of is that if you use such a protocol to test 
your network / firewall setup, then you should count yourself lucky that it 
appears to work at all.   Many such protocols (which network people refer to 
as embedding OSI layer 3 data inside OSI layer 7 packets) simply do not work 
across NAT at all.

Hope this helps clarify your confusion.

Regards,

Antony.

-- 
There's no such thing as bad weather - only the wrong clothes.

 - Billy Connolly

                                                     Please reply to the list;
                                                           please don't CC me.


