From: Sheldon Hearn <sheldonh@clue.bz>
Subject: Re: CONNMARK No chain/target/match problem
Date: Mon, 28 Jun 2004 19:31:20 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1088443880.2781.121.camel@axl.seasidesoftware.co.za>
References: <BA19D698-C6D3-11D8-B530-000A95D9C698@chilitech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <BA19D698-C6D3-11D8-B530-000A95D9C698@chilitech.net>
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
To: Michael Eck <meck@chilitech.net>
Cc: netfilter@lists.netfilter.org

On Fri, 2004-06-25 at 20:16, Michael Eck wrote:

> I'm unable to get CONNMARK rules to work.  Issuing
> # iptables -t mangle -A PREROUTING -p tcp -j CONNMARK --restore-mark
> yields:
> # iptables: No chain/target/match by that name
> 
> Now, I've loaded ip_conntrack module with
> # modprobe ip_conntrack
> lsmod indicates that the module is loaded

You need

1) the connmark kernel module, ipt_CONNMARK.ko, and
2) the iptables userland library, libipt_CONNMARK.so.

Connection tracking and connection marking are different things,
although the latter is implemented as an extension to the former.

Ciao,
Sheldon.



