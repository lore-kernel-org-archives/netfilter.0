From: "Adam" <adam@sccode.com>
Subject: Layer (5,6,7) based NAT
Date: Sun, 29 Apr 2007 07:42:23 -0600 (MDT)
Message-ID: <44301.80.177.104.4.1177854143.squirrel@webmail.modwest.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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

I am wondering weather this is possible. I have one port and one public I=
P
address lets say:

34.123.22.33:5615

If I connect using SSH I want to DNAT to port 22, if I connect using SSL =
I
want to DNAT to port 443, if I connect using HTTP I want to DNAT to port
80.

If this kind of upper layer protocol determination possible? If so, is
netfiter the application to do it?


