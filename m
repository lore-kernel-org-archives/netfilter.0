From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: question on extern exec prog with iptables.
Date: Sat, 15 Nov 2008 01:04:44 -0600
Message-ID: <491E748C.10802@riverviewtech.net>
References: <1226731090.4215.39.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1226731090.4215.39.camel@lya14-2-82-232-125-204.fbx.proxad.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 11/15/2008 12:38 AM, sebastien wrote:
> The problem is that iptables or ip6tables won't be natively able to 
> send me the original destination client's address and port of 
> server's answer : am I wrong ? iptables and ip6tables will form a new 
> address and port destination and that'all.

Why not?  (See below.)

> If so, I need a way to send the exact port of the original packet to 
> the corrective program : the one which will desserve transparently 
> the client called by ? ... iptables or ip6tables.

I think you will probably be best served by (I believe) the QUEUE target 
that allows IPTables to pass complete packets to user space for processing.

> Does iptables and ip6tables modules can do this ? Call a extern 
> program with the full packet content of the server.

I think if you use the QUEUE target you will be able to pass packets 
(which ever ones you want) to your ""correction program, including all 
source / destination IP and port information.  With this information you 
should be able to process the packets as you see fit and then generate a 
new reply packet.



Grant. . . .
