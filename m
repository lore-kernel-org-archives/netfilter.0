From: "curby ." <curby.public@gmail.com>
Subject: Re: Problem downloading large files from Apache from far
Date: Wed, 27 Jul 2005 23:04:02 -0600
Message-ID: <5d2f379105072722046f7e3285@mail.gmail.com>
References: <mailman.0.1122427457.12364.netfilter@lists.netfilter.org>
	<NJBBIPFCOLMFJFKBPLDMAEJJCCAA.andrewna@mymcsb.com>
Reply-To: "curby ." <curby.public@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <NJBBIPFCOLMFJFKBPLDMAEJJCCAA.andrewna@mymcsb.com>
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
To: Andrew <andrewna@mymcsb.com>
Cc: netfilter@lists.netfilter.org

On 7/26/05, Andrew <andrewna@mymcsb.com> wrote:
> But the question is, why are subsequent packets coming from the remote
> machine being identified as INVALID? Will allowing INVALID packets cause
> other problems?

Allowing INVALID is generally unnecessary, and can let certain port
scans through undetected.

> The Linux machine is actually behind another Cisco PIX firewall. Could th=
e
> hardware firewall be translating the packets wrongly? Any ideas?

Can you try with a machine between the firewalls?  That would simulate
a web request but bypass PIX.

[iptables]---[testbox]---[PIX]---[Internet]

Running a tcpdump might also give useful information.

