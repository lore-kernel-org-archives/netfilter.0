From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: random IP
Date: Fri, 23 Dec 2005 14:09:21 +0100 (CET)
Message-ID: <62841.193.173.147.3.1135343361.squirrel@webmail.sterenborg.info>
References: <002e01c607bc$c2949000$2f00a8c0@TRINTASETE>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <002e01c607bc$c2949000$2f00a8c0@TRINTASETE>
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
To: Pedro TRImel Neto <pedrodrimel@uol.com.br>
Cc: netfilter@lists.netfilter.org

On Fri, December 23, 2005 13:31, Pedro TRImel Neto wrote:
> Hi all,
>
> I need to do that the connections from a linux box to other change
> the IPs in random...
>
> Scenario: A Linux box that has an phisic interface and two logic as
> eth0 eth0:0 eth0:1 with the ips 10.0.0.1 10.0.0.2 10.0.0.3
>
> I did this rule:
> iptables -t nat -A POSTROUTING -p tcp -d 10.0.0.4 -j SNAT --to
> 10.0.0.2
>
> OK but I need that when do a ssh 10.0.0.4 each time it change de IP
> ... one time with 10.0.0.1 the other 10.0.0.2 or 10.0.0.3... Or a
> rule per user...
> example the user pedro has a rule that when he connect to 10.0.0.4
> the IP will be 10.0.0.2...

Do you want some kind of load-balancing ?
If so, a few days ago there was a post here on how to do that.


Gr,
Rob



