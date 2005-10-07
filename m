From: Sorin Panca <sorin.panca@gmail.com>
Subject: Re: How would this help my LAN / network
Date: Fri, 07 Oct 2005 19:40:07 +0300
Message-ID: <4346A4E7.3040106@gmail.com>
References: <20051007162420.D0AB269B0D@smtp.sterenborg.info>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051007162420.D0AB269B0D@smtp.sterenborg.info>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi Rob,

Rob Sterenborg wrote:
>>>I just came across one of the threads on the LARTC.
>>>In the thread it had this.
>>>
>>>So my question is, for the following rules, would these increase my
>>>browsing / traffic, and if so, how.
>>>
>>
>>Small packets and control pachets should have priority
>>because they carry intrractive traffic.
> 
> 
> Is it true that the upstream (ISP) routers have to support TOS for this
> to work ?
Yes, that is true. But the linux default qdisc (queuing discipline) for
network interfaces is  pfifo_fast, which priorize interractive traffic.
I assume that they use linux on their routers. I am curious if this is a
correct assumption and in what percentage.
> 
> 
> Gr,
> Rob
> 
> 
> 

