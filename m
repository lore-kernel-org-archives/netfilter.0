From: Greg Cope <gregcope@gmail.com>
Subject: How to make a mutli-homed host use one IP for a NAT'ed host
Date: Thu, 21 Apr 2005 07:52:27 +0100
Message-ID: <c0e9781f0504202352240208e4@mail.gmail.com>
Reply-To: Greg Cope <gregcope@gmail.com>
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

Hi All,

I have a mutli-homed router/firewall.

One IP address is the default router gateway address

Three other (virtual) IP's are for applications (one of which is SMTP).

My mailserver is on a NAT'ed DMZ.

However when it sends mail the router uses the default gateway address
as opposed to the SMTP IP address.

This upsets reverse DNS lookups as it now appears to come from the
router as opposed to the mail IP (that has the correct reverse IP
address lookup).

Any ideas?

Greg

