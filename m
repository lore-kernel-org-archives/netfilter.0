From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: active firewall
Date: Tue, 23 Sep 2003 18:18:25 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0309231812340.4494@xena.cft.ca.us>
References: <03092320103102.01185@slinky.exmosys.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <03092320103102.01185@slinky.exmosys.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Nik Trevallyn-Jones <nik@designer.com.au>
Cc: netfilter@lists.netfilter.org

On Tue, 23 Sep 2003, Nik Trevallyn-Jones wrote:
>    As a result of experiences deploying PortSentry behind an ipchains
> firewall recently, I started considering how iptables could be used to deploy
> a dynamic firewall which would be able to modify itself in response to
> predefined events. As far as I can see, such features would require extension
> modules.

Take a look at the ULOG target which will send a copy of the packet to a
netlink socket.  A listening daemon can then do wierd and wonderful
modifications to the tables.  There's the issue that the table changes
wouldn't happen until the daemon got the CPU, so a few :-) milliseconds
delay could be expected, but in the scenario you described, that would be
tolerable.

The less brains are in the kernel, the less things can go wrong and
splatter.  Hope this helps.

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

