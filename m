From: Wilson Mak <wilson.mak@digitalview.com>
Subject: Re: Port Forwarding with iptables
Date: Mon, 23 Aug 2004 11:04:21 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <41295EB5.50204@digitalview.com>
References: <412487B7.9090505@digitalview.com> <20040819112216.GN29471@metastasis.org.uk> <4125CD2E.7000108@digitalview.com> <20040820101557.GI4818@metastasis.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Nick Drage <nickd@metastasis.org.uk>
Cc: netfilter@lists.netfilter.org

Nick Drage wrote:

>On Fri, Aug 20, 2004 at 06:06:38PM +0800, Wilson Mak wrote:
>  
>
>>Nick Drage wrote:
>>    
>>
>
>Excuse the short answer...
>
>  
>
>>Thanks for all who help on this issue.  I mis-type the rule here.  Yes 
>>you guys are right, the rule should be: -d 10.1.0.12.  But still it 
>>doesn't work.  Do I need to enable something in the kernel when using 
>>Port-Forwarding?
>>    
>>
>
>Try:
>
>echo 1 > /proc/sys/net/ipv4/ip_forward
>
>If you google for that you should find an explanation :)
>
>  
>
Yap! I did set this bit to 1.  Any other stuffs I missed?  That's 
absolutely weird.  It used to work perfectly with ipchains plus 
ipmasqadm.  Actually, the packets did forward to the internal server ( I 
capture the packets with ethereal), but looks like the response packets 
can't get through the NAT box.

Thanks,
Wilson


