From: Shawn <core@enodev.com>
Subject: Re: kazaa rulset
Date: 28 Jul 2003 16:51:04 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059429064.6146.11.camel@localhost>
References: <3F2598BD.6050302@sat.com.py>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2598BD.6050302@sat.com.py>
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
To: juanca <juanca@sat.com.py>
Cc: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Having some trouble?

On Mon, 2003-07-28 at 16:42, juanca wrote:
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
> iptables -A FORWARD -p tcp -m state --state NEW -m string --string 
> "Kazaa" -j DROP
> 
> this is my rulset but get this message when run the script what`s wrong?
> iptables: No chain/target/match by that name
> iptables: No chain/target/match by that name
> Bad argument `tcp'
> Try `iptables -h' or 'iptables --help' for more information.
> Bad argument `udp'
> Try `iptables -h' or 'iptables --help' for more information.
> iptables: No chain/target/match by that name
> iptables: No chain/target/match by that name
> iptables: No chain/target/match by that name
> iptables: No chain/target/match by that name
> iptables: No chain/target/match by that name
> iptables v1.2.6a: Couldn't load match 
> `--string':/lib/iptables/libipt_--string.so: cannot open shared object 
> file: No such file or directory
> 
> Try `iptables -h' or 'iptables --help' for more information.
> iptables: No chain/target/match by that name

