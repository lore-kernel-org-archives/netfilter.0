From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: Re: Relay to DNS Server ?
Date: Wed, 16 Jun 2004 15:53:19 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040616155319.3ae01819.leslie.polzer@gmx.net>
References: <1613.64.2.245.108.1087318849.squirrel@64.2.245.108>
	<1087319969.3576.12.camel@anduril.intranet.cartel-securite.net>
	<1724.64.2.245.108.1087321922.squirrel@64.2.245.108>
	<40D04BB9.2030907@akao.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40D04BB9.2030907@akao.fr>
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

On Wed, 16 Jun 2004 15:31:37 +0200
Akao <technique@akao.fr> wrote:

> Is it possible to use netfilter rules to "relay" clients DNS requests ?
Masquerading does that, but you must allow packets to port 53 tcp/udp to
pass through to your ISP's DNS servers and their related packets back.

Leslie

