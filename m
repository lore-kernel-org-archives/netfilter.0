From: cc <cc@kdtc.net>
Subject: Re: tcpdump and Iptables
Date: Fri, 03 Sep 2004 08:41:42 +0800
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4137BDC6.9070303@kdtc.net>
References: <41375ED1.5090400@kdtc.net>
	<20040902180705.GG3755@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040902180705.GG3755@metastasis.org.uk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Drage <nickd@metastasis.org.uk>, netfilter@lists.netfilter.org

Nick Drage wrote:

> On Fri, Sep 03, 2004 at 01:56:33AM +0800, CC wrote:
> 
> 
>>If I have iptables running and I do a tcpdump -i eth0,   at what point
>>is tcpdump listening to the connection?
> 
> 
> tcpdump will see the packets before IPTables does anything to them.
> 


Thanks NIck for the info.  Exactly what I wanted to know.

Edmund

