From: "ryan @ thedataarc" <ryanb@thedataarc.com>
Subject: Re: DMZ Scenario
Date: 14 Nov 2002 20:57:37 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037329062.2827.2.camel@rbhome.inside.thedataarc.com>
References: <000c01c28c3e$ab3603a0$64dc0a0a@i> 
	<200211142029.57679.netfilter@newkirk.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200211142029.57679.netfilter@newkirk.us>
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
To: netfilter@newkirk.us
Cc: netfilter@lists.netfilter.org

Aha!  Thanks so much.  

-R Beisner


On Thu, 2002-11-14 at 19:29, Joel Newkirk wrote:
> On Thursday 14 November 2002 07:33 pm, Ryan Beisner wrote:
> > Hi
> >
> > I have successfully installed a mail + web server in my new dmz, filtered
> > by netfilter in Redhat 7.3.  My problem is, the request addresses show up
> > as the dmz interface's ip address (of the packet filter box).  This
> 
> > $ipt -A PREROUTING -t nat -d $PRESext -j DNAT --to $PRESdmz
> > $ipt -A POSTROUTING -t nat -d $PRESdmz -j SNAT --to $PRESext
> 
> > $ipt -A PREROUTING -t nat -d $KEYext -j DNAT --to $KEYdmz
> > $ipt -A POSTROUTING -t nat -d $KEYdmz -j SNAT --to $KEYext
> 
> Drop the SNAT rules.  In the PRE you take anything coming in the 'real' IP and 
> change it's destination to the dmz IP.  But in the POST you take those same 
> packets and change their source to the real IP.  If you drop the POST rules, 
> then the packets will just pass on to $PRESdmz with their (presumably) real 
> source IP intact.
> 
> j
> 



