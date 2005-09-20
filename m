From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: snat to multiple source ip
Date: Tue, 20 Sep 2005 08:58:10 -0500
Message-ID: <200509200858.10349.rob0@gmx.co.uk>
References: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-DAV7432DC634B39274E5495CB2950@phx.gbl>
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

On Tuesday 20 September 2005 07:39, Marco Berizzi wrote:
> > Which patch is this? I have used Julian Anastasov's patches
>
> Here is
> http://www.ussg.iu.edu/hypermail/linux/kernel/0203.2/1314.html
> However this is only for routing not for nat.

I really do not know, sorry. All I can do is suggest that you try it 
using Julian's routes patch and the NANO-HOWTO. IWFM. I understand some 
of the "how" but very little of the "why". Eventually I hope to know 
more about it.

My non-technical explanation of how it works: the source IP is set by 
iproute2 in the routing tables. This is where the load balancing takes 
place.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

