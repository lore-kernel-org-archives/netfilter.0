From: Jason Opperisano <opie@817west.com>
Subject: Re: --policy DROP kills everything?
Date: Fri, 10 Jun 2005 14:08:27 -0400
Message-ID: <20050610180827.GA6276@bender.817west.com>
References: <42A78007.7080504@edoceo.com>
	<20050609062511.8AD978EDCEB@smtp.sterenborg.info>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20050609062511.8AD978EDCEB@smtp.sterenborg.info>
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

On Thu, Jun 09, 2005 at 08:26:38AM +0200, Rob Sterenborg wrote:
> If -m state is not specified then, in my experience, -m state --state
> NEW is assumed (someone please correct me if I'm telling nonsense here)
> so your rules *will* allow new connections.

that is; indeed, nonsense.

-j

--
"Peter: And this is where the Pilgrims landed at Fraggle Rock."
        --Family Guy

