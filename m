From: Miguel Manso <mmanso@yahoo.com>
Subject: disallow access from two internal networks
Date: Sun, 25 May 2003 10:30:40 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030525173040.13037.qmail@web11506.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

I've a linux router that's sharing an internet connection with four internal
networks:

192.168.1.0/24
192.168.2.0/24
192.168.3.0/24
192.168.4.0/24

I'd like to disallow each internal network to access the others.

I've this devices on the router:

ppp0 (external connection)
eth0 (network 1)
eth1 (network 2)
eth2 (network 3)
eth3 (network 4)

I thought that with this:

$IPT -A OUTPUT -o eth0 -s 192.168.2.0/24 -j DROP

I could drop any connection comming from the eth0 device (network 1) to the
network 192.168.2.0/24 (network 2).

I've tryed it but it don't DROP the connection.

What am I missing?

Thanks.



=====
Miguel Manso
mmanso@yahoo.com

__________________________________
Do you Yahoo!?
The New Yahoo! Search - Faster. Easier. Bingo.
http://search.yahoo.com

