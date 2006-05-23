From: "Elijah Alcantara" <elijah.alcantara@gmail.com>
Subject: Re: Transparent proxy using squid, redirect all ssl/https ... ?
Date: Tue, 23 May 2006 10:48:43 +0800
Message-ID: <b4a631130605221948l679f87d0o566d39b1ae64af52@mail.gmail.com>
References: <b4a631130605211917t7a747ceeo6d9f22b067d67466@mail.gmail.com>
	<8963106281166041607@unknownmsgid>
	<b4a631130605220452i18a16d12tbb97a35433ebda9b@mail.gmail.com>
	<4472025A.1050709@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4472025A.1050709@rtij.nl>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

> Ah, I see. How about
>
> -A POSTROUTING -p tcp --dport 443 -j SNAT --to  192.168.100.2
>
> Don't forget to turn on forwarding as well and create appropriate
> forwarding rules.
>

Yesss! that one worked. I should'nt have pointed it to 192.168.100.3,
oops. This takes care of the https/ssl requests, I guess all that's
left are the ports used by our email clients.

Thanks!
Elijah A.

