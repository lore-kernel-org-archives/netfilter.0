From: Jason Opperisano <opie@817west.com>
Subject: Re: Port is open but I am unable to connect
Date: Tue, 07 Sep 2004 16:19:58 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094588398.1890.54.camel@wolfpack.ljm.dom>
References: <413E0B9E.8010708@list.idg.dk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <413E0B9E.8010708@list.idg.dk>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2004-09-07 at 15:27, Jacob Friis Larsen wrote:
> When I add -s 1.2.3.4 I am unable to connect to my server.
> nmap shows that the correct ports are open.
> Any ideas?
> 
> iptables -A INPUT -s 1.2.3.4 -j ACCEPT -p tcp --dport 22 -m state 
> --state NEW

i would content that while you believe your source IP is 1.2.3.4 in this
scenario--it; in fact, is not.

try:

  iptables -A INPUT -j LOG --log-prefix "FW DROP INPUT: "

and see what the logs have to say about it.

-j

-- 
Jason Opperisano <opie@817west.com>


