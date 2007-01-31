From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Connect to localhost bound port from outside?
Date: Wed, 31 Jan 2007 09:36:18 -0600
Message-ID: <45C0B772.2090201@riverviewtech.net>
References: <eppgne$mc1$1@sea.gmane.org> <45C06BE7.2080208@plouf.fr.eu.org>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45C06BE7.2080208@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

Pascal Hambourg wrote:
> Iptables will happily redirect anything you like to localhost, but the 
> kernel IP routing prohibits communications with a loopback address on a 
> non loopback interface and thus will drop the packets. This is similar 
> to the problem in the above thread "port forwarding through localhost", 
> and the same workaround is applicable.

Does this apply if the reverse path filter is turned off?  Or is this a 
hard coded filter in the kernel that can not be gotten around?

Another thought to the OP would be to use the Dummy interface in lieu of 
the Loop Back interface as I believe it does not have the same 
restrictions that Loop Back does.  However I could be mistaken.

I have often considered using lo for local only but using dummy as a 
spur network to bind services to and then route traffic in to the spur 
network.  Thoughts / Opinions?



Grant. . . .

