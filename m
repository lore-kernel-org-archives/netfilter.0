From: "Tyler J. Wagner" <tyler@tolaris.com>
Subject: Re: Trying to achieve fail over to multiple DNATed destinations
Date: Wed, 10 Aug 2011 10:01:03 +0100
Message-ID: <4E4248CF.6080701@tolaris.com>
References: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com> <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com> <4E41913F.9080203@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4E41913F.9080203@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On 2011-08-09 20:57, Grant Taylor wrote:
> On 08/08/11 17:36, Mark Ruth wrote:
>> The problem is that the target webserver (i.e. www.example.com ) is
>> loadbalanced between like 10 servers having 10 public IPs (which are
>> NOT in series), but since IPtables can not accept domain names
>> (correct me if i m wrong) I have to select 1 ip address (i.e.
>> 201.23.11.22 ) from the pool of 10 available, for my iptables rule.
> 
> It is my (mis)understanding that the iptables command will accept host
> names and resolve them to an IP which is inserted in to the kernel.  So,
> you are close.

Yes, it will. However, this will make loading your firewall rules block
on DNS. If you are loading the firewall as the interface comes up, that
may be a problem for you. For critical systems, especially routers, I
use only IP addresses in the firewall script.

Regards,
Tyler

-- 
"No one can terrorize a whole nation, unless we are all his accomplices."
   -- Edward R. Murrow
