From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Netfilter journey of a locally generated packet?
Date: Tue, 25 Apr 2006 14:07:34 +0200 (CEST)
Message-ID: <61019.193.173.147.3.1145966854.squirrel@webmail.sterenborg.info>
References: <6C7A33B8773A2E4C9BDF935D13FA3E71630D4D@MAIL1.mediatrix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6C7A33B8773A2E4C9BDF935D13FA3E71630D4D@MAIL1.mediatrix.com>
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

On Mon, April 24, 2006 20:43, Pierre-Marie Wecowski wrote:
> Hi,
>
> Is there an exact and complete diagram of a packet journey inside
> netfilter?
>
> I have found something strange that may require some explanation:
>
> I am running Linux 2.6.11 on a device with two network interfaces.
>
> When I generate locally (local process) a packet (UDP for instance) wit=
h
> a source address of one interface and a destination address of the
> other, the packet go through PREROUTING chain in the mangle table but
> not in the nat table.
>
> Is there a reason behind this behaviour?

Because the IP is not NAT-ed, just routed ??


Gr,
Rob



