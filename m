From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: connection time
Date: Mon, 12 Dec 2005 19:00:22 +0100
Message-ID: <000001c5ff45$ec1cbda0$0101000a@sterenborg.info>
References: <1134408268.2824.2.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1134408268.2824.2.camel@localhost.localdomain>
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

> hi,
> Is there a way to limit the ssh connection time through via an
> Iptables rule ?

- If you are referring to a start date/time and stop date/time, you can
use the time patch.

- If you are referring to limiting a connection to eg 20 minutes from
the time the connection was initiated, you can use the expire patch.


Gr,
Rob


