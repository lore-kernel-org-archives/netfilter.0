From: "Rio Martin." <rio@martin.mu>
Subject: Re: Iptables as auth ?
Date: Thu, 17 Jul 2003 14:47:26 +0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200307171447.26226.rio@martin.mu>
References: <200307151738.53777.rio@martin.mu> <20030715135821.GA24604@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030715135821.GA24604@cannon.eng.us.uu.net>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 15 July 2003 20:58, Ramin Dousti wrote:
> On Tue, Jul 15, 2003 at 05:38:53PM +0700, Rio Martin. wrote:
> What is the exact packet flow (for both the initial flow and the RADIUS
> packet exchange) that you were expacting? How does an application which is
> only smart enough for its own protocol integrate the RADIUS auth? Or how
> can you trigger a RADIUS auth from the firewall to the actual user/client
> that is generating the traffic?
> What you want is only to accomplish by installing client software on all
> the client machines... which is not a part of netfilter framework.
> Ramin

okay i describe again what i want:
                        
INTERNET ----> Linux NAT Gateway + RADIUS ----> PC Client 1, 2, 3.. 100

Users in PC Client 1 .. 100 must authenticate with RADIUS before its traffic 
goes to Internet. I dont know how its going to work, but what i have in my 
mind for now is RADIUS must cooperate with somekind of daemon that should 
execute iptables to perform NAT to client IP.

Regards,
Rio Martin.



-- 
There is a great discovery still to be made in Literature: that of
paying literary men by the quantity they do NOT write.


