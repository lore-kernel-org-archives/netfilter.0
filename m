From: Amos Jeffries <squid3@treenet.co.nz>
Subject: Re: can't set default route for virtual interface
Date: Fri, 30 Dec 2011 00:27:28 +1300
Message-ID: <4EFC4EA0.9010403@treenet.co.nz>
References: <op.v654qjz3x1lyi3@debiandesk2.net>  <1325029381.1672.38.camel@steve-pc>  <op.v66puobex1lyi3@debiandesk2.net> <1325067714.1672.691.camel@steve-pc>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1325067714.1672.691.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Andrew Beverley <andy@andybev.com>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 28/12/2011 11:21 p.m., Andrew Beverley wrote:
> On Tue, 2011-12-27 at 23:36 -0600, Lloyd Standish wrote:
>>> Have you tried *not* using ifconfig to set up your interfaces? You
>>> should only be using iproute2.
>> I've seen that mentioned before, and I'm confused.  iproute2 means, for
>>   firewall code, "ip" and "tc" - is that right?
> Yes, and "ip" can do everything that all the various net-tools commands
> do.
>
>>    I usually bring up interfaces with "ifup" when I can
> Ah, therein lies an interesting situation. ifup is pretty old too, and
> makes calls to the ifconfig command, which is a real pain. However,
> unless someone tells me otherwise, I'm not aware of a replacement for
> it.

That would be ...

   ip link set dev eth0 up
   ip link set dev eth0 down

   :)

AYJ
