From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Monitoring problems...
Date: Fri, 31 Oct 2003 07:37:20 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200310310737.20925.Alistair@nerdnet.ca>
References: <DFD93DB4ABEF7243BC4F81DE17A182EF94B2@tugexch.vpn.mmsi.com> <m21xst1zh0.fsf@feanor.haverlant.org>
Reply-To: Alistair@nerdnet.ca
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <m21xst1zh0.fsf@feanor.haverlant.org>
Content-Disposition: inline
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
To: Vincent Haverlant <vincent@haverlant.org>, Mark Webb <webb@mmspl.com.au>
Cc: netfilter@lists.netfilter.org

On October 31, 2003 05:19 am, Vincent Haverlant wrote:
> "Mark Webb" <webb@mmspl.com.au> writes:
> > I was asked by the powers that be to set up some monitoring of our
>
> workplaces internet traffic. Basically a breakdown of the volume used
> and what protocol is using it.  i.e. 20% mail, 30% web, 10% ftp, etc....
>
> Hi Mark,
>
> You might want to have a look at ntop (http://www.ntop.org/) which looks
> like it does exactly what you want.
>
> Vincent.

	Mark:
	Essentially what is happening is that although you are on a hub and can 
technically see all the traffic for the pipe you are attached to, the box 
does not see all that traffic as being destined for your box, thus is 
ignoring packets NOT a) addressed to the box itself b) addressed to 
broadcast.

  Don't know about ntop myself, but it seems to have a number of fans on this 
list (Hey ...look theres one now... its Vincent)

	*shrugs* ... there are those that swear by other tools too... and difficult 
as ethereal is ... with careful configuration and a few good scripts... 
	

-- 

	Alistair Tonner
	nerdnet.ca
	Senior Systems Analyst - RSS
	
     Any sufficiently advanced technology will have the appearance of magic.
	Lets get magical!

