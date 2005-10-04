From: Pawel Oleksik <oleksik@awa.mat.agh.edu.pl>
Subject: Re: Logging SNAT
Date: Tue, 4 Oct 2005 09:10:51 +0200
Message-ID: <20051004071051.GA3740@awa.mat.agh.edu.pl>
References: <20051003060103.GA26729@awa.mat.agh.edu.pl>
	<Pine.LNX.4.61.0510031428290.24889@filer.marasystems.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.61.0510031428290.24889@filer.marasystems.com>
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
To: Henrik Nordstrom <hno@marasystems.com>
Cc: netfilter@lists.netfilter.org

On Mon, Oct 03, 2005 at 02:32:40PM +0200, Henrik Nordstrom wrote:
> ><timestamp> <localnet address> uses external connection as <external IP>
> >....
> ><timestamp> <localnet address> releases <external IP>
> 
> Some of this is provided by the newly released conntrack tool.
> 
> http://www.netfilter.org/news.html#2005-09-24
> 
> Regards
> Henrik

Thanks!
According to the conntrack.8 it seems promising. However, are there any docs
about what information I could get in event log? 

p.o.


