From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ftp
Date: Thu, 20 May 2004 21:31:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200405202131.06606.Antony@Soft-Solutions.co.uk>
References: <BAY15-F20Do3w9XBv7Q00092cb1@hotmail.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BAY15-F20Do3w9XBv7Q00092cb1@hotmail.com>
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

On Thursday 20 May 2004 9:10 pm, azeem ahmad wrote:

> no single server of ftp is accessible. wheather any server is near to me or
> far away if it is ftp then it isnt accessible from my network.

Okay - now that I clearly understand the problem, please post the output of:

iptables -L -nvx; iptables -L -t nat -nvx

> and may i have ur collection of quotes

Sure - they are all available from 
http://lists.netfilter.org/pipermail/netfilter or 
http://lists.netfilter.org/pipermail/netfilter.mbox/netfilter.mbox (which is 
quite a large file, but they're all in there somewhere).

Regards,

Antony.

-- 
In Heaven, the police are British, the chefs are Italian, the beer is Belgian, 
the mechanics are German, the lovers are French, the entertainment is 
American, and everything is organised by the Swiss.

In Hell, the police are German, the chefs are British, the beer is American, 
the mechanics are French, the lovers are Swiss, the entertainment is Belgian, 
and everything is organised by the Italians.

                                                     Please reply to the list;
                                                           please don't CC me.


