From: Tobias DiPasquale <codeslinger@gmail.com>
Subject: Re: ip_conntrack limit && stateless firewalls
Date: Fri, 11 Feb 2005 09:55:36 -0500
Message-ID: <876ef97a05021106551fb5dacb@mail.gmail.com>
References: <Pine.CYG.4.62.0502110943440.2348@MI340a.chem.mathsci.usna.edu>
Reply-To: Tobias DiPasquale <codeslinger@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.CYG.4.62.0502110943440.2348@MI340a.chem.mathsci.usna.edu>
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

On Fri, 11 Feb 2005 09:49:40 -0500, Kevin Van Workum <vanw@usna.edu> wrote:
> I'm having a problem with my firewall where packets are being dropped due
> to the ip_conntrack limit. I could up the limit, but my users need 30k+
> connections simultaneously and with the minimum overhead. And I only have
> 1 firewall box. So I'd like to disable or by-pass ip_conntrack some how to
> avoid dropped packets and reduce over head. How can I do this, and more
> importantly, would it be helpful.

You can use the NOTRACK target on the traffic that is causing the
problem (which will disable using ip_conntrack on that traffic), or
you can decompile conntrack altogether. The latter would basically
make the firewall stateless. man iptables for more info on using
NOTRACK.

-- 
[ Tobias DiPasquale ]
0x636f6465736c696e67657240676d61696c2e636f6d

