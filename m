From: Philip Craig <philipc@snapgear.com>
Subject: Re: Port forwarding doesn't work.
Date: Mon, 13 Oct 2003 10:10:04 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F89ED5C.3050507@snapgear.com>
References: <LFEHKEBEBHAFGJBMNKAOKELACCAA.markee@bandwidthco.com> <1065994862.3562.10.camel@Marvin> <200310121604.06545.Herman@AerospaceSoftware.com> <200310121700.13102.Herman@AerospaceSoftware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200310121700.13102.Herman@AerospaceSoftware.com>
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
To: Herman@AerospaceSoftware.com
Cc: netfilter@lists.netfilter.org

Herman wrote:
> If I display the rules, I can't see any forwarding rules in the list, which 
> tells me that the forwarding rules that I try to implement are simply ignored 
> by iptables:
> 
> iptables -v -L

iptables defaults to listing the filter table.
If you want to list nat rules, you must specify the nat table:

iptables -t nat -v -L

-- 
Philip Craig - philipc@snapgear.com - http://www.SnapGear.com
SnapGear - Custom Embedded Solutions and Security Appliances


