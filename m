From: Les Mikesell <les@futuresource.com>
Subject: RE: bandwidth monitoring
Date: Thu, 06 Jan 2005 13:39:48 -0600
Message-ID: <1105040388.14796.64.camel@moola.futuresource.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AA@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <7C9884991ADAE0479C14F10C858BCDF591E3AA@alderaan.smgtec.com>
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
To: Daniel Chemko <dchemko@smgtec.com>
Cc: netfilter@lists.netfilter.org

On Thu, 2005-01-06 at 13:04, Daniel Chemko wrote:

> I'll address this as well. Ntop is fantastic at giving you snapshot data
> of a network, but it is inanely heavy at long term monitoring of
> services. It got to the point that monitoring traffic from the firewall
> filled memory and CPU usage if run long enough. It doesn't work for
> continuous operations.

The thing to keep in mind is that it is keeping a database that
includes all of the remote IP addresses and ports as well as the
local ones, so of course this will grow quickly.  I haven't needed
to deal with long-term histories so I haven't investigated the
possibilities but I do recall something about ntop being able
to start new logs and archive the old ones as needed to limit
the active size.  There are tools to monitor and summarize
netflows between each pair of addresses, but again I haven't
used that part of the package.  There is also some support for
RRD databases which would probably be the way to go for longer
histories.

-- 
  Les Mikesell
   les@futuresource.com



