From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NAT problem
Date: Mon, 21 Oct 2002 16:15:55 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210211516.g9LFG0L32087@vulcan.rissington.net>
References: <20021021130413.79139.qmail@web12906.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021021130413.79139.qmail@web12906.mail.yahoo.com>
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
To: nf <netfilter@lists.samba.org>

On Monday 21 October 2002 2:04 pm, saravanan sakthi wrote:

>   Here is my sinario...

 [ Large Ascii-art diagram snipped for brevity ]

This network setup simply will not work sensibly.

You have the following networks connected to each other:

10.1.1.0/16
10.1.11.0/16
10.1.9.0/16
10.1.12.0/16
10.0.0.0/8

There is no sane way you can get the network addresses, all with a /16 
netmask, to communicate.   Every one of the /16 networks has 10.1.0.0 as its 
network address, and 10.1.255.255 as its broadcast address.   Yoou routers 
simply will not know what to do.

Also, the final network you listed, 10.0.0.0/8, covers all the other networks 
combined - I don't know whether to say this is just as bad as the first four, 
or even worse:-)

To summarise - before you start playing around with netfilter and trying to 
control what *isn't* allowed through your routers (after all, that's what 
netfilter is - a packet filter which doesn't allow some packets through which 
otherwise would get routed), please create a network setup where you have 
differen subnets on each segment, and it is possible to create some routing 
tables which will work.

As a first suggestion, changing all your netmasks to /24 would appear to do 
the trick.

Antony.

-- 

Never write it in Perl if you can do it in Awk.
Never do it in Awk if sed can handle it.
Never use sed when tr can do the job.
Never invoke tr when cat is sufficient.
Avoid using cat whenever possible.

