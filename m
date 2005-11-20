From: Daniel <damage@rooties.de>
Subject: Re: DROP or REJECT?
Date: Sun, 20 Nov 2005 19:44:33 +0100
Message-ID: <200511201944.33472.damage@rooties.de>
References: <000001c5ee00$f8343970$2801a8c0@MBRC40>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <000001c5ee00$f8343970$2801a8c0@MBRC40>
Content-Disposition: inline
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
To: netfilter@lists.netfilter.org

hm.... I think sending "host unreachable" from the host which should not be 
reachable is not what you want. Alos sending "host unreachable" will increase 
your traffic (not much, but it did :) ).
But I think most "attack" tools will ignore trys to make yourself invisible.

greez
Daniel

Am Sonntag, 20. November 2005 19:33 schrieb Michael D. Berger:
> For blocking various attacks on ports 22 and 80,
> I have been using:
>    -j REJECT --reject-with icmp-host-unreachable
> To minimize future attempts, is this best, or is
> there a better idea, such as DROP?
> Thanks for your advice,
> Mike.
> --
> Michael D. Berger
> m.d.berger@ieee.org

