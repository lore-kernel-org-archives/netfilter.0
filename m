From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: TCP delay, SMTP errors
Date: Tue, 11 Jun 2002 13:34:48 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020611173448.GB21405@cannon.eng.us.uu.net>
References: <3D052994.CD0F1237@planetconnect.com> <093e01c21160$464b2e60$2901a8c0@amos>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <093e01c21160$464b2e60$2901a8c0@amos>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nathan Cassano <nathan@cjhunter.com>
Cc: netfilter@lists.samba.org

Nathan,

I also saw two replied to your question, one was about the reverse
lookup of your client and the other was the ident query. Both are
valid possibilities. What does tcpdump show?

BTW, the NAT is not doing anything weird here as the same NAT would
be applied to your non-TCP packets which, you say, are not showing
any delay..

Ramin

On Tue, Jun 11, 2002 at 08:54:25AM -0700, Nathan Cassano wrote:

> 
> Ramin wrote:
> 
> > First you have to find out what the reason of this delay is. Eg, is
> this
> > because of the load on the server or the client or is it because of
> the
> > poor layer 2 medium (lots of collisions...) or any other reason.
> The load on the our switch is low. 99% idle on the firewall, and 90% on
> the internal web server, both dual PIII's.
> 
> > Are you here implying that the delay is because of the NAT'ed
> architecture?
> That is my suspicion. I recall Linux NAT doing this type of thing
> before.
> 
> > What does a simple ping show delay-wise?
> Nothing irregular, all the ping times are the same.
> 
> > What is the routing to and from that external host? Is it asymmetric?
> Static routing, one external network device.
> 
> > What happens if you connect to this external host from the external
> interface of the firewall itself?
> > Are you still experiencing delays?
> Yes, the same delay is present connecting from the firewall.
> 
> > Is this only happening with TCP or all types of packets would have the
> same delay?
> Doing DNS queries using the dig program to our external DNS server is
> fast. It seems
> to be a delay in sending initial TCP data. 

