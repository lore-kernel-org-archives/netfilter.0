From: Jason Opperisano <opie@817west.com>
Subject: Re: MAC addresses
Date: Sat, 11 Sep 2004 18:23:30 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094941410.3925.20.camel@wolfpack.ljm.dom>
References: <200409111150.50506.bulliver@badcomputer.no-ip.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200409111150.50506.bulliver@badcomputer.no-ip.com>
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

On Sat, 2004-09-11 at 14:50, Darren Kirby wrote:
> Are MAC addresses unique for all ethernet cards? 

theoretically, yes.

> What I would like to know is 
> could I use this rule to allow ssh connections ONLY from my notebook no 
> matter what its current IP address happens to be, and drop all other 
> connection requests?

yes--as long as "notebook" and "ssh server" are on the same network.

keep in mind--nothing prevents "badguy" from configuring his NIC to have
the same MAC as your "notebook"

if you're worried about security of "ssh server"--disable
PasswordAuthentication and only allow RSAAuthentication and/or
PubkeyAuthentication.

stealing your IP and MAC is much more likely than someone stealing your
private key (hopefully).

you could also create a reservation for your MAC in the DHCP server, and
filter based upon your (now) fixed IP.

-j

-- 
Jason Opperisano <opie@817west.com>


