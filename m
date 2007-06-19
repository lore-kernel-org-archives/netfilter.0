From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: REJECT doesnt work
Date: Tue, 19 Jun 2007 07:54:35 +0200
Message-ID: <01c501c7b236$54be1530$0b0ffe0a@NS006819>
References: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <34b8543c0706182222i307aa705y6e705857428eb9ee@mail.gmail.com>
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

> Hi All
> I have following line to drop any request that is not from the
> original computer and it works fine
> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
> 00:11:2F:29:96:84  -j DROP 
> 
> but now I want to change it to REJECT but it doesnt work and iptables
> will fail 
> 
> -A PREROUTING -s 192.168.0.157 -p tcp -m mac --mac-source !
> 00:11:2F:29:96:84  -j REJECT --reject-with=icmp-host-pro hibited
> 
> what is the problem?

# man iptables

REJECT
[...]
This target is only valid in the INPUT, FORWARD and OUTPUT chains, and
user-defined chains which are only called from those chains.
[...]

The PREROUTING chain doesn't fit into this category thus REJECT cannot
be used.


Grts,
Rob



