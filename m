From: "Nicolas Ross" <rossnick-lists@cybercat.ca>
Subject: Re: Altering a packet's port
Date: Tue, 22 Mar 2005 13:49:58 -0500
Message-ID: <041401c52f0f$f2aa2920$bf07a8c0@civicXp>
References: <002201c52e7e$4fe76950$6500a8c0@DEFIANT><1111490995.4267.18.camel@hubcap.ljm.dom><01a401c52eed$67fd5670$bf07a8c0@civicXp><Pine.LNX.4.60.0503220959020.6816@darkstar.sysinfo.com><Pine.LNX.4.60.0503221011390.6816@darkstar.sysinfo.com><01f501c52ef1$f0400290$bf07a8c0@civicXp><20050322181835.GA5763@ikkoku.ath.cx>
	<20050322182952.GB5763@ikkoku.ath.cx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Toby <tobia.conforto@linux.it>, netfilter@lists.netfilter.org

> Nicolas Ross wrote:
>> In my nat table I have:
>>
>> -A PREROUTING -s 192.168.7.0/24 -d e.f.g.h -p tcp --dport 22 \
>> -j DNAT --to-destination e.f.g.h:8022
>
> Wait, maybe I missed something.
>
> Are you sure e.f.g.h and e.f.g.h:8022 are the same IP address in the
> rule above?  Also is e.f.g.h in the 192.168.7.0/24 network?
> Is e.f.g.h the router itself?

I'll just recap a little, for my own benefit, and your all also...

I have a local office subnet (192.168.7.x), wich is behind a netfilter linux 
firewall/router

192.168.7.x/24 -> iptables/router  SNAT --to-source a.b.c.d  -> internet

e.f.g.h in my quoted example above, isn't related at all with the router 
(which is a.b.c.d on the internet).

The goal of all this, is to use regular, port 22, sshd on all my servers 
(i.e. outside of my local office subnet), and enforce more secure login 
policies in sshd config. For my "trusted" local office subnet, I have a less 
secure login policies in my sshd confg on port 8022. But I want users in my 
local to ssh out on port 22, and transparently redirect them to port 8022...

Nicolas 


