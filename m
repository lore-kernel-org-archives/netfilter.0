From: "Lloyd Standish" <lloyd@crnatural.net>
Subject: Re: can't set default route for virtual interface
Date: Tue, 27 Dec 2011 23:36:14 -0600
Message-ID: <op.v66puobex1lyi3@debiandesk2.net>
References: <op.v654qjz3x1lyi3@debiandesk2.net>
 <1325029381.1672.38.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1325029381.1672.38.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed	delsp=yes"
To: Andrew Beverley <andy@andybev.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Tue, 27 Dec 2011 17:43:01 -0600, Andrew Beverley <andy@andybev.com> wrote:

> On Tue, 2011-12-27 at 17:32 -0600, Lloyd Standish wrote:
>> + ip route add default via 192.168.2.1 table T1
>> RTNETLINK answers: No such process
>This normally means that the kernel doesn't think that 192.168.2.1 is a
> valid address. Is that IP address definitely set up by that point in the
> script?

Thanks for the heads-up - yes, 192.168.2.1 was set-up.  After adding the "dev" as Brian Austin suggested, the route was added. :)

>Have you tried *not* using ifconfig to set up your interfaces? You
> should only be using iproute2.

I've seen that mentioned before, and I'm confused.  iproute2 means, for firewall code, "ip" and "tc" - is that right?  I usually bring up interfaces with "ifup" when I can, since that sets the interface address specified in /etc/network/interfaces, whereas "ifconfig <if> up" doesn't.

I notice that after adding the Debian "vlan" package, ifup and ifdown appear to bring virtual interfaces up and down OK.  But ifup/down are not part of iproute2, right?  Do you know of any vlan problem with  ifup/down?  Sometimes interfaces can't be taken down with "ifdown," and I have to use ifconfig.

--
Lloyd
