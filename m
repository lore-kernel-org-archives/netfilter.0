From: Felipe Alcacibar <counter@counter.cvignolo.cl>
Subject: make a DNAT requesting source
Date: Mon, 24 Oct 2005 12:25:13 -0300
Message-ID: <20051024122513.7yxniro62fdkwsgw@webmail.cvignolo.cl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi to all, i have the next problem.

I have 2 machines, one, listen from port 80 of ip alias 192.168.0.220 and
another ip alias 10.0.0.5, and the other machine have listen a webserver in the
port 8001 with a ip alias 10.0.0.1, y succesfully make a connection from the
192.168.0.0/24 to 10.0.0.1 thought the first machine, but the packages don't go
back, because 10.0.0.1 does not route the packages to 10.0.0.5, and i can't do
it, because the idea is listen 3 webservers listen on different ports with the
same case, how i can do a DNAT, queryng the source of the package, because i
need in the machine 2, the packages outgoing from 10.0.0.1 from port 8001 go to
10.0.0.5 an this route the package with masqued network...

greetings xD....

