From: "Nathan Cassano" <nathan@cjhunter.com>
Subject: RE: HTTP Port forwarding issues
Date: Mon, 8 Jul 2002 13:25:47 -0700
Sender: netfilter-admin@lists.samba.org
Message-ID: <40c701c226bd$a51c87a0$2901a8c0@amos>
References: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <001f01c226b6$eb0a4f60$6702a8c0@internal.monstersolutions.net>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org


Remember HTTP runs over UDP protocol also. So for every HTTP TCP rule
add a UDP copy ( -p udp ).

> iptables -A FORWARD -p tcp -i eth0 -d $int_ip -p tcp --dport http -m
state --state NEW -j ACCEPT
>
> iptables -t nat -A PREROUTING -d $ext_ip -p tcp --dport http -j DNAT
--to-destination $int_http:80


