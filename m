From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Firewall script
Date: Tue, 27 Sep 2005 09:55:20 -0400
Message-ID: <65aa6af905092706551e67d8e8@mail.gmail.com>
References: <200509271639.33162.usergroups@theargoncompany.com>
	<52145.193.173.147.3.1127822241.squirrel@webmail.sterenborg.info>
	<65aa6af90509270654746608f7@mail.gmail.com>
Reply-To: Edmundo Carmona <eantoranz@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af90509270654746608f7@mail.gmail.com>
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

On 9/27/05, Rob Sterenborg <rob@sterenborg.info> wrote:
...
>
> $IPTABLES -A FORWARD -i $LAN_IFACE -m state --state NEW \
>   -p tcp --dport 25 -j LOG --log-prefix "SMTP_REJECT: "
> $IPTABLES -A FORWARD -i $LAN_IFACE -m state --state NEW \
>   -p tcp --dport 25 -j REJECT --reject-with tcp-reset
>
.
.
.
I have had this question in my mind for some time by now, but never
had the need to answer it.. however, this post brings it on.

As you can see, first, you have a LOG, and then in the same chain for
the same traffic, you REJECT. What other targets allow traversal to go
on in the same chain?

