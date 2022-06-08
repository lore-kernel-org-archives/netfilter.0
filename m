From: Chris Hall <netfilter@gmch.uk>
Subject: Re: Possibly dangerous interpretation of address/prefix pair in -s
 option
Date: Wed, 8 Jun 2022 11:38:24 +0100
Message-ID: <c4a18871-d4e7-ce65-eaaa-55c58b230077@gmch.uk>
References: <mail.629a20b0.7e37.7f80bf761b5d8a04@storage.wm.amazon.com>
 <010201812a0fb624-e64464be-4c31-4d01-afb6-1cbfab70e333-000000@eu-west-1.amazonses.com>
 <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-GB
In-Reply-To: <60e26dbd-93a8-1c2a-5204-66bbdffb1291@thelounge.net>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Reindl Harald <h.reindl@thelounge.net>

> Am 03.06.22 um 16:54 schrieb Stefan Riha:
>> I'm a beginner and noticed than when I do e.g.
>>
>> iptables -A INPUT ... -s 10.0.0.2/24 ...
>>
>> this gets interpreted as "allow from source 10.0.0.0/24" i.e. from the 
>> entire network. I think it would be more beginner-proof if iptables 
>> would interpret this as incorrect input and error. Or at least, 
>> interpret 10.0.0.2/24 as 10.0.0.2/32. So if there is incorrect input, 
>> and that input is automatically re-interpretet (which in itself is 
>> unsafe, I would think), then at least interpret it in the way that is 
>> more restrictive (i.e. single IP instead of subnet). Otherwise I like 
>> iptables a lot, thanks for all the great work!

The iptables(8) Linux manual page says:

        [!] -s, --source address[/mask][,...]

               Source specification. Address can be either a network
               name, a hostname, a network IP address (with /mask), or a
               plain IP address. ....

For input such as "-s 10.0.0.2/24", the 10.0.0.2 simply isn't a valid 
network address for a /24 network.

I agree: the parser should detect invalid input and reject it.  I can 
see no good reason for being sloppy here.

On 03/06/2022 16:21, Reindl Harald wrote:
> sorry - garbage in - garbage out
> that's how netmasks are working

Except that in this case the iptables command parser could trivially 
have detected the 'garbage in' and rejected it instead of generating 
'garbage out'.

It can be argued that it is too late to fix the parser, on the basis 
that this could stop existing configurations from working.  But that 
doesn't mean that the parser is not broken.

 > you are supposed to review your inputs and the final ruleset

Sure, but it takes quite careful reading of the man page to discover 
that 10.0.0.2/24 is undefined.  Worse yet, iptables then does something 
undefined (AFAICS) :-(

Once you are thoroughly used to how something works, it's easy to become 
convinced that what it does is *obvious* and *right*.  Sometimes it 
takes someone with a different perspective to see the problem.

The emperor is suffering a wardrobe malfunction.

Chris
