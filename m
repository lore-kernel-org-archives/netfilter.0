From: Jason Opperisano <opie@817west.com>
Subject: Re: transparent bridge troubles?
Date: Fri, 7 Jan 2005 17:18:22 -0500
Message-ID: <20050107221822.GA1569@bender.817west.com>
References: <7C9884991ADAE0479C14F10C858BCDF591E3AC@alderaan.smgtec.com>
	<005101c4f504$7be50f20$3e0010ac@esonet18>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <005101c4f504$7be50f20$3e0010ac@esonet18>
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

On Fri, Jan 07, 2005 at 05:01:47PM -0500, mdpeters wrote:
> Both host and target have no information about the bridge | firewall in the 
> middle.

the arp caches of hosts on either side of the firewall should have
entries for hosts on the other side though.  try and ping from a host
on one side of the firewall to a host on the other side of the firewall.
after the ping, type "arp -an" on the host you pinged from; if you don't
have an entry for the host you pinged--you have a bridge problem.  if
you do have an arp entry, but the ping didn't work--you have a firewall
problem.

-j 

--
"English - Who needs that? I'm never going to England!"
        --The Simpsons

