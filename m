From: alex <alex@bennee.com>
Subject: Re: Problem with masqurading "long" connections.
Date: 07 Nov 2002 07:55:38 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036655738.2727.49.camel@trent.nin>
References: <1036621365.2727.44.camel@trent.nin>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1036621365.2727.44.camel@trent.nin>
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

On Wed, 2002-11-06 at 22:22, alex wrote:
> <snip>
> Background
> 
> I'm running the firewall on a dedicated linux PC (2.4.19, Mandrake 9.0,
> iptables 1.2.6a) which is doing normal masqurading for outgoin LAN
> traffic as well as port forwarding several ports to various internal
> machines. The webserver is apache running on Debian 3.0 (2.2.20 kernel)

This seems to of been the probelm. I upgraded the kernel on the server
to 2.4.19 and everything works fine. Anyone want to offer a theory as to
why?
 
-- 
Alex@Bennee.com
http://www.bennee.com/~alex/


