From: Jason Opperisano <opie@817west.com>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 20:54:12 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094950452.5506.4.camel@wolfpack.ljm.dom>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
	<1094941410.3925.20.camel@wolfpack.ljm.dom>
	<200409111726.53499.bulliver@badcomputer.no-ip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409111726.53499.bulliver@badcomputer.no-ip.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Sat, 2004-09-11 at 20:26, Darren Kirby wrote:
> I will look into this. I assume however that I would need to keep port 23 open 
> for everyone on the public side for this to work. I was hoping to drop the 
> packets from everyone except my notebook, hence the original question. Is 
> there no way to do this?

if you're looking for a secure way to manage your firewall from the
internet without allowing "-s 0/0 --dport 22" type access; you probably
want to setup some sort of VPN access for yourself.

openvpn ( http://openvpn.sourceforge.net/ ) is a very nice option for
this.

-j

-- 
Jason Opperisano <opie@817west.com>


