From: John <futurasci@gmail.com>
Subject: Re: Strange ip_conntrack values
Date: Sun, 18 Jul 2004 18:19:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <ef83df6b04071809196afdf5aa@mail.gmail.com>
References: <ef83df6b040718033163810a15@mail.gmail.com> <200407181313.47640.Antony@Soft-Solutions.co.uk> <ef83df6b04071806565f854eb6@mail.gmail.com> <200407181617.52652.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200407181617.52652.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

> Good.   That to me looks like a good TCP sequence, however there is one packet
> missing - the ACK response from "mydomain" to 24.33.232.227 in response to
> the FIN-ACK sent by 24.33.232.227 in packet number 1488.   Until this missing
> response is seen by netfilter, it will regard that connection as being in the
> TIME_WAIT state, however this will expire after 2 minutes.

yep strange ... for many sequences it's the same thing. the web server
is under Red Hat 7.2. Could it come from it? This phenomenon with many
network interrupts appeared one day without any important change from
us ...

is it possible to exclude the IP that run this sequence ?

what could I check ? do you think it could be a kind of attack? thanks
because I'm lost ... don't konw what to do with this problem

