From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: Need help on NAT
Date: Tue, 10 Feb 2004 07:17:37 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1076415456.2018.16.camel@ca.gts.nexusmgmt.com>
References: <002401c3ebb8$4d7ccc00$f301a8c0@Zamani>
	 <1076414843.4028c97b900c7@www.realdealz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1076414843.4028c97b900c7@www.realdealz.ch>
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
To: Fabian Hartmann <realdeal@realdealz.ch>
Cc: Saeed Zamani <szamani@tavanesh.com>, netfilter@lists.netfilter.org

On Tue, 2004-02-10 at 07:07, Fabian Hartmann wrote:
> hi Saeed
> There is an iptables patch called "nth" which allows you to match every Nth
> packet encountered. 
> That includes load-balancing such as you desire like every 4 received packet, 
> SNAT first to the ip of ISP1, the other three to the ip of ISP2.
> 
> i. e.:  iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
>              --every 4 --packet 0 -j SNAT --to-source $ISP1
>         iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
>              --every 4 --packet 1 -j SNAT --to-source $ISP2
>         iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
>              --every 4 --packet 2 -j SNAT --to-source $ISP2
>         iptables -t nat -A POSTROUTING -o eth0 -m nth --counter 7 \
>              --every 4 --packet 2 -j SNAT --to-source $ISP2
> 
> have a look at this
> http://cvs.netfilter.org/patch-o-matic-ng/nth/help?rev=1.2
> 
> It is available in the netfilter patch-o-matic base repository
> 
> ---
> Fabian Hartmann
> 
> realdeal@realdealz.ch
> www.realdealz.ch
That's much better than my suggestion! How does it interact with
conntrack? Will packets that belong to an existing session also be load
balanced? Thanks - John
-- 
John A. Sullivan III
Chief Technology Officer
Nexus Management
+1 207-985-7880
john.sullivan@nexusmgmt.com


