From: Jesper Lund <jesper@ballbreaker.dk>
Subject: Re: help needed.
Date: Fri, 7 Nov 2003 14:08:25 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031107140825.272789ed.jesper@ballbreaker.dk>
References: <3FAB92BA.4090003@newweb.oktanet.fi>
	<200311071255.hA7Ctwj14697@agate.rockstone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200311071255.hA7Ctwj14697@agate.rockstone.co.uk>
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

> iptables -A POSTROUTING -t nat -s 192.168.132.230 -j SNAT --to
> 212.23.233.40 iptables -A PREROUTING -t nat -d 212.23.233.40 -j DNAT
> --to 192.168.132.230

And you have to make the linux box respond to arp requests on the
outside interface:

ip addr add dev ethX 212.23.223.40

//Jesper

