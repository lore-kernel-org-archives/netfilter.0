From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Filtered Port
Date: Tue, 31 Jan 2006 08:24:18 -0600
Message-ID: <200601310824.18765.rob0@gmx.co.uk>
References: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43DF6C38.6010204@mail.bloomfield.k12.mo.us>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

On Tuesday 2006-January-31 07:55, Scott Mayo wrote:
> else to look or ask.  I am trying to use Remote Desktop on a
> computer. From inside my network, it works fine, but once I get
> outside, I cannot use it.  I have set my IPTABLES to forward anything
> going to port 3389 to the computer that is using Remote Desktop.

Is the iptables machine the default gateway for the Remote Desktop 
machine? When in doubt check the routing. Then check the routing 
again. :)
-- 
    Offlist mail to this address is discarded unless
    "/dev/rob0" or "not-spam" is in Subject: header

