From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Forward specific port to another ip
Date: Tue, 27 Dec 2005 16:55:00 -0400
Message-ID: <65aa6af90512271255g1d90b33eg50a61f08ca16ce3b@mail.gmail.com>
References: <a46d47540512271036v71e355epf1f87cbb564b2996@mail.gmail.com>
	<005101c60b19$4f252480$1101a8c0@quebec>
	<65aa6af90512271254rb572182o3309a5f415b1256d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90512271254rb572182o3309a5f415b1256d@mail.gmail.com>
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

Remember I said "for starters". You have to consider more things in
order to make it work... depending on your networking environment. :-)

On 12/27/05, Richard Pickett <Richard.Pickett@csrtechnologies.com> wrote:
> Here's something to keep in mind on NAT, it only works if the NAT box is
> in-between both systems or you can double-NAT.
>
> Take this example:
>
>
>     NAT BOX
>        |
> -----------------
> |               |
> SYS A          SYS B
>
>
> A connects to NAT A's connection looks like this:
>
> From: A:Portx
> To:   NAT:Porty
>
> NAT NATs the packet to send it to B, the packet now looks like this:
>
> From: A:Portx
> To:   B:Porty
>
> When B replies to the connection his packet looks like this:
>
> From: B:Porty
> To:   A:Portx
>
> When this packet arrives at SYS A it doesn't recognize the connection,
> it's expecting all return packets to look like this:
>
> From: NAT:Porty
> To:   A:Portx
>
> To make it work you have to double-NAT the packets. You have to NAT the
> PREROUTING to change the "TO", and the POSTROUTING to change the "FROM".
>
>
>

