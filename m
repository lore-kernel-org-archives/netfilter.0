From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: fetchmail from intern
Date: Mon, 17 Feb 2003 13:23:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200302171323.39889.netfilter@newkirk.us>
References: <20030217161103.D1AE417C93@delta.meyer.home>
Reply-To: netfilter@newkirk.us
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030217161103.D1AE417C93@delta.meyer.home>
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
To: anmeyer@gmx.net, IPtables <netfilter@lists.netfilter.org>

On Monday 17 February 2003 11:11 am, Andreas Meyer wrote:
> Hello!
>
> Running fetchmail from the mailserver behind the firewall I have
> the problem to go to the WAN.

> iptables -t nat -A PREROUTING -p TCP --dport 110 -m state --state
> NEW,ESTABLISHED,RELATED -j DNAT --to 0.0.0.0:110
>
> I get a
> kernel: martian destination 0.0.0.0 from 192.168.1.3, dev eth0

You don't want to DNAT outgoing - that changes the destination IP, which=20
has to be a valid IP.  (0.0.0.0 isn't a valid destination, hence the=20
"martian" error)  Outbound connections going TO dport 110 should be left=20
alone, or SNATted if necessary.  They should already have a valid=20
destination IP.

j


