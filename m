From: Matthew Schumacher <matt.s@aptalaska.net>
Subject: Re: ip_conntrack table is full with razor requests. Something isn't
 timing out.
Date: Tue, 01 Mar 2005 14:47:16 -0900
Message-ID: <4224FF04.90205@aptalaska.net>
References: <4224A715.8030907@aptalaska.net>
	<Pine.LNX.4.62.0503012324020.3992@L01.THNET>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.62.0503012324020.3992@L01.THNET>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Michael Tautschnig <michael.tautschnig@zt-consulting.com>
Cc: netfilter@lists.netfilter.org

Michael Tautschnig wrote:
> Hello!
> 
>>
>> Since upgrading to 2.6.10 I have been having problems with my 
>> ip_conntrack table filling up.  It appears it is full of razor 
>> (http://razor.sf.net) requests from my internal mail server.
>>
> So I'm not the only one with these problems - I can confirm this 
> completely. It's razor and kernel 2.6.10 here too.
> 
> [...]
> 
> It would be great, if somebody could help us - or tell us, what 
> information one should supply...
> 
> Thanks in advance,
> Michael

Michael,

Thanks for your note on this... looks like a netfilter bug to me.  Did 
you have any problems running 2.6.9?  I am looking at the diffs and it 
looks like there are a number of changes to the ip_conntrack code in 
2.6.10.  When reading though the changelog for 2.6.11-rc5 it doesn't 
appear that any of these issues are resolved, so I may have to go back 
to 2.6.9 if it is known to work.

schu

