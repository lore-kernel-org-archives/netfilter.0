From: "Jeffrey Carter" <jeffreyc@gimi.org>
Subject: Redirecting packet from incoming external interface to a different
	external machine.
Date: Mon, 15 Aug 2005 14:04:04 -0400
Message-ID: <1374867BD86E3748B9FB02AC5EDE4282C61A73@gimi-fs1.gimi.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

=20

Here is what I'm looking to do (And please tell me if I'm crazy as I've
been beating my head on this for a week)

=20

I'm looking to take a packet that is incoming on my machine, on port 21
and redirect it to port 3805 on a completely different external machine.
Basically, I'm trying to solve how to make the machine a transparent
proxy on the same external interface.  The packets coming in on port 21
can be coming from anywhere on the internet, and will be sent to port
3805 on the remote machine, which then should come back through my box
and back to the clients.

=20

Any ideas on using iptables for this?  I dusted off redir and while it
worked it had its occasional issues so I'm trying to bring a better
hammer to beat on the nail.

=20

