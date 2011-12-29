From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can't set default route for virtual interface
Date: Thu, 29 Dec 2011 16:53:58 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1112291650570.25460@frira.zrqbmnf.qr>
References: <op.v654qjz3x1lyi3@debiandesk2.net>  <1325029381.1672.38.camel@steve-pc>  <op.v66puobex1lyi3@debiandesk2.net> <1325067714.1672.691.camel@steve-pc>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1325067714.1672.691.camel@steve-pc>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andrew Beverley <andy@andybev.com>
Cc: Lloyd Standish <lloyd@crnatural.net>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Wednesday 2011-12-28 11:21, Andrew Beverley wrote:
>On Tue, 2011-12-27 at 23:36 -0600, Lloyd Standish wrote:
>> >Have you tried *not* using ifconfig to set up your interfaces? You
>> > should only be using iproute2.
>> 
>> I've seen that mentioned before, and I'm confused.  iproute2 means, for
>>  firewall code, "ip" and "tc" - is that right?
>
>Yes, and "ip" can do everything that all the various net-tools commands
>do.

...and more!

>>   I usually bring up interfaces with "ifup" when I can
>
>Ah, therein lies an interesting situation. ifup is pretty old too, and
>makes calls to the ifconfig command, which is a real pain.

More precisely: ifup is a distribution-specific script, not to be
confused with net-tools/iproute2 (different layer). In that regard,
its age may not mean anything.

ifup also refers to _multiple_ scripts; for example, openSUSE's ifup
uses iproute - since a looong time (therefore it is also old, but at
least it is current).
