From: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Subject: Re: NAT & Homepage Statistics
Date: 30 Jan 2003 13:08:23 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1043928504.590.4.camel@ranjeet-linux-1>
References: <se391cd4.045@mail.bmb-bbm.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <se391cd4.045@mail.bmb-bbm.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Thu, 2003-01-30 at 12:38, Mischa Gossen wrote:
> Hello,
> 
> Recently I've installed a webserver behind my firewall. On my website I
> keep statistics where my visitors come from. This is based on the
> IPadrress they have. 
> Ever since I run my webserver behind my firewall (which NAT's to the
> inside), all the users come from the IPaddress of my firewall. This way
> I don't have any statistics anymore :(
> Is there any possibility that I can keep my NAT on the inside of my
> firewall and my webserver can retreive the right IP from the visitors.
> And if it isn't possible, is there a elegant workaround for it?
> 
> 
> Thanks in advance,
> 
> Mischa
> 
> 

Hi,

If your webserver is behind the firewall and people are connecting to it
from the Internet, it means that you are running Destination NAT (DNAT).
So, your source IP for incoming packets should not be affected since you
are doing DNAT only. On the other hand, if you are also doing SNAT for
traffic coming in then you might run into the problem you are running
into. Check your rules. Maybe you need tighter rules. i.e. bind your
DNAT / SNAT rules to specific interfaces ?

Can't help more without details.

HTH

-- 
Ranjeet Shetye
Senior Software Engineer
Zultys Technologies
Ranjeet dot Shetye2 at Zultys dot com
http://www.zultys.com/

The views, opinions, and judgements expressed in this message are solely
those of
the author. The message contents have not been reviewed or approved by
Zultys.


