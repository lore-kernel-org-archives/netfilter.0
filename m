From: Jim Burnett <jburnett@e-masi.com>
Subject: destinations interface must be eth0?
Date: Mon, 15 Sep 2003 09:47:39 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063637259.2318.3.camel@dod-secure.e-masi.com>
Reply-To: jburnett@e-masi.com
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

I have found that my destination IP in my rules MUST be bound on eth0
what is this? I thought I could use any working IP on my internal
network as the --to-destination IP...??

Example:
internal machine:
eth0:192.168.1.55
eth1:192.168.1.56


#1
iptables -v -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNA
T--to                  192.168.1.55:80
This will work because the destination IP is on eth0

#2
iptables -v -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j DNA
T--to                  192.168.1.56:80
This wont work because the destination IP is on eth1

I didnt see this in the documentation and it took my 5 days to figure it
out....

Tested on 6 machines, redhat 9, slackware 9, Latest gentoo build from
stage 1. Various brand nic cards. Various compiled kernels. 2.4.18 -
2.4.22

-Jim




