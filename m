From: Jim Carter <jimc@math.ucla.edu>
Subject: Re: Writing a netfilter module..
Date: Sun, 17 Aug 2003 13:52:29 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0308171338130.3677@xena.cft.ca.us>
References: <02be01c3648b$49a1d440$da836bd2@kylee>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <02be01c3648b$49a1d440$da836bd2@kylee>
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
To: Kyoungyong Lee <leeky@icu.ac.kr>
Cc: netfilter@lists.netfilter.org

On Sun, 17 Aug 2003, Kyoungyong Lee wrote:

> the purpose of this program is forwarding a packet according to the ip
> address or port # of incoming packet. for example, if the port # of
> incoming packet is 9999, i want to forward this packet to
> 210.107.xxx.yyy.

I would use a rule something like this:

    iptables -t nat -A PREROUTING -p tcp --dport 9999 \
	-j DNAT --to-destination 210.107.xxx.yyy

My understanding of the purpose of DNAT is, you have a web server farm
on machines www1.example.com (9.8.7.1), www2.example.com (9.8.7.2), etc.
and a leader machine www.example.com (9.8.7.254).  The customer opens
a connection on the latter machine, and it hands off the connection to
a farm member by saying:

    iptables -t nat -A PREROUTING -p tcp --dport 80 -j DNAT \
	--to-destination 9.8.7.1-9.8.7.251

The man page says that a simple round robin is done among the destinations,
although I'm sure that you could influence the choice by some fancy dynamic
rules or a special module.

Hope this helps!

James F. Carter          Voice 310 825 2897    FAX 310 206 6673
UCLA-Mathnet;  6115 MSA; 405 Hilgard Ave.; Los Angeles, CA, USA 90095-1555
Email: jimc@math.ucla.edu  http://www.math.ucla.edu/~jimc (q.v. for PGP key)

