From: Jason Opperisano <opie@817west.com>
Subject: Re: Tos, Mark and tunnels
Date: Tue, 05 Oct 2004 08:31:50 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1096979509.1787.35.camel@wolfpack.ljm.dom>
References: <4161B1CD.EA14C2DB@roadtech.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4161B1CD.EA14C2DB@roadtech.co.uk>
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

On Mon, 2004-10-04 at 16:25, David Rye of Roadtech wrote:
> Are the tos field or Marks replicated to the ESP packets for 
> freeswan/openswan and the 2.4 Kernel.

clicked 'send' too soon...  for this piece, you can use "hidetos=no" in
the "config-setup" of your free/openswan config.

check out http://wiki.openswan.org/index.php/FAQ for more details.

-j

-- 
Jason Opperisano <opie@817west.com>


