From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Trying to achieve fail over to multiple DNATed destinations
Date: Tue, 09 Aug 2011 14:57:51 -0500
Message-ID: <4E41913F.9080203@riverviewtech.net>
References: <CADCwhZk8VdOCKQ5QA_aEG_Z9naqfJvbjdd=MAR4Pk5R_L4-xHg@mail.gmail.com> <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CADCwhZm3JXpb=YMpsjWdd+tpwDtdUzOyKSwatpEzEX681=2tWA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 08/08/11 17:36, Mark Ruth wrote:
> The problem is that the target webserver (i.e. www.example.com ) is
> loadbalanced between like 10 servers having 10 public IPs (which are
> NOT in series), but since IPtables can not accept domain names
> (correct me if i m wrong) I have to select 1 ip address (i.e.
> 201.23.11.22 ) from the pool of 10 available, for my iptables rule.

It is my (mis)understanding that the iptables command will accept host 
names and resolve them to an IP which is inserted in to the kernel.  So, 
you are close.

> Now i want to handle this situation with some sort of failover rule
> that can forward users to next ip in list if 1st DOES NOT RESPOND for
> some reason. Another thing that I want to achieve is to distribute
> load between target's multiple servers rather then just 1 IP address,
> something as follows,
...
> I will highly appreciate if someone can help me out resolving this issue.

Have you done any looking at the Linux Virtual Server project 
(http://www.linuxvirtualserver.org/)?

I think you are using it a little backwards of what is normally done 
(in-to-out vs out-to-in) but I think it would still work.

I.e. you create a LVS on your CentOS box that uses the 10 real IPs out 
on the internet as the real servers.  LVS will then distribute the load 
between them and monitor their response times and know when to take one 
out of the pool based on lack of many different criteria (response time 
or lack of response).

I also think that LVS has an added advantage for you (unless memory is 
failing me, again) is that LVS runs in kernel space (much like IPTables) 
with a few user space commands to configure it, where as an application 
layer proxy would actually run in user space.

I've not messed with LVS in a long time, but from memory, I think it 
could be made to do what you are wanting to do.  Further, LVS was 
relatively trivial to install and configure.



Grant. . . .
