From: Jason Opperisano <opie@817west.com>
Subject: RE: How to block only MX query made to DNS server
Date: Sun, 28 Nov 2004 01:21:46 -0500
Message-ID: <1101622905.10064.29.camel@hubcap.ljm.dom>
References: <20041128041755.17971.qmail@web12307.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041128041755.17971.qmail@web12307.mail.yahoo.com>
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

On Sat, 2004-11-27 at 23:17, pravin rane wrote:
> That is right but only when all clients are using my
> DNS server. I will not be able to block MX requests if
> they are using some other DNS servers which are
> out-side of my network and I can not force my clients
> to use only my DNS server.

iptables -t nat -A PREROUTING -i $INSIDE_IF -p udp \
  --dport 53 -j REDIRECT --to-port 53

or some variant thereof...

-j

--
"Lisa, if the Bible has taught us nothing else, and it hasn't, it's
 that girls should stick to girls sports, such as hot oil wrestling
 and foxy boxing and such and such."
	--The Simpsons


