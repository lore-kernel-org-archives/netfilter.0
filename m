From: "Oliver Schulze L." <oliver@samera.com.py>
Subject: Re: Multiple port-fwd on same port  based on src IP
Date: Wed, 20 Sep 2006 15:18:41 -0400
Message-ID: <45119411.3050202@samera.com.py>
References: <000f01c6dce6$e1fb9d30$0101000a@tanjian>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000f01c6dce6$e1fb9d30$0101000a@tanjian>
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
To: Netfilter <netfilter@lists.netfilter.org>

Rob Sterenborg wrote:
> I'm not sure why you're using "-d INET_IP" (this box has multiple
> INET_IP's?), but IMO this would work (if your FORWARD chain is properly
> setup).
>   
Hi Rob,
the box has only 2 IPs, 1 Public, 1 Private.

Thanks for the comments, will try it.

Oliver

-- 
Oliver Schulze L.
Get my e-mail after a captcha test in: http://tinymailto.com/oliver


