From: Harold Burchey <harold.a.burchey@uts.edu.au>
Subject: Re: Captive DNS REDIRECT problems. Need a stateless/fast timeout
 udp connection.
Date: Sun, 3 Apr 2005 17:20:07 +1000
Message-ID: <20050403172007.73c0089f.harold.a.burchey@uts.edu.au>
References: <200504030138.03902.dcinege-mlists@psychosis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200504030138.03902.dcinege-mlists@psychosis.com>
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
To: dcinege-mlists@psychosis.com
Cc: netfilter@lists.netfilter.org, dcinege-mlists-dated-1112942287.e58b6f@psychosis.com

On Sun, 03 Apr 2005 01:38:03 -0500
Dave Cinege <dcinege-mlists-dated-1112942287.e58b6f@psychosis.com> wrote:

> Here in lies the problem. When an unauthorized host first hits port 53 and is 
> redirected to 5353 a udp connection track stream is tacked up. Once they 
> become authorized their 'ACCEPT' rule in inserted, however the original 
> 53->5353 REDIRECT stream is still alive, and will continued to be used until 
> it times out. During this time the host is dead in the water with no 'real' 
> DNS.

Let's say your existing ethernet device is eth0. Is is possible to
physically add a second ethernet device, say eth1? Then you could route
everything from eth0 to eth1 and put the dummy redirections on eth1.
Then whenever you want to override the dummy redirections you insert iptables
rules on eth0.

I've never tried anything like this and am totally guessing, so I could
(am probably) way off track, but anyways :)

