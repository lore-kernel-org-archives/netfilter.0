From: Patrick Maartense <patrick@patrick.at>
Subject: Re: hostname forwarding
Date: Wed, 11 Dec 2002 16:06:53 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0212111606240.17876-100000@www.csbenter.at>
References: <p04330105ba1cf39a28eb@[80.9.157.3]>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <p04330105ba1cf39a28eb@[80.9.157.3]>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: bernard <bernard@gers.net>
Cc: netfilter@lists.netfilter.org

this is not possible using ipotables

Apache however can very well handle this ..


On Wed, 11 Dec 2002, bernard wrote:

> I'm using iptables to redirect external requests depending on their 
> port/protocol like this :
> 
> 	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
> 	hostname B:80 -> public ip -> iptables -> 192.168.1.1:80
> 
> It works pretty well, thanks to iptables :-)
> 
> Now I want to redirect on a hostname basis on different private ip's 
> like this :
> 
> 	hostname A:80 -> public ip -> iptables -> 192.168.1.1:80
> 	hostname B:80 -> public ip -> iptables -> 192.168.1.2:80
> 
> Does anyone know a solution ?
> 
> Thanks for your help.
> 
> Bernard
> 

-- 
---
Kind Regards
Patrick Maartense (using Pine on a Text Console)



