From: Rakotomandimby Mihamina <mihamina@mail.rktmb.org>
Subject: Re: Blocking mail relay from the firewall?
Date: Thu, 15 Jul 2004 19:26:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40F6BE5C.6020708@mail.rktmb.org>
References: <s0f66d47.080@mail.toolsnottoys.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <s0f66d47.080@mail.toolsnottoys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Default port for that is 25.
If you wanna block that traffic, just drop whatever is from and to port 25.
But the best way is still to configure your MTA (exim, sendmail, ...) 
server.

