From: James Courtier-Dutton <james.dutton@gmail.com>
Subject: Number of forwarding tables.
Date: Wed, 5 Oct 2005 23:23:46 +0100
Message-ID: <ad2655cb0510051523k190e435cl@mail.gmail.com>
Reply-To: James Courtier-Dutton <james.dutton@gmail.com>
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

Hi,

The linux kernel seems to support 255 forwarding tables.
Is there any way to expand this?
For example, in order to support more than 255 Virtual Routers (e.g.
1000), with each router only having a few routes in it.

James

