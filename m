From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: iptables for ADSL
Date: Fri, 21 Nov 2003 15:47:07 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031121204707.GA24283@cannon.eng.us.uu.net>
References: <02b601c3b065$30bf3a50$0200a8c0@ale>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <02b601c3b065$30bf3a50$0200a8c0@ale>
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
Content-Transfer-Encoding: 7bit
To: Alejandro Cabrera Obed <sisdis@tournet.com.ar>
Cc: "Netfilter lista (iptables)" <netfilter@lists.netfilter.org>

On Fri, Nov 21, 2003 at 04:25:06PM -0300, Alejandro Cabrera Obed wrote:

> Hi people !!!
> 
> I have a basic doubt: I want to connect my Linux with iptables to Intrenet
> via ADSL. Just one question:
> 
> Do I have to set
> echo "1" > /proc/sys/net/ipv4/ip_dynadrr
> in order to work with dynamic addresses asigned by my ISP ????

Take a look at Documentation/networking/ip_dynaddr.txt of your
kernel source tree.

In short you do not need this.

Ramin

> 
> Thanks a lot
> 
> Ale
> 

