From: Feizhou <feizhou@linuxmail.org>
Subject: Re: Large number of repeated rules with only differing -s ipaddrs/cidrs
Date: Mon, 19 Apr 2004 21:44:29 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <4083D7BD.9090504@linuxmail.org>
References: <4083A3B2.7020808@linuxmail.org> <20040419114219.GC10272@home.manuelm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040419114219.GC10272@home.manuelm.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Frank Gruellich <frank@home.manuelm.org>
Cc: netfilter@lists.netfilter.org

Frank Gruellich wrote:
> Hello,
> 
> * Feizhou <feizhou@linuxmail.org> 19. Apr 04:
> 
>>I have a whole bunch of ips/cidrs that I want to apply the rule to.
> 
> 

> 
> Maybe you (or I) can write a script generating these rules.  Uh, this
> looks funny.  Any comments on this?

:) Like you said, it looks funny.

I've thought of something like that...we would just stuff the kernel 
with the rules...

Being able to do a -s or -d against a file lookup is much cleaner.

