From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Dlink DFE-580TX (4port)
Date: Tue, 9 Dec 2003 09:21:47 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312090921.47810.Antony@Soft-Solutions.co.uk>
References: <200312091022.16100.pandre@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200312091022.16100.pandre@darkstar.nom.za>
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
To: netfilter <netfilter@lists.netfilter.org>

On Tuesday 09 December 2003 8:22 am, Paulo Andre wrote:

> Hi, this is somewhat netfilter related so I hope this is fine.
>
> I have a firewall that had the above mentioned card. I have been using this
> card for sometime and it works great.
> Last week I tried to IP alias a port for nat'ing, and the connection will
> come up and transfer some data then it will slow down immensly, nearly to a
> stand still.
> I tried IP aliasing the port with IP address'es in the same range and
> different range.
> Could the problem be link to netfilter and connection tracking? What could
> I do to pin point the exact problem.

I've used these D-Link cards, and haven't found their performance any 
different from others (such as the older DFE-570TX with the nice Dec Tulip 
chipset); however I've not tried to max out the bandwidth - I'm normally 
dealing with an Internet link of <2Mbps and very little local inter-subnet 
traffic.

Can you try a different card (either another DFE-580, or something other than 
a DFE-580, or four single port cards) to see whether the problem really is 
tied to the card?

I can't quite see why a particular card would work normally but have a problem 
with IP aliasing...

Antony.

-- 
How I want a drink, alcoholic of course, after the heavy chapters involving 
quantum mechanics.

 - 3.14159265358979

                                                     Please reply to the list;
                                                           please don't CC me.


