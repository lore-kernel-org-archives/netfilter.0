From: Jorge Armando Medina <jmedina@calcom.com.mx>
Subject: Re: GRE/PPTP Pass-through problems
Date: Thu, 04 Sep 2003 09:27:58 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1062692878.965.4.camel@jorgea.calcom.com.mx>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I had the same problem, and I solved it putting in my options.pptpd
configuration file as follow:

lcp-echo-failure 30
lcp-echo-interval 5

This is to prevent timeouts in the client side, with the
lcp-echo-faliure  your server send echo request to the clients for
respons when are an idle time, so you can modify this parameter to a
higher value.


I hope this will solve your problem, well, It was enough for me.

regards.


