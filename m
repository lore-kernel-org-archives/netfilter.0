From: Joel Newkirk <netfilter@newkirk.us>
Subject: RE: per user IP adresses
Date: 06 May 2003 09:16:08 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1052226968.32507.95.camel@alpha.newkirk.us>
References: <000201c313aa$bb09b710$0200a8c0@WKSJOHN>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000201c313aa$bb09b710$0200a8c0@WKSJOHN>
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
To: john@guntenaar.nl
Cc: netfilter@lists.netfilter.org

On Tue, 2003-05-06 at 04:37, John Guntenaar wrote:
> Hi Joel,
> 
> Your LAN construction is exactly what I want, but I want that 1 of the 4
> IPs can only bind to the 4th IP, but when I try any of your rules I get
> errors :(
> 
> (And yes, I changed the real IP in 123.123.123.123 in here ;-))
> 
> jimbo:/var/www# iptables -A OUTPUT -p tcp -s 123.123.123.123/32 -m owner
> ! --uid-owner 1000 -j REJECT --reject-with tcp-reset
> iptables: Invalid argument
> 
> jimbo:/var/www# iptables -A OUTPUT -p tcp --dport 6667 -m owner !
> --uid-owner 1000 -j REJECT --reject-with tcp-reset
> iptables: Invalid argument
> 
> jimbo:/var/www# iptables -A OUTPUT -p tcp --dport 194 -m owner !
> --uid-owner \ 1235 -j REJECT --reject-with tcp-reset
> iptables: Invalid argument
> 
> So what could be wrong?

My bet would be you don't have/haven't loaded ipt_owner...  Try "insmod
ipt_owner".

j

> Thanks,
> 
> John




