From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: linux-2.6.9-rc1 compilation and configuration issue (fwd)
Date: Wed, 08 Sep 2004 09:10:25 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <413F12D1.3050108@pbl.ca>
References: <200409072333.i87NXJZA012251@bassett.home.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409072333.i87NXJZA012251@bassett.home.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

James B. Hiller wrote:
> Hi!
> 
> No takers?  Or have I put this in the wrong forum?  If I have, please
> let me know where to go with it.

Wish I could help you.  But I never seem to get past the point of even 
applying the patches ;-)

Sure, those I don't need apply clean, those that I'm interested in like 
tcp windows tracking always fail.

BTW, why do we need to recompile entire kernel and iptables, just to get 
one tiny miny module installed?  It kind of beats the hole idea of 
modularity and loadable modules, isn't it?  (well, at least half of the 
idea behind it, anyhow) Why can't we just compile two source files and 
place resulting object files into appropriate directories 
(kernel/iptables version independent)?  And not to have to worry about 
recompiling them when new kernel release is out there.

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

