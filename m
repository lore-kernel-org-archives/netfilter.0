From: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Subject: Re: VPN
Date: Wed, 30 Jun 2004 12:52:57 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088614376.7260.45.camel@localhost>
References: <1088613167.1173.66.camel@pauloric.intranet>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1088613167.1173.66.camel@pauloric.intranet>
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
To: "paulobruck1@bol.com.br" <paulobruck1@bol.com.br>
Cc: netfilter@lists.netfilter.org

On Wed, 2004-06-30 at 12:34, paulobruck1@bol.com.br wrote:
> Hi guys
> 
> I would like to know what do you suggest in terms of IPSEC.
> I used to deal with freeswan  and I looking another solution.
> 
> I've already listen about openvpn, openswan and raccon.
> 
> What do you suggest in terms of this tools.
> 
> I intend to use IPSEC w/ linux  accessing another linux + iptables +
> IPCSEC and allow connections from micro$oft machines as road warriors.
> 
> distro: debian
> 
> 
> any suggestion??
I've been reasonably happy with both openswan and strongswan
(http://www.strongswan.org).  openvpn looks very interesting although
non-standard.  I have not tried it.  I have not used racoon.

I believe fwbuilder (http://www.fwbuilder.org) provides a GUI interface
to setting up *swan.  ISCS (http://iscs.sourceforge.net) provides a GUI
front end to automatically create and distribute VPN, firewall, NAT and
routing rules without stepping on each other and, for your road
warriors, allows extended user authentication to be used throughout the
WAN without having to reassign internal IP addresses but it has not yet
released code.

Hope this helps - John

-- 
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevelopmentcorp.com


