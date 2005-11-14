From: Sai Kiran <saikiranrgda@gmail.com>
Subject: Re: SSH fails on 22 - Restrictive rules
Date: Mon, 14 Nov 2005 17:52:03 +0530
Message-ID: <7c6561690511140422u2db119bel504bf82fe9f579dd@mail.gmail.com>
References: <BAY102-F16251BBCA3EA823A8003A6AE5B0@phx.gbl>
Reply-To: marlinspike_tom@yahoo.co.in
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY102-F16251BBCA3EA823A8003A6AE5B0@phx.gbl>
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
To: P theodorou <props666999@hotmail.com>, netfilter@lists.netfilter.org

hai,

On 11/14/05, P theodorou <props666999@hotmail.com> wrote:
> Hello
>
> the  usual user name cannot be displayed

> $IPTABLES -A TCPbad -p tcp ! --syn -m state --state NEW -j DROP # DROP NE=
W
> NOT SYN


doesn't the above rule drop all the out of nowhere pkts. i mean like a
syn,ack or a fin pkt.


hope i haven't got it wrong this time.
regards,
kiran

