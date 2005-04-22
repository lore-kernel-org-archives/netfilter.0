From: Mariusz Kruk <Kruk@epsilon.eu.org>
Subject: Re: 2 subnets
Date: Fri, 22 Apr 2005 15:25:02 +0200
Message-ID: <20050422132502.GA19589@epsilon.rdc.pl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Thu, Apr 21, 2005 at 12:19:33PM -0300, Bernardo Vieira wrote:
> Getting a ride on Mariusz's question, but probably deviating off topic:
> I if a had the setup where the two subnets run off the same network card 
> on virtual interfaces, i.e. not physically separeted, could I still run 
> a DHCP server on them? How about bandwidth limiting? Could anyone give 
> me some pointers?

To clarify the things, the ethX:Y is a obsolete notation. This was the
only way to specify multiple IPs on one physical interface up to 2.0 or
2.2 line of kernels. It's still provided for compatibility reasons, I
think.
With modern kernels and tools you don't have to use this notation at
all.
Kernel itself doesn't know a thing about something called, for example,
eth1:2. It's just another IP addr added to eth1 interface.
Therefore, you can normally configure DHCP to bind to interface eth1 and
assign IPs from both nets based on MAC address of requesting host.
If you route the packets, it's irrelevant whether you push them to eth1
or eth1:2. They end up on the same interface. So you can still attach
your queues and disciplines to eth1.

-- 
[------------------------] Bet   you   can't  stop  reading  here  <---
[  Kruk@epsilon.eu.org   ] I knew it...
[ http://epsilon.eu.org/ ] 
[------------------------] 

