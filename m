From: Amitabh Kant <amitabhkant@gmail.com>
Subject: Re: 2 DSL connection
Date: Mon, 6 Feb 2006 13:36:15 +0530
Message-ID: <84b68b3d0602060006u471ce5abic639b8e13f1d7478@mail.gmail.com>
References: <1139149508.4793.2.camel@nirvana.aurokruti.in>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1139149508.4793.2.camel@nirvana.aurokruti.in>
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
To: varun <varun_saa@rediffmail.com>
Cc: netfilter@lists.netfilter.org

Hi

You can also take a look at the "nth" and/or "random" extensions for
netfilter.  Either of these two alongwith the route command should
give you the desired result.

Amitabh

On 2/5/06, varun <varun_saa@rediffmail.com> wrote:
> Hello,
>
> I want to use 2 DSL connections on one
> system.
>
> eth0 - DSL1 with static IP
>
> eth1 - DSL2 with static IP
>
> eth2 - LAN
>
> I would like all traffic from eth2(LAN)
> to be distributed equally between DSL1
> and DSL2.
>
> Is it possible to do that using iptables  ?
>
> Thanks in advance
>
> Varun
>
>
>

