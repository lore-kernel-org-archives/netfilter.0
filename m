From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: Forwarding while on same subnet...confusions (nfcan: addressed
	to exclusive sender for this address)
Date: Thu, 25 Nov 2004 10:07:11 -0500
Message-ID: <20041125150711.GA27717@salty>
References: <dc56727e041123110948cb3a14@mail.gmail.com>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <dc56727e041123110948cb3a14@mail.gmail.com> (from
	+nfcan+jimlaur+77cd5e9588.mismith356#gmail.com@spamgourmet.com
	on Tue, Nov 23, 2004 at 14:09:12 -0500)
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
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.11.23 14:09, Mike Smith - mismith356@gmail.com wrote:
> Hello All,
>
.......
> and then, after some google'ing and reading:
> 
> iptables -t nat -A POSTROUTING -s 138.1.89.6 -p tcp --dport 80 -j SNAT
> --to 138.1.88.246
>

One more observation.
The postrouting is looking for packets with a *destination* port 80.

I think this rule is meant to deal with packets from the apache server
returning to the client. I think apache will have a well known
*source* port of 80 in this case, the destination port is random.

You could look with a sniffer to check.
Or look at the packet counters to see if it is matching.
........

