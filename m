From: Jason Opperisano <opie@817west.com>
Subject: Re: gnutella
Date: Thu, 21 Oct 2004 10:31:09 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041021143109.GA10833@bender.817west.com>
References: <f9a42cb404102107232273e04@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <f9a42cb404102107232273e04@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Group <netfilter@lists.netfilter.org>

On Thu, Oct 21, 2004 at 10:23:45AM -0400, Michel Bellemare wrote:
> is there any way to log all the traffic that uses the gnutella protocol?
> i searched in the mailing list and google and found nothing.
> 
> I looked to at a tcpdump capture and it never uses the same port...
> 
> basically i want to control the number of bytes that goes out using
> this protocol.
> 
> thank you very much!

you need a layer-7 classifier to magically figure out whether traffic on
port X is gnutella traffic.

you can try looking at:

  http://l7-filter.sourceforge.net/

-j

-- 
Jason Opperisano <opie@817west.com>

