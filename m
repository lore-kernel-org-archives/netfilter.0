From: Marco Shaw <marco@nbnet.nb.ca>
Subject: Re: TWO ROUTING
Date: Wed, 19 Nov 2003 19:58:39 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1069286319.8297.17.camel@rhelas3>
References: <09B04A55822EFF4DA48D2E0BB2941D4A28AD45@wardrive.citadelcomputer.com.au>
	 <200311202234.hAKMYY723743@onyx.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311202234.hAKMYY723743@onyx.rockstone.co.uk>
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


> > There was talk before about using CONNTRACK and marking packets on the list
> > before.. I think this is the solution but I didn't see a successful
> > response..
> 
> You can MARK packets on their way through netfilter, and do various 
> interesting and possibly useful things to the packet on the basis of the mark 
> which was assigned, however I do not think there is any way of identifying 
> the packets which come in later as replies to these, and thereby doing 
> anything based on the mark which was assigned to the first packet on its way 
> through.

Something I'm working on (or at least thinking really hard about) is a
user-space Perl script that will (somehow) record sequence and
acknowledgment numbers for outgoing packets, then possibly act on the
returning packets depending on the ack and seq numbers found.

Am I way off, or would this help/apply here?

Marco


