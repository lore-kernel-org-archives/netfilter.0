From: "Stephen J. Smoogen" <smooge@gmail.com>
Subject: Re: ACK PSH blocked
Date: Mon, 7 Nov 2005 11:27:40 -0700
Message-ID: <80d7e4090511071027w74956666g4a7bf1a24846c9fa@mail.gmail.com>
References: <cc4fcc140511040835m6e03feeem2a8d31516d4bf36c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <cc4fcc140511040835m6e03feeem2a8d31516d4bf36c@mail.gmail.com>
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

On 11/4/05, Carlos Pastorino <carlos.pastorino@gmail.com> wrote:
> Hi everyone,
>
> My question is targeted to understanding Netfilter, because I know
> that the dropped packets are not impacting on the connection.
>
> My firewall is configured like this (showing only the important informati=
on):
>
> IPTABLES -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> IPTABLES -A FORWARD -p TCP -i $INET -o $LAN --syn --dport http -j ACCEPT
>
> and I've been noticing that packets with the ACK PSH flags set are
> dropped during the connection.
>
> I know that it's not because of the connection tracking, since the
> drops are occurring during the connection, not a long time after the
> connection, so they are definitely ESTABLISHED packets. And since
> ESTABLISHED packet should get through, I wonder why those are being
> blocked.

Are they really established? Or are they duplicates of existing
packets that are being dropped because they cant be 'established'
packets.

I think you would need to give more information about the stream to
figure out what the cause is.

--
Stephen J Smoogen.
CSIRT/Linux System Administrator

