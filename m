From: Marc Cozzi <cozzi@nd.edu>
Subject: RE: is it possible to block ip packets that contains experimental
	tcp options ?
Date: Wed, 16 May 2007 08:18:32 -0400
Message-ID: <F163413C9250D211A55C0060979D5280016AB33A@hertz.rad.nd.edu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


Glenn,

Not sure what you mean by "experimental" however, there are
some conditions of flags that should never occur on the
network. These can be trapped with rules similar to the following.

iptables -A BLOCKED -m state --state INVALID -j LOG-AND-DROP
iptables -A BLOCKED -p tcp --tcp-flags ALL ALL -j LOG-AND-DROP
iptables -A BLOCKED -p tcp --tcp-flags ALL NONE -j LOG-AND-DROP

  --marc


> -----Original Message-----
> From: Glenn Terjesen [mailto:glenn@webcat.no] 
> Sent: Wednesday, May 16, 2007 5:24 AM
> To: netfilter@lists.netfilter.org
> Subject: is it possible to block ip packets that contains 
> experimental tcp options ?
> 
> Hello,
> got a iptables firewall filtering our servers.
> 
> Is it possible to block tcp packets that contains 
> experimental tcp options ?
> 
> AND is it smart to do so ?
> 
> 
> --
> Mvh Glenn Terjesen @ Webcat AS
> Tlf: +47 37 02 20 20
> E-post: support@webcat.no
> 

