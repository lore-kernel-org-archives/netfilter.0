From: Micha Silver <micha@arava.co.il>
Subject: Re: AW: a NAT question
Date: Fri, 16 Jul 2004 11:51:54 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F7972A.9060306@arava.co.il>
References: <7A89E0296B649C4AAFD251222B1492906C4FD8@dmsbsrv1.intranet.dmsb.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A89E0296B649C4AAFD251222B1492906C4FD8@dmsbsrv1.intranet.dmsb.de>
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
To: Payal Rathod <payalrathod@gmail.com>
Cc: netfilter <netfilter@lists.netfilter.org>


>>Hi,
>>We have been allocated 2 more IPs by our ISP for a period of 1 month
>>for our purpose. Now these 2 IPs will be assigned to 2 Windows
>>machines which are to be accessed from outside. We want port 21 or one
>>machine to be accessed from outside and port 80 and 9001, 25 of other
>>machine. Which is the best way to allow access to these machines from
>>outside still having them under my firewall? I thought of having ip
>>aliases on the Linux box and forwarding the connections to the
>>respective windows box.
>>Can someone explain an easy way for this?
>>With warm regards,
>>-Payal
>>    
>>
Payal:
Have you tried Shorewall? http://www.shorewall.net
You can do it with either DNAT or proxy arp.
Shorewall makes jobs like this quite simple and easy to understand.

--Micha


