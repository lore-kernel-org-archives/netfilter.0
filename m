From: Visham Ramsurrun <vishamr2000@gmail.com>
Subject: Re: netfilter Digest, Vol 10, Issue 70
Date: Wed, 25 May 2005 14:24:17 +0400
Message-ID: <9927912d050525032492c5882@mail.gmail.com>
References: <42943c13.3526efb1.0a62.1844SMTPIN_ADDED@mx.gmail.com>
Reply-To: Visham Ramsurrun <vishamr2000@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42943c13.3526efb1.0a62.1844SMTPIN_ADDED@mx.gmail.com>
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

>> If the answer to the above is no, would the connection be
>>considered as ESTABLISHED if the default behaviour of >>ip_conntrack
was used?
=20
>what on earth do you mean by this statement?

What I mean by this is that the when a protocol is unknown to the
ip_conntrack module if you don't have or don't want to use helper
conntrack modules like that for TCP or FTP), connection tracking
adopts a default method for handling these packets. It resembles the
handling of UDP packets. When this default behaviour is used, even a
packet that is not the SYN packet is considered as NEW. A second
packet in the reverse direction (reply packet) will set the connection
state to ESTABLISHED.

Many thx for the reply...pls do respond to what I've written.

Warm regards,
Visham

