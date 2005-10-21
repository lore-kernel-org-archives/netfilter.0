From: Zac Hansen <xaxxon@gmail.com>
Subject: LAN Port forwarding with a dynamic IP address
Date: Fri, 21 Oct 2005 04:00:22 -0700
Message-ID: <7f6703390510210400n3ea01619p3e46ee81bd7badc3@mail.gmail.com>
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

I have a single, dynamic IP address. I have multiple boxes behind a linux
router, one of which runs a web server on port 80. I have set up rules (a
PREROUTING and a FORWARD rule) to let people outside my LAN deal see my web
server. The problem is that the boxes on my LAN can't see them.

I really don't want to hardcode my external IP address into any rules and I
don't want to do any DNS work to make the LAN boxes look up the actual
server's LAN IP address directly.

Can I get my LAN boxes to see my web site and not do the things I don't wan=
t
to do?

Thanks.

--Zac
