From: "Thomas Kristensen" <Hyper@ubn.dk>
Subject: Re: Log every package incoming and outcoming.
Date: Fri, 20 Aug 2004 13:17:30 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <49885.80.164.248.134.1093000650.squirrel@krank.darknet.dk>
References: <44585.80.164.248.134.1092997944.squirrel@krank.darknet.dk>
        <20040820104140.GJ4818@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040820104140.GJ4818@metastasis.org.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Oki cool. Is it possible to specife the location of the log files? and how?


> On Fri, Aug 20, 2004 at 12:32:24PM +0200, Thomas Kristensen wrote:
>
>> i dont want a full system setup, i just need somekind og modul for
>> iptables, or a conf for iptables to log every thing.
>> The problem is if i set a rule, iptables will stop at a matching rule,
>> and therefor i cant set a log rule in the end for alle chains.
>>
>>
>> Any ideas?
>
> Start all your chains with a LOG rule.  Netfilter logs the packet and
> then passes it on to the next rule, so you'll get your matches, but the
> packet will continue to be processed.
>
> Why do you have to check every packet though?  If this is just to see
> who is using your servers the daemons themselves probably keep adequate
> logs.
>
>
> --
> "I think a church with a lightning rod shows a decided lack of
> confidence"



----------------------------------------------
DarkNet Webmail -http://webmail.darknet.dk



