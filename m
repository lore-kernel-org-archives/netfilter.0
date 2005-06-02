From: "John A. Sullivan III" <jsullivan@opensourcedevel.com>
Subject: Re: IP address ranges for USA and Europe
Date: Thu, 02 Jun 2005 15:26:22 -0400
Message-ID: <1117740382.4619.37.camel@jasiiitosh.nexusmgmt.com>
References: <429F4DD2.6080600@jcitc.com> <429F53BC.7070906@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429F53BC.7070906@riverviewtech.net>
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
To: "Taylor, Grant" <gtaylor@riverviewtech.net>
Cc: Netfilter users list <netfilter@lists.netfilter.org>

On Thu, 2005-06-02 at 13:45 -0500, Taylor, Grant wrote:
> James Cooke wrote:
> > Hi all,
> > 
> > I'm running a VPN server to which IP tables limits connections to the IP
> > addresses of the client offices. However, now the client wants roaming
> > access to the VPN via laptops - they will be moving around Europe and
> > the USA. There are two layers of password security, but I'm still
> > nervous about opening the server to the entire world...
> > 
> > Therefore, is there a nice way to open the firewall for connections just
> > from Europe and USA?
> > 
> ><snip>
> 
I do not know if this will be of any help to you but we've taken a
completely different approach.  We have implemented out-of-band user
authentication in the ISCS project (http://iscs.sourceforge.net).
Basically, we dynamically reconfigure IP tables for each RAS user and
implement custom iptables rules based upon the DER_ASN.1_DN of their
X.509 cert.

Thus, for example, when someone with a cert where
0=mycompany,OU=executive connects, the are granted access to executive
and financial resources.  When someone with O=mycompany,OU=sales
connects, they are given access to sales resources.  We still have some
issues to iron out and a few obscure exploits to close but perhaps you
can use the ideas we have implemented.  They are well documented in the
code.

The NuFW folks (http://www.nufw.org) have taken this idea much further
but I believe their solution is more geared toward internal users on
trusted networks although that may have changed.  Good luck - John
-- 
John A. Sullivan III
Open Source Development Corporation
+1 207-985-7880
jsullivan@opensourcedevel.com

Financially sustainable open source development
http://www.opensourcedevel.com


