From: Gavin Hamill <gdh@acentral.co.uk>
Subject: iptables acting as a TCP proxy
Date: Mon, 15 Mar 2004 11:10:33 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079349033.10231.14.camel@gdh.walshsimmons.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hi :)

Sorry to bring this here since I've done it before based on info on the
web, but I can't find the info this time round :(

Basically, we're moving a webserver from hosting in-house to a data
centre, so whilst the DNS is propogating, I'd like to use our firewall
to proxy port 80 requests destined for the now-defunct old IP, to the
new external IP.

I know this means wasting a lot of bandwidth, but there should be plenty
left over once the webserver is no longer in the building.

I seem to remember the solution was a pair of rules using the mangle
table and SNAT / DNAT, but try as I might, I can't find it with Google.

Can anyone help?

Cheers,
Gavin.



