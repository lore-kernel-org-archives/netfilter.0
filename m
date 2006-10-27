From: vwf <vwf@vulkor.net>
Subject: Re: how to filter on applications?
Date: Fri, 27 Oct 2006 10:22:01 +0200
Message-ID: <20061027082201.GA4298@trane.vulkor.net>
References: <20061026185357.GA4832@trane.vulkor.net>
	<46522.136.1.1.154.1161890722.squirrel@mail.addictz.org>
Reply-To: vwf <vwf@vulkor.net>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <46522.136.1.1.154.1161890722.squirrel@mail.addictz.org>
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
Cc: Mike <lists@addictz.org>

On Thu, Oct 26, 2006 at 03:25:22PM -0400, Mike wrote:
> vwf wrote:
> > Hello,
> >
> > I want to filter outgoing traffic based on the originating application.
> > How do I do this? Please tell me iptables can do this. If not, how can I
> > lock down my system?

> http://l7-filter.sourceforge.net/

This filters on protocol, not on application.

