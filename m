From: Steve Mickeler <steve@warning.ca>
Subject: Re: Binding output traffic to specific (aliased) interface
Date: Tue, 11 Mar 2003 23:46:24 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303112344180.13050@gypsy>
References: <D7FB597C5A18824C9A257EC757CEAF4C344D90@pepsi.teamlynx.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D7FB597C5A18824C9A257EC757CEAF4C344D90@pepsi.teamlynx.com>
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
To: "Barry L. Jeung" <bjeung@teamlynx.com>
Cc: netfilter@lists.netfilter.org


$IPTABLES -t nat -A POSTROUTING -o $EXT_INT -s $CS_BOX -j SNAT --to-source
x.x.x.211


On Tue, 11 Mar 2003, Barry L. Jeung wrote:

> Sorry guys, I know this is a simple question but I'm pretty brain dead
> right now. Basically, I have a firewall and a CS (Counter-Strike) server
> behind it. The physical interface on the firewall is .210 and I have an
> aliased interface as .211 . I have a rule for forward inbound CS traffic
> (UDP port 27015) on the aliased interface to the internal box. All
> normal gameplay works fine. However, because I'm doing NAT, some
> outbound traffic (master server communication) is going out from the
> .210 address. How can I specify that all traffic with source from my CS
> box goes out the aliased interface? TIA
>

