From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: iptables abilities
Date: Fri, 23 Jan 2004 16:09:30 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200401231609.30277.Antony@Soft-Solutions.co.uk>
References: <400FC047.4010208@objeng.ch> <4010F62A.7090403@objeng.ch> <1079.12.75.166.26.1074864825.squirrel@nmibwkrf1.nexusmgmt.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1079.12.75.166.26.1074864825.squirrel@nmibwkrf1.nexusmgmt.com>
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

On Friday 23 January 2004 1:33 pm, John A. Sullivan III wrote:

> > The problem is, you can't establish a connection to the private address
> > (A), so there has to be a means of 'hijacking' the established session
> > (from X, see diagram below).
> >
> >          (Internet)       (Internet)
> >      A <------------> X <------------> B
> >
> > A: 192.168.X.X
> > B: 192.168.X.X
> > X: public IP address
> >
> > The end result is to get from B to A, securely.
> >
> > Cheers
> > Sven
>
> I don't know if it is what you are looking for but Bart Smit of Nexus
> Management developed an application to allow Nexus Management to provide
> remote control Help Desk to sites where we did not have a VPN connection.
> I do not know many of the details but I think the two stations connect to
> each other through a third public server as you have described here.  The
> two private computers do not require dedicated public IP addresses.

They may not require *dedicated* public IP addresses, but there still have to 
*be* public IP addresses available at ends A and B of the links, otherwise X 
cannot send reply packets back to them.

So long as A and B have public IPs which they can NAT behind, then there's no 
problem - they can either communicate directly, or if you want to channel the 
link via some other server X on the Internet you could do that easily enough 
with a couple of SSH tunnels back to back.   Given public IPs all sorts of 
opportunities come to mind.

I still say however that if A and B do not have public IPs available to hide 
behind, then they can't communicate with *anything* across the Internet.

Regards,

Antony.


-- 
The words "e pluribus unum" on the Great Seal of the United States are from a 
poem by Virgil entitled "Moretum", which is about cheese and garlic salad 
dressing.

                                                     Please reply to the list;
                                                           please don't CC me.


