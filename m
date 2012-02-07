From: Rick Jones <rick.jones2@hp.com>
Subject: Re: netfilter performance dependent on arch
Date: Tue, 07 Feb 2012 10:23:24 -0800
Message-ID: <4F316C1C.5020400@hp.com>
References: <20120207183453.522fa74b@catus>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120207183453.522fa74b@catus>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Marek Kierdelewicz <marek@piasta.pl>
Cc: netfilter@vger.kernel.org

On 02/07/2012 09:34 AM, Marek Kierdelewicz wrote:
> Hi,
>
> Can anyone point me to some performance comparison of netfilter on i686
> and x86_64? I have a few linux routers doing a lot of firewalling and
> QoS. Currently those routers use i686 arch on 64-bit hardware. Would I
> notice any performance gain after moving to 64-bit kernel?

Apart from the obvious "Try it on your workload and see." suggestion, 
you could I suppose make the assumption that a netfilter workload looks 
similar to one or more components of something like 
SPECint_rate_base2006 or SPECint_base2006 and mine the results on 
www.spec.org for some comparisons between 32 and 64 bit compiles on the 
same chip(s).  Probably want something with lots of control flow (term?) 
rather than loops and such.  A high-level description of the integer 
components can be found at http://www.spec.org/cpu2006/CINT2006/ . One 
of my first guesses would be 400.perlbench and 403.gcc but definitely 
peruse the descriptions of all of them.

rick jones
