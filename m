From: Roy Sigurd Karlsbakk <roy@karlsbakk.net>
Subject: Re: IRC and Conntrack problem
Date: Sun, 03 Nov 2002 19:11:21 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DC566C9.2050109@karlsbakk.net>
References: <00d601c28286$83cf1390$6928a8c0@MIHAI>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mihai Tanasescu <cloud@sky.kappa.ro>, netfilter <netfilter@lists.netfilter.org>

Mihai Tanasescu wrote:

> I have installed the kernel module for conntracking irc connections. 
> Still I can only receive dcc sends but I can't initiate any dcc send 
> sessions. I get the error message failed to connect or something like 
> that. 
> What am I doing wrong?

have you got any lines in iptables looking like this?

iptables -A INPUT -p tcp -m state --state RELATED,ESTABLISHED -j ACCEPT

please send your iptables config




