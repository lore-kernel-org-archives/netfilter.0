From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Using IPTABLES, cannot go to External Interface
Date: Tue, 17 Jun 2003 21:59:13 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618015913.GB1923@cannon.eng.us.uu.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A0D6ED3@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <09B04A55822EFF4DA48D2E0BB2941D4A0D6ED3@wardrive.citadelcomputer.com.au>
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
To: George Vieira <georgev@citadelcomputer.com.au>
Cc: Cedric Blancher <blancher@cartel-securite.fr>, "Netfilter (E-mail)" <netfilter@lists.netfilter.org>

On Wed, Jun 18, 2003 at 09:11:04AM +1000, George Vieira wrote:

> > there won't be anyone to answer ARP requests on them
> oh ok, well we have (unfortunately) a router in front of our firewall which I've added host routes to go via the firewall for those destinations. Just made it easier for me and I didn't have to worry about multiple IPs on the firewall as they are routed to it. Probably not a clean way but better than adding 32+ IPs to a firewall... not sure what the Linux limit was so this was the safest way for me.
> 

This works theoretically as long as the 32+ IP's are not on the same subnet
as the external IP of your firewall...

Ramin

> Just for your information.
> 
> -----Original Message-----
> From: Cedric Blancher [mailto:blancher@cartel-securite.fr]
> Sent: Monday, June 16, 2003 11:41 PM
> To: George Vieira
> Cc: Netfilter (E-mail)
> Subject: RE: Using IPTABLES, cannot go to External Interface
> 
> 

