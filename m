From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: NetBIOS dgm NAT Helper
Date: Fri, 16 Sep 2005 22:21:08 -0400
Message-ID: <1126923668.6687.25.camel@localhost>
References: <1126895937.6687.3.camel@localhost>
	<2b8e1997050916175339d88351@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <2b8e1997050916175339d88351@mail.gmail.com>
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
To: rgarrido.l@gmail.com
Cc: netfilter@lists.netfilter.org

Thank you but I don't think this helps.  It looks like it is for the
name service rather than the datagram service.  I would think such a
help would need to rewrite the embedded IP in the NetBIOS header and
recalculate any checksumming - John

On Sat, 2005-09-17 at 02:53 +0200, Rafa Garrido wrote:
> It can that this patch of the last week help you:
> http://patchwork.netfilter.org/netfilter-devel/patch.pl?id=2859
> It will be necessary to hope to that stable kernel appears.
> Greetings.
> 
> 
> On 9/16/05, John A. Sullivan III <jsullivan@opensourcedevel.com> wrote:
> > We have encountered an unusual situation where NetBIOS datagram packets
> > (138/udp) are being passed through an IPSec tunnel on an iptables
> > firewall but they are also being NATted by the same firewall.  It
> > appears there is IP information embedded in the NetBIOS header.  Thus
> > NAT causes this protocol to break because the reply packets are sent to
> > the original IP address in the NetBIOS header rather than the NAT IP
> > address in the IP header.
> > 
> > I believe Cisco does have a NAT helper for NetBIOS but I have not seen
> > anything for iptables.  Is there such a helper? Is there anyway for an
> > iptables firewall to NAT NetBIOS datagram packets? Thanks - John
> > --
> > John A. Sullivan III
> > Open Source Development Corporation
> > +1 207-985-7880
> > jsullivan@opensourcedevel.com
> > 
> > If you would like to participate in the development of an open source
> > enterprise class network security management system, please visit
> > http://iscs.sourceforge.net
> > 
> > 
> >
> 
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


