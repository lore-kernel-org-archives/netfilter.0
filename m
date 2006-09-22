From: "Marco Berizzi" <pupilla@hotmail.com>
Subject: RE: Kernel 2.6.18 and quota match
Date: Fri, 22 Sep 2006 17:26:02 +0200
Message-ID: <BAY103-F17F1A57863422A66812347B2210@phx.gbl>
References: <BAY108-F2081F7D5BC4C3ADEE0D5CEBC210@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY108-F2081F7D5BC4C3ADEE0D5CEBC210@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: uncystu@hotmail.com
Cc: netfilter@lists.netfilter.org

>Thanks for your reply.  I have tried both the standard download available 
>from the netfilter website (dated 1st Feb 2006) and iptables snapshot 
>(20060902) with no difference.

mhhh...
This is my extensions test result:

Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:dccp IPv4:quota 
IPv4:recent IPv4:statistic IPv4:string IPv6:REJECT IPv6:ah IPv6:esp 
IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt

When you compile iptables snapshot are you able to see IPv4:quota?
If you don't see it, you should update your kernel headers to 2.6.18



