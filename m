From: Srinivasa T N <seenutn@linux.vnet.ibm.com>
Subject: Re: Block an IP
Date: Mon, 31 Jan 2011 10:47:35 +0530
Message-ID: <4D4645EF.7010004@linux.vnet.ibm.com>
References: <BAY148-w49B627F2E93301ED140FEFA3E30@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <BAY148-w49B627F2E93301ED140FEFA3E30@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On Sunday 30 January 2011 01:32 PM, Cory McPherson wrote:
>
>
> Hello,
>
> I'm new to iptables and would like to block an IP. How do I achieve that? More specifically, I'd like to block it from accessing a specific port
> but other ports should be accessible to that IP... Can someone give me an example?
>
> Thanks
>
> PS: please CC me as I'm not subscribed to the list.
>   		 	   		  --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>

Assuming your protocal is tcp:

iptables -A INPUT p- tcp --source <IP Address> --dport <Port No.> -j REJECT

Regards,
Seenu.
