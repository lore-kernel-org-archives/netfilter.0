From: John Haxby <john.haxby@oracle.com>
Subject: Re: memory leak after enabling bridge-netfilter
Date: Wed, 31 Mar 2010 11:20:24 +0100
Message-ID: <4BB321E8.2020300@oracle.com>
References: <k2w33dc67851003310202w5edcccdegf9c633174e2cc098@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <k2w33dc67851003310202w5edcccdegf9c633174e2cc098@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Ram Krishna <rkr393@gmail.com>
Cc: netfilter@vger.kernel.org

On 31/03/10 10:02, Ram Krishna wrote:
> I am running my linux box as a bridge. The kernel version is 2.6.18-3
> I have enabled bridge-netfilter and iptables. I am seeing a memory
> leak in the slab "size-64", even when I have not set any iptables
> rules.
> If I dont enable the bridge-netfilter and iptables kernel options then
> there is no memory leak in bridge mode.
>
> Is there any patch known to fix this memory leak? Appreciate any inputs on this.
>    

2.6.18-3 ?  Is that really a dash?  Is that a Red Hat kernel?  If so 
it's very, very old, probably RHEL5 beta.

If it is the RHEL5 kernel then it was released on 2007-01-16 and you 
really should be using something newer, if only to pick up the security 
fixes.  The slab leak bug was fixed long ago.

jch


