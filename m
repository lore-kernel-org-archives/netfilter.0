From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Iptables as auth ?
Date: Tue, 15 Jul 2003 09:58:21 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030715135821.GA24604@cannon.eng.us.uu.net>
References: <200307151738.53777.rio@martin.mu>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200307151738.53777.rio@martin.mu>
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
To: "Rio Martin." <rio@martin.mu>
Cc: netfilter@lists.netfilter.org

On Tue, Jul 15, 2003 at 05:38:53PM +0700, Rio Martin. wrote:

> Folks,

Hello,

> Is there any way to configure iptables to perform nat only if the 
> authentication from radius server is correct ?

What is the exact packet flow (for both the initial flow and the RADIUS
packet exchange) that you were expacting? How does an application which is
only smart enough for its own protocol integrate the RADIUS auth? Or how
can you trigger a RADIUS auth from the firewall to the actual user/client
that is generating the traffic?

What you want is only to accomplish by installing client software on all
the client machines... which is not a part of netfilter framework.

Ramin

> I am looking for the documentation on google, but found nothing, need help ..
> 
> Regards,
> Rio Martin.
> 
> -- 
> Atlanta makes it against the law to tie a giraffe to a telephone pole
> or street lamp.
> 

