From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Strange Problem - IPTables or Hardware related ????
Date: Mon, 21 Oct 2002 07:07:09 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DB40A0D.4090302@shorewall.net>
References: <5.1.1.6.0.20021018113106.00a91488@webmail.persogo.com.br>
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
To: Rodolfo Siviero Stein <rstein@persogo.com.br>
Cc: netfilter@lists.netfilter.org



Rodolfo Siviero Stein wrote:

> 
>     Anyone had a problem like this ?  Any comments ?  Is this hardware 
> related or software ?
> 

Do you have multiple NICs cabled to the same HUB/switch? In my experience, 
when people see packets arriving on unexpected interfaces, that is the 
cause. The manner in which the Linux kernel handles ARP "who-has" requests 
makes this type of configuration unsuitable for firewalling since any 
interface connected to the HUB/switch can respond to "who-has" requests 
for any of the addresses assigned to one of those NICs.

-Tom
-- 
Tom Eastep    \ Shorewall - iptables made easy
AIM: tmeastep  \ http://www.shorewall.net
ICQ: #60745924  \ teastep@shorewall.net


