From: Thomas Klettke <thomas@klettke.us>
Subject: Re: POSTROUTING & DNAT
Date: Wed, 10 Sep 2003 06:59:21 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063195160.4399.0.camel@klettke.us>
References: <000501c32062$42b751e0$6901a8c0@tailor>
	 <1b7301c3774d$2d14a260$8201a8c0@lw1dqwin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1b7301c3774d$2d14a260$8201a8c0@lw1dqwin>
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
To: "Diego R. Rodriguez Herlein" <diegorh@infovia.com.ar>
Cc: Leszek Zur <lzur@record.com.pl>, netfilter@lists.netfilter.org

Is NAT support compiled into the kernel?


On Tue, 2003-09-09 at 22:39, Diego R. Rodriguez Herlein wrote:
> Sorry those are my rules (DMZ)
> 
> HTTP
> #
> iptables -t nat -A PREROUTING -p tcp -d $IP_REAL --dport 80 -j DNAT \
> --to-destination $IP_DMZ
> iptables -t nat -A POSTROUTING -p tcp -d $IP_DMZ --dport 80 -j SNAT \
> --to-source $IP_LAN
> iptables -t nat -A OUTPUT -p tcp -d $IP_REAL --dport 80 -j DNAT \
> --to-destination $IP_DMZ
> #
> #
> #
> work great with rh 7.1 kernel 2.4.17
> 
> 
> ----- Original Message ----- 
> From: "Leszek Zur" <lzur@record.com.pl>
> To: <netfilter@lists.netfilter.org>
> Sent: Thursday, May 22, 2003 10:01 AM
> Subject: POSTROUTING & DNAT
> 
> 
> > Hello
> > 
> > iptables -t nat -A OUTPUT -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
> > iptables: Invalid argument
> > 
> > Can anyone help me understand what is happening?
> > 
> > iptables v1.2.8
> > kernel 2.4.20
> > 
> > thnx
> > 
> > Leszek
> > 
> > 
> > 
> 

