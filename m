From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: again problem with alias / virtual interface
Date: Mon, 19 Jul 2004 20:58:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407192058.05629.Antony@Soft-Solutions.co.uk>
References: <d3caf706513e42bc4d4a4a08209f5cd9@62.98.80.108> <40FC251E.8090506@nucdc.org>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40FC251E.8090506@nucdc.org>
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

On Monday 19 July 2004 8:46 pm, Jamie Pratt wrote:

> Batstru wrote:
> >
> > eth1 --> 82.186.92.90 / 255.255.255.248
> >
> > ip addr add 82.186.92.90/24 brd 82.186.92.95 dev eth1 label eth1:0
>
> well, for starters, a /24 network of your ip addressing should have a
> broadcast address of 82.186.92.255 - if your broadcast ip you have there
> *is* your broadcast address (.95), your network is diced up a bit more..
> if you know the size of your ip address space, this may help?

I would suggest /29, based on the netmask 255.255.255.248 given above.

Regards,

Antony.

-- 
People who use Microsoft software should be certified.

                                                     Please reply to the list;
                                                           please don't CC me.


