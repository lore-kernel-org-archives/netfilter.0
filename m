From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: Stateful packet inspection
Date: Fri, 04 Mar 2005 17:03:55 +0100
Message-ID: <422886EB.8030804@lopsch.com>
References: <0ead01c520d0$cfbc2eb0$b000a8c0@cybergeneration.com>
	<Pine.LNX.4.62.0503041645370.8328@L01.THNET>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <Pine.LNX.4.62.0503041645370.8328@L01.THNET>
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

Michael Tautschnig schrieb:
>>
>> I have been asked if iptables support
>> stateful packet inspection.
>>
>> i.e. verify if traffic on port 21 is FTP
>> and not HTTP (correct me if I'm using the wrong
>> term)
>>
>> Is there any module or development about this ?
>>
> 
> http://l7-filter.sourceforge.net/
> 
> Regards,
> Michael
> 
> 
I thought SPI means inspecting packets for their state i.e. NEW or 
ESTABLISHED. What you mean is a Layer 7 filter, the link to it was 
posted above ;).

