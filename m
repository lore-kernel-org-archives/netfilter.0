From: Przemek <przemek@skyline.ltd.pl>
Subject: Re: How to DROP ip from behind NAT
Date: Wed, 16 Nov 2005 22:57:32 +0100
Message-ID: <20051116225732.7c46c499@nasa.one.pl>
References: <20051116020723.2109624e@nasa.one.pl>
	<1132175157.10830.8.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1132175157.10830.8.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Wed, 16 Nov 2005 15:05:57 -0600
Matt Zagrabelny <mzagrabe@d.umn.edu> wrote:
> can YYY.YYY.YYY.YYY be on the same network as M2 (10.1.1.2) ?
> if it is out on the internet, then block it in the FORWARD chain of
> the filter table on M1.
> 
> ps. your notation is a little confusing. perhaps use the following
> notation:
> 
> ip:port -> ip:port (absence of port denotes any port)
> 
> for example, what i think you meant above would be you want to block
> 10.1.1.2 -> YYY.YYY.YYY.YYY:22
> 
> is that correct?
YYY.YYY.YYY.YYY is a internet adres not at same network. 
I had try blocking on FORWARD but I this not work for me :(
 
> again, i am confused. what i think you want is
> allow 10.1.1.3 -> YYY.YYY.YYY.YYY:80
> block everything else from 10.1.1.3
> 
> again, this would be done in the FORWARD chain of the filter table.
> 
> please verify what you want and if you need help writing the rules
> then we can help.
Correct but YYY.YYY.YYY.YYY is outside of this network... 
I try: 
iptables -A FORWARD -s 10.1.1.3 -j DROP
iptables -A FORWARD -s 10.1.1.3 -d 217.217.217.100 --dport 80 - j
ACCEPT
but I can still access anything :(

---
Przemek < skyline.ltd.pl / przemek@ >
ICQ: 99511187 MSN: tommyindahla -at- hotmail.com

