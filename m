From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Seeing all packets
Date: Tue, 17 Jun 2003 21:53:32 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030618015332.GA1923@cannon.eng.us.uu.net>
References: <661F9268BBA8CB4EB92CC12B8C42F06901F64E@pluto.rovingplanet.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <661F9268BBA8CB4EB92CC12B8C42F06901F64E@pluto.rovingplanet.com>
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
To: Paul Albert <palbert@rovingplanet.com>
Cc: netfilter@lists.netfilter.org

On Tue, Jun 17, 2003 at 05:47:50PM -0600, Paul Albert wrote:

> Perhaps my definition of session isn't correct.  Is the definition of
> session a connection, ie. Something that I can see in
> /proc/net/ip_conntrack?

Correct.

> I would like to firewall all of the traffic
> that the connection is sending and receiving so that if I were to
> dynamically put a policy in place I would disrupt a streaming
> connection, say.
> 
> So if the packets bypass the NAT table, do they definitely go to the
> filter table?

Yes. That's why you (should) filter in the filter table.

> Is there a POM module that will allow me to do DNAT from another table
> than NAT?

You mean the nat table (lower case), right? I'm not aware of any p-o-m
module doing that.

Ramin

> I thought that I saw one listed, but I could not find it.
> 
> Regards,
> Paul
> 
> 
> -----Original Message-----
> From: Ramin Dousti [mailto:ramin@cannon.eng.us.uu.net] 
> Sent: Tuesday, June 17, 2003 5:14 PM
> To: Paul Albert
> Cc: netfilter@lists.netfilter.org
> Subject: Re: Seeing all packets
> 
> 
> Once the NAT rule kicks in for certain session all the subsequent
> packets of that session would bypass the nat rules...
> 
> Ramin
> 
> On Tue, Jun 17, 2003 at 02:38:55PM -0600, Paul Albert wrote:
> 
> > Hi -
> > 
> > I'm trying to do some firewalling on every packet that goes through 
> > our firewall.  We're doing our filtering in the PREROUTING chain (not 
> > recommended, I realize), because we must do our firewalling to 
> > determine whether we need to NAT a request.  There are times when the 
> > NAT PREROUTING chain is bypassed, and I'm not exactly sure why.  The 
> > docs say that "it will be bypassed in certain cases," however I cannot
> 
> > determine what these cases are.
> > 
> > Why are the packets getting sent past the NAT PREROUTING chain? Is 
> > there a way to send all of the data through this chain?
> > 
> > Regards,
> > Paul
> > 

