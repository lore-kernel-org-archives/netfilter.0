From: Maciej Soltysiak <solt@dns.toxicfilms.tv>
Subject: Re: Ports
Date: Mon, 9 Sep 2002 19:38:03 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0209091937330.22681-100000@dns.toxicfilms.tv>
References: <3D7CDA9B.1070706@iol.it>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3D7CDA9B.1070706@iol.it>
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
To: Mattia Martinello <m.martinello@iol.it>
Cc: netfilter <netfilter@lists.netfilter.org>

> iptables -A FORWARD -p tcp -s 0.0.0.0/0 -d 192.168.2.101 -dport 80 -j ACCEPT
It is: --dport, not -dport

Regards



