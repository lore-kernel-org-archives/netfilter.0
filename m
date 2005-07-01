From: Daniel Lopes <lopsch@lopsch.com>
Subject: Re: MAC filter group if IPs
Date: Fri, 01 Jul 2005 19:07:51 +0200
Message-ID: <42C57867.3080806@lopsch.com>
References: <421bd79421c0b2.421c0b2421bd79@vsnl.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <421bd79421c0b2.421c0b2421bd79@vsnl.net>
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

varun_saa@vsnl.net schrieb:
> Hello, 
>       I would like to implement MAC filtering. 
> Is there way to write a rule that will allow or 
> disallow a set of IPs. 
> Say one rule to allow a set of IPs, 
> And another rule to disallow a set of IPs. 
>  
> Thanks 
>  
> Varun 
> 
> 
> 

Have a look at IPSet.

