From: Zoup <Zoup@zoup.org>
Subject: Re: block port 137
Date: Tue, 3 Aug 2004 10:31:06 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408031031.10521.Zoup@zoup.org>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002401c47917$d0a6fd70$858310ac@suarapembaruan.com>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Monday 02 August 2004 21:07, david Wrote:
> Dear all,
> How to block outgoing traffic over network that using port 137 udp, because
> my isp tell me that my network broadcast virus using port 137 udp, i want
> to make all traffic (port 137) do go outside my network, so i plan to
> blocking that traffic from my gateway.
>
> I already try to do this rules, but not working :
> #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP
>
>
>
>
> Regards,
> David Kandou


you also have to use 
iptables -A FORWARD -p udp --sport 137 -j DROP 

-- 
The cost of living hasn't affected its popularity.

