From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: Re: Question about filtrate the LOG messages of iptables
Date: Mon, 30 Jan 2006 10:26:23 +0100 (CET)
Message-ID: <51676.193.173.147.3.1138613183.squirrel@webmail.sterenborg.info>
References: <6ff3e7140601292239s434b62d7i@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <6ff3e7140601292239s434b62d7i@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

On Mon, January 30, 2006 07:39, openbsd shen wrote:
> When I use "--log-level emerg" or "warn"...  the messages will be
> output to /var/log/messages and the standard output (screen), now I
> want to filtrate the output messages instant for get the useful
> messages, and I don't want to read /var/log/messages periodic, how can
> I do?
> Thanks.

Create a logging rule that only shows you the interesting messages.
I suppose you know what you can log and what you find interesting.

E.g. : if you want to log ssh access (which btw is already logged by
ssh), you can use something like :

$ipt -A INPUT -m state --state NEW -m limit --limit 1/sec \
  -p tcp --dport 22 -j LOG --log-level warn --log-prefix "ipt_ssh: "


Gr,
Rob



