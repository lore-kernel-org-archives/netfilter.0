From: Dhananjoy Chowdhury <dhananjoy@nucleussoftware.com>
Subject: Re: block port 137
Date: Tue, 03 Aug 2004 11:34:50 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1091513004.4660.34.camel@dc.nucleussoftware.com>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net><002401c4
	7917$d0a6fd70$858310ac@suarapembaruan.com>
Reply-To: dhananjoy@nucleussoftware.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: david <david@suarapembaruan.co.id>
Cc: netfilter@lists.netfilter.org

try dropping packets both with dport 137 and also with sport 137.



On Tue, 2004-08-03 at 10:37, david wrote:
> Dear all,
> How to block outgoing traffic over network that using port 137 udp,
> because my isp tell me that my network broadcast virus using port 137
> udp, i want to make all traffic (port 137) do go outside my network,
> so i plan to blocking that traffic from my gateway.
>  
> I already try to do this rules, but not working :
> #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP
>  
>  
>  
>  
> Regards,
> David Kandou


