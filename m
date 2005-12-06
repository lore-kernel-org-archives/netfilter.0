From: Fred Weston <fweston@gmail.com>
Subject: Redirect all but certain hosts?
Date: Tue, 6 Dec 2005 17:40:05 -0500
Message-ID: <59038a50512061440t4517416t36ccd70f652e7a33@mail.gmail.com>
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

Is it possible to specify multiple MAC address to match a rule?

Example, the rule I am using is:

iptables -t nat -A PREROUTING -i eth0 -m mac --mac-source !
00:00:00:00:00:00 -p tcp --dport 80 -j REDIRECT --to-port 8080

What I want to achieve is any client that is not in my list of MAC
addresses should have their http traffic redirected.  Any traffic from
a client that is in the list of MAC addresses should be left alone.

The rule above matches everything since 00:00:00:00:00:00 should not
match any clients.  What I want to do when I need to allow a new
client through the firewall without being redirected, is flush the
prerouting chain out and re-add the same rule, except with multiple
MAC addresses.

Any help is appreciated.

