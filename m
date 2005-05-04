From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: matching the first packet of a connection
Date: Wed, 04 May 2005 20:11:11 +0200
Message-ID: <4279103F.9080601@lopsch.com>
References: <1115220105.26791.25.camel@localhost.localdomain>
	<42790CF3.9090801@buddhalinux.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42790CF3.9090801@buddhalinux.com>
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

Thomas Jones schrieb:
> Eric Leblond wrote:
> 
> 
>>Hi,
>>
>>I'm trying to match the first packet of a connection : for a TCP
>>connection I want to match the first SYN packet received by the firewall
>>and ignore the possible reemission, in fact I want to accept them.
>>
>>Is this possible ?
>>
>>I've try to use the conntrack module but I was not successful.
>>
>>BR,
>> 
>>
> 
> The "tcp filter" Table Match Operations provide:
> 
> -p tcp --syn
> 
> Thomas
> 
> 
or something like this:
-p tcp --tcp-flags ALL SYN -m state --state NEW


