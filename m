From: Drew Einhorn <drew.einhorn@STARBAND.NET>
Subject: Re: Bridge with iptables
Date: 03 Apr 2003 09:02:55 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049385789.1468.7.camel@localhost.localdomain>
References: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <071f01c2f9ef$86489980$13fcc5cb@Housecall>
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
To: hare ram <hareram@SOL.NET.IN>
Cc: netfilter@LISTS.SAMBA.ORG

goto bridge.sourceforge.net and browse around a bit.

While both the bridge code and the iptables code have been
integrated into the 2.4 kernels, you still need some patches
to get them to play with each other.

On Thu, 2003-04-03 at 07:44, hare ram wrote:
> 
> Hi
> 
> iam trying to setup a bridge with iptable
> i have setup the transparent bridge,
> 
> and iam try to mark the http packets for QOS
> iam not able to see the packets
> 
> i was going through the Lartc.org
> some where i read at this stage ( kernel 2.4.18-27 Redhat iam using) bridge
> will not support iptables.
> it will support only on kernel 2.5, is this true
> 
> if false, where can i get the right documentation which help me to setup
> bridge with packet filtering
> 
> thanks in advance for the help
> 
> hare
> 
> 
> 
> 
> 



