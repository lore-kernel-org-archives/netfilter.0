From: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Subject: Re: ip_conntrack table is full with razor requests. Something	isn't
 timing out.
Date: Wed, 2 Mar 2005 18:15:16 +0100 (CET)
Message-ID: <Pine.LNX.4.62.0503021812120.4923@L01.THNET>
References: <4224A715.8030907@aptalaska.net>
	<Pine.LNX.4.62.0503012324020.3992@L01.THNET>
	<4224FF04.90205@aptalaska.net>
	<1109758459.3574.10.camel@nienna.balabit>
Mime-Version: 1.0
In-Reply-To: <1109758459.3574.10.camel@nienna.balabit>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: KOVACS Krisztian <hidden@sch.bme.hu>
Cc: netfilter@lists.netfilter.org, Matthew Schumacher <matt.s@aptalaska.net>

>>
>> Thanks for your note on this... looks like a netfilter bug to me.  Did
>> you have any problems running 2.6.9?  I am looking at the diffs and it
>> looks like there are a number of changes to the ip_conntrack code in
>> 2.6.10.  When reading though the changelog for 2.6.11-rc5 it doesn't
>> appear that any of these issues are resolved, so I may have to go back
>> to 2.6.9 if it is known to work.
>
>  Could you try whether or not the following patch fixes your problem?
>
> https://lists.netfilter.org/pipermail/netfilter-devel/2004-December/017908.html
>
Thanks - it seems as if it did the trick! Connections are set up properly 
and marked as CLOSE afterwards, and cleaned out properly. Great!

Thank you very much,
Michael

