From: Jason Opperisano <opie@817west.com>
Subject: Re: Protecting multiple webservers
Date: Wed, 19 Jan 2005 15:58:00 -0500
Message-ID: <20050119205800.GA13202@bender.817west.com>
References: <48be50bb0501191237386d15c8@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <48be50bb0501191237386d15c8@mail.gmail.com>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

On Wed, Jan 19, 2005 at 12:37:06PM -0800, gui wrote:
> # allow outgoing connections from web servers.
> # added these lines so I can browse the web from the web servers 
> -A OUTPUT -d 0/0 -m state --state NEW -p tcp -m multiport --dport
> http,https -o eth0 -j ACCEPT
> 
> -A FORWARD -s 192.168.0.3 -d 0/0 -m state --state NEW -p tcp -m
> multiport --dport http,https -o eth0 -i eth1 -j ACCEPT
> -A FORWARD -s 192.168.0.2 -d 0/0 -m state --state NEW -p tcp -m
> multiport --dport http,https -o eth0 -i eth1 -j ACCEPT

uh--where are the "allow incoming connections to my web servers" lines?

  -A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.2 --dport 80 \
    -j ACCEPT

  -A FORWARD -i eth0 -o eth1 -p tcp --syn -d 192.168.0.3 --dport 80 \
    -j ACCEPT

make sure you also enabled IP forwarding:

  sysctl -w net.ipv4.ip_forward=1

-j

--
"Look, just give me some inner peace, or I'll mop the floor with ya!"
        --The Simpsons

