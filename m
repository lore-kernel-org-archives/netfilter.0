From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: problems with MAC address matching
Date: Mon, 30 Sep 2002 15:14:02 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209301414.g8UEECL04189@vulcan.rissington.net>
References: <5.1.0.14.2.20020927152856.056e1c10@poptop.llnl.gov>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.1.0.14.2.20020927152856.056e1c10@poptop.llnl.gov>
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

On Friday 27 September 2002 11:51 pm, Robert K. Johnson wrote:

> Hello,
>
> I am currently using netfilter that comes with the Linux kernel 2.4.3.

Can you tell us what version that is ?

iptables -v

> I am not able to update to a newer kernel version because the platform
> is an embedded device that has custom drivers specially created for
> use with the 2.4.3 kernel.  I have observed two problems with MAC
> address filtering:
>
> (1) broadcast packets that go out from the device and then back in do
> not contain a MAC address (according to log) and so fail the MAC check

I'm not sure what you mean by "come back in"...   Any packets from the 
machine to the same machine will go via the loopback interface, for which 
there is no MAC address.

What interface names do your log entries show for in= and out=?

> (2) large packets (1536 on the wire) do not contain a MAC address
> (according to log) and so fail the MAC check

Can you confirm this with an external packet sniffer (eg ethereal) ?

All packets *must* have a MAC address on them, otherwise they wouldn't get to 
their destination interface.....

> I was wondering if there are known problems that I may be able to fix in my
> version of netfilter.

Upgrading to a newer version would be a good idea.   You'll just have to sort 
out whether you can patch your existing kernel with a newer iptables, or if 
the custom device drivers can be persuaded to work with a current kernel.

2.4.3 really is old - according to http://www.kernel.org, 2.4.4 came out in 
April 2001, so I think you should try to get those device drivers less 
version-specific....

Antony.

-- 

In science, one tries to tell people
in such a way as to be understood by everyone
something that no-one ever knew before.

In poetry, it is the exact opposite.

 - Paul Dirac

