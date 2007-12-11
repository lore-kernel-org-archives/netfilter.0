From: Martijn Lievaart <m@rtij.nl>
Subject: Re: interfaces in /proc/net/ip_conntrack
Date: Tue, 11 Dec 2007 11:03:40 +0100
Message-ID: <475E607C.2010101@rtij.nl>
References: <26618.83.227.11.237.1197308966.squirrel@mh.linnea.com>    <475DCD66.5080102@rtij.nl> <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <29992.83.227.11.179.1197360181.squirrel@mh.linnea.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: oscar@linnea.net
Cc: netfilter@vger.kernel.org

Oscar N wrote:
> The whole idea was to create multiple firewalls of one linuxbox, not only
> 2 but 20 or something like that.
>
> One solution is ofcourse to don't run connection tracking at all, but it
> would be nice to get it to work. Do anyone know if this would be way to
> much work to implement? Otherwise I might get some time over to play with
> this.
>
> /Oscar
>   

Have a look at User Mode Linux (UML). It allows to run virtual machines 
with the least overhead of all virtaul machine mechanisms I know. I have 
no idea how you have to do the plumbing to get the right packets to the 
right VM, but I think it can be done.

M4

