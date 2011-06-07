From: Erik Schorr <erik-lists@arpa.org>
Subject: Re: ipv6 link local address
Date: Tue, 07 Jun 2011 02:24:59 -0700
Message-ID: <4DEDEE6B.9000303@arpa.org>
References: <92A9C99A1E5FF14F8538DDEE14996A5203341F@chp-exg.coxhp.com> <1307429067.7853.1.camel@hakkenden> <4DEDCE11.3090004@arpa.org> <alpine.LNX.2.01.1106071102460.25037@frira.zrqbmnf.qr>
Reply-To: erik-lists@arpa.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1106071102460.25037@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Jan Engelhardt <jengelh@medozas.de>

On 06/07/2011 02:04 AM, Jan Engelhardt wrote:
>
> On Tuesday 2011-06-07 09:06, Erik Schorr wrote:
>>
>>> You can turn off ipv6 on interfaces. This should not prevent bridging
>>> ipv6, but will remove any ipv6 logic from them.
>>
>> I wish I'd known this.  Could you give an example of how to remove ipv6
>> functionality from an interface?  I think this was the only thing preventing me
>> from unloading an accidentally-loaded ipv6.ko module.
>
> There are no accidents. It's your userspace which triggers it loading.
> And what is it actually that you are trying to fix? It smells more
> like you have a bug in your environment.

On most Linux distributions and default installations, the ipv6 module 
gets automatically loaded either on startup or when certain utilities 
try to probe ipv6 entities or test for ipv6 connectivity, even when you 
haven't configured any ipv6 interfaces.  It's nice to be able to unload 
the module to free up memory and make netstat and other programs' output 
prettier.  Prettier in the way that you don't have extraneous output 
that's meaningless when there are no ipv6 addresses configured.

It's impossible to unload the ipv6 module when there's even one 
interface with ipv6 functionality enabled, even when the interface is 
administratively disabled/shutdown.

-- 
Erik Schorr KD6AUT
Advocate and Consultant
VMware/Iptables/Exim/Perl
