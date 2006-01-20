From: "John Lumby" <johnlumby@hotmail.com>
Subject: vpn masquerading
Date: Fri, 20 Jan 2006 13:04:22 -0500
Message-ID: <BAY108-F1522810B0AD54025B1AA15A31F0@phx.gbl>
References: <BAY0-MC3-F19Zs3JcXu00035e65@bay0-mc3-f19.bay0.hotmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY0-MC3-F19Zs3JcXu00035e65@bay0-mc3-f19.bay0.hotmail.com>
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
To: netfilter@lists.netfilter.org


>well... the problem is when two , or more lan hosts want to access
>same vpn server with pptp "microsoft vpn protocol"
>Only one host can connect to VPN simultaneously

Some vpn servers do not allow more than one connection from the same client 
address.   Reason being that the vpn server tracks each connection based on 
source address ands gets confused if it gets two from the same.   Your two 
lan machines both appear to the vpn server as the same machine (same source 
IP address).   Something to check.

John



