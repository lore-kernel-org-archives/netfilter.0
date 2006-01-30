From: openbsd shen <openbsd.shen@gmail.com>
Subject: Question about filtrate the LOG messages of iptables
Date: Mon, 30 Jan 2006 14:39:33 +0800
Message-ID: <6ff3e7140601292239s434b62d7i@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter <netfilter@lists.netfilter.org>

When I use "--log-level emerg" or "warn"...  the messages will be
output to /var/log/messages and the standard output (screen), now I
want to filtrate the output messages instant for get the useful
messages, and I don't want to read /var/log/messages periodic, how can
I do?
Thanks.

