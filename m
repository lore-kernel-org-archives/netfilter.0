From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Newb here,
	I need help opening port 1723 and setting a public IP address to
	aprivate IP
Date: Wed, 28 Sep 2005 18:53:10 -0500
Message-ID: <200509281853.10862.rob0@gmx.co.uk>
References: <57F9959B46E0FA4D8BA88AEDFBE582900B5809@pxtbenexd01.pxt.primeexalia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <57F9959B46E0FA4D8BA88AEDFBE582900B5809@pxtbenexd01.pxt.primeexalia.com>
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

On Wednesday 2005-September-28 18:15, Gary W. Smith wrote:
> You should also take a look at pptp-client.sourceforge.net.  It has a
> lot of information regarding the PPTP subject.  I have had to

True, but the name's off. Take out the hyphen:
http://pptpclient.sourceforge.net/

> implement several PPTP servers and clients in Linux.

I still have a few pptpd's running, but we'll probably eradicate those 
by the end of this year. I've never bothered with pptpclient myself, 
because I have plenty of other means to connect to my Linux servers.

> I have found that it's no fun when you run into the issue of NAT'd
> clients behind a Linux firewall.

PPTP is not what you might call NAT-friendly. There is a NAT helper 
module in patch-o-matic, but I have never tried that.

> You have to do small things like recompile the kernel, etc.

The only reason I've done that is for MPPE support. Apparently MPPE 
might be getting into the mainstream 2.6 kernels ... which I did not 
think was possible due to licensing. Anyone interested in the whole 
story (I really am not) can follow the link above.

I do believe the MPPE support is in late models of pppd(8), but that 
wouldn't be subject to Microsoft licensing.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

