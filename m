From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Instructions on how to redirect port 80 to port 8080
Date: Wed, 18 Feb 2004 15:11:14 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402181511.14159.Antony@Soft-Solutions.co.uk>
References: <9908FCB837A50642B74E2BEC198843095CC655@csrees-exchsrvb.csrees.usda.gov> <1077116509.40337e5d7ef5f@www.realdealz.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1077116509.40337e5d7ef5f@www.realdealz.ch>
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

On Wednesday 18 February 2004 3:01 pm, Fabian Hartmann wrote:

> > The telnet's being done from the box itself, telneting to the network ip
> > (not loopback) of the box.

Oh!   I recommend not doing this, since it doesn't test the same bits of the 
ruleset as packets coming from another machine (which is what I assume you 
really want the rules to do).   I did think you were testing from another 
machine.

> > The same response occurs if the telnet is done from another box.

In that case put a LOG rule just before the REJECT, as I suggested in my last 
posting, then we can see exactly what got REJECTed.

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


