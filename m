From: Brian Capouch <brianc@palaver.net>
Subject: Re: Completely NAT an ISP: A practical possibility?
Date: Sat, 15 Jun 2002 17:54:24 -0500
Sender: netfilter-admin@lists.samba.org
Message-ID: <3D0BC5A0.2070703@palaver.net>
References: <3D0BBC45.5000807@palaver.net> <200206152233.g5FMXPA27757@Networker.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
Cc: netfilter@lists.samba.org

Antony Stone wrote:
> 
> Just out of interest, how are you proposing to handle bandwidth allocation - 
> making sure each customer gets a reasonable bandwidth without hogging the 
> whole link ?
> 

(Ducking) Still studying that matter, but the current 
candidates-of-record are tc, and cbq, but the Advanced Routing HOWTO is 
about to scare me off from CBQ, even though they admit there that it is 
the "most hyped."

I won't mind any advice in that arena, either :-)

Thx.

B.



