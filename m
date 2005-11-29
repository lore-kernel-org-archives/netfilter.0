From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: remove duplicate rules
Date: Tue, 29 Nov 2005 14:28:06 -0500
Message-ID: <438CABC6.80309@SCampbell.net>
References: <FAC4E024BF776842876169173CE2F01313B14A@mailbox.vikus.com>
	<200511281750.30511.rob0@gmx.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200511281750.30511.rob0@gmx.co.uk>
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
To: netfilter@lists.netfilter.org

/dev/rob0 wrote:
> On Monday 2005-November-28 11:15, Derick Anderson wrote:
>   
>>>     I think you should manually check the existence of possible
>>>     duplicate before adding rule. Also you can do somethig like:
>>>
>>>     iptables -D INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>>>     iptables -A INPUT -d 192.168.0.2/32 -i eth1 -j DROP
>>>
>>>     Then you will never get duplicates.
>>>     But the first way is more correct.
>>>       
>
>   
>> Just don't use that method remotely.
>>     
>
> Sure, just do them as a single command separated by ";".
>   
It occurs to me that some rules may indeed be present multiple times in 
a table.  For instance VOIP QOS where you regularily take an action 
based on TOS fields on input and later alter the TOS fields and perhaps 
take that action again based on the same TOS field data in which case 
the above might cause one to remove the wrong rule!    IpTables is 
essentially a computer program, it is a sequence of events not just a 
unordered list of rules.  For myself, I would take much greater steps in 
the handling of rule insertion than just seeing if that rule exists 
somewhere in the INPUT table.  It may work fine for even the majority of 
iptable sets but it's definately not a universal solution.  The 
universal solution is to not put the extraneous rules in the table in 
the first place and, to do that programmatically, the iptables sets and 
the program altering the sets need to agree upon a structure that allows 
this. 




