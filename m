From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: NATing out going packets
Date: Wed, 10 Dec 2003 17:02:39 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200312101702.39572.Antony@Soft-Solutions.co.uk>
References: <20031210094947.49b59fdf.mgale@utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031210094947.49b59fdf.mgale@utilitran.com>
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

On Wednesday 10 December 2003 4:49 pm, Michael Gale wrote:

> Hello,
>
> 	I have kind of a dumb question :)
>
> Right now I have the following rule for NATing out going traffic.
>
> $IPT -t nat -A POSTROUTING -o $EXT_FACE -s ! $EXT_IP -j SNAT --to-source
> $EXT_IP

There is no point in specifying "-s ! $EXT_IP".

Either a packet has the source address $EXT_IP, or it doesn't.

If it does have that address, it won't match the above rule, and will exit the 
box with the source address $EXT_IP.

If it does not have that address, it will match the above rule, and will exit 
the box (after being SNATted) with the source address $EXT_IP.

Either way the end result is exactly the same, so keep the rule simpler and 
remove the "-s ! $EXT_IP".

Antony.

-- 
All matter in the Universe can be placed into one of two categories:

1. Things which need to be fixed.
2. Things which need to be fixed once you've had a few minutes to play with 
them.

                                                     Please reply to the list;
                                                           please don't CC me.


