From: Pablo Allietti <pablo@lacnic.net>
Subject: dnat problem
Date: Sat, 22 Jan 2005 12:59:35 -0300
Message-ID: <20050122155935.GA20433@omega.lacnic.net.uy>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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

hi all

i have a problem with dnat i have this struc.


		|
		|internet
		|
		Firewall 200.20.43.2
		|
		|
		|
		Server 192.168.1.143


and i have this rule in the firewall.

iptables  -t nat -A PREROUTING -i eth0 -p tcp --dport 2244  -j DNAT
--to-destination 192.168.1.143:22

i supouse this rule make a dnat to server 192.... to ssh but nothing
happends

i do ssh -p2244 200.20.43.2  but nothing respond

what i miss ? :(


thnks all!!


-- 


Pablo Allietti
LACNIC
--------------


