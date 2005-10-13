From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: relocating packets
Date: Thu, 13 Oct 2005 08:35:47 -0500
Message-ID: <200510130835.47747.rob0@gmx.co.uk>
References: <434E2DFD.8030909@ufl.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434E2DFD.8030909@ufl.edu>
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

On Thursday 2005-October-13 04:50, Mark Oden wrote:
> Assuming I had two NICs in my machine that happen to be on the same
> network, is there a way to force packets of certain ports to use only
> one NIC or IP?

I believe this scenario is covered by the LARTC HOWTO.  In brief: use 
"-j MARK --set-mark 0xff" in mangle. Use dual routing tables, and a 
rule to put "fwmark 0xff" traffic in the alternate table. The mark can 
be anything from 0x0 to 0xffff.

http://lartc.org/howto/
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

