From: Patrick McHardy <kaber@trash.net>
Subject: Re: Compiling 1.3.6
Date: Mon, 09 Oct 2006 18:02:49 +0200
Message-ID: <452A72A9.4060800@trash.net>
References: <BAY103-F13D1C1A680193B4FD7C978B2160@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F13D1C1A680193B4FD7C978B2160@phx.gbl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter-devel>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-devel-bounces@lists.netfilter.org
Errors-To: netfilter-devel-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Marco Berizzi <pupilla@hotmail.com>
Cc: netfilter@lists.netfilter.org, netfilter-devel@lists.netfilter.org, mysql.jorge@decimal.pt, pablo@netfilter.org

Marco Berizzi wrote:
> Pablo Neira Ayuso wrote:
> 
>> Pablo Neira Ayuso wrote:
>>
>>> Patrick McHardy wrote:
>>>
>>>> Pablo Neira Ayuso wrote:
>>>>
>>>>> min_ip and max_ip type has been changed from u_int32_t to __be32
>>>>> that is
>>>>> not defined in userspace, this breaks iptables compilation.
> 
> 
> I'm able to compile iptables 1.3.6 with 2.6.18 kernel
> headers without any errors.
> However iptables 1.3.6 + linux 2.6.19-rc1 kernel
> headers give me this error:

Does the patch I just sent fix it?

