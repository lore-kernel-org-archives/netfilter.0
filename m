From: Alistair Tonner <Alistair@nerdnet.ca>
Subject: Re: Destination Nat
Date: Wed, 2 Jun 2004 11:13:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406021113.58570.Alistair@nerdnet.ca>
References: <40b74a21.49.47a3.1468065555@arbbs.net> <013201c44853$1829e220$9322a141@black> <1086175160.4146.1.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1086175160.4146.1.camel@localhost>
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
To: netfilter@lists.netfilter.org

On June 2, 2004 07:19 am, John A. Sullivan III wrote:
> -p 6 is the same as -p tcp only a little faster as it does not have to
> look up tcp in the protocols file and translate it from tcp to 6.  UDP
> would be -p 17, ICMP -p 1, ESP -p 50, etc.

	That lookup would only be done when the rule was posted or loaded.
	Thus - the time saving is only on loading the rule.  
	I believe that the rule data is *all* stored in numeric form ...
	But I could be completely wrong on that front.

	Alistair.
>
> On Tue, 2004-06-01 at 23:38, John Black wrote:
> > thanks, ill give it a try tomorrow when i get to work.  what is the -p 6?
> > ----- Original Message -----
> > From: John A. Sullivan III <john.sullivan@nexusmgmt.com>
> > To: <black@arbbs.net>
> > Cc: <netfilter@lists.netfilter.org>
> > Sent: Friday, May 28, 2004 8:56 PM
> > Subject: Re: Destination Nat
> >
> > > If I understand you correctly and remember your original rule, then I
> > > think you have it backward.  If you are changing the destination, you
> > > probably want to change it from the public address to the private
> > > address:
> >
> > john

