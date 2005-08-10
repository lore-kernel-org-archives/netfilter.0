From: Robb Bossley <robb.bossley@gmail.com>
Subject: A Simple Question
Date: Tue, 9 Aug 2005 20:11:52 -0400
Message-ID: <5c685153050809171164af25e4@mail.gmail.com>
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
To: netfilter@lists.netfilter.org

I have been using Linux for quite some time, and I really enjoy the
power that is available with netfilter.  Thank you for all of your
input into the development and testing of it.

I have used other people's scripts to configure my firewall for a
number of years, though I usually rolled my own kernels for this.

I have been reading the mailing list posts and it seems that most of
you who are very knowledgeable with netfilter would propose a default
policy of DROP on both the INPUT and FORWARD chains.

iptables -P INPUT DROP
iptables -P FORWARD DROP
=20
However, I have noticed that a number of what I would consider to be
strong contenders in the market use default policies of ACCEPT and
then have a DROP rule at the end of the tables / chain.

iptables -P INPUT ACCEPT
iptables -P FORWARD ACCEPT
...................................(other stuff here)......................=
....
iptables -A INPUT -j DROP
iptables -A FORWARD -j DROP

I'm confused.  Which is preferred for security and why?  (Or is this
just six of one, half a dozen of another?)
--=20
As if you could kill time without injuring eternity.  The mass of men
live lives of quiet desperation.
- Henry David Thoreau

