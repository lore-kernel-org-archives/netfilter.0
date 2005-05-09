From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Mon, 09 May 2005 13:43:29 -0500
Message-ID: <427FAF51.9000102@riverviewtech.net>
References: <1115397393l.3864l.0l@antares.localdomain>	<427C5C41.3010407@riverviewtech.net>	<1115496014l.3549l.0l@antares.localdomain>	<427EFB7D.8010503@riverviewtech.net>
	<1115663859l.3308l.0l@antares.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115663859l.3308l.0l@antares.localdomain>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Set them all to either 0 or 1 - still the same picture, the reply from 
> the  remote server results (in tcpdump) in the one with "win 0" being 
> sent back  instead of passing it to eth0.

Hmm.  Would it be possible to see the output of iptables-save?  I'm just wondering if there is something else in the mix that is messing things up.

> Any idea whom I could ask here for help? Maybe the Linux kernel mailing  
> list? Or is there a more specialised one for networking issues?

Sorry, I don't know off hand where to send you.  Any one else have any advice here?



Grant. . . .

