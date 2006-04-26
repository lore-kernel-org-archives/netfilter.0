From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Why is this not working???
Date: Wed, 26 Apr 2006 13:44:09 +0200
Message-ID: <1146051849.5244.38.camel@anduril.intranet.cartel-securite.net>
References: <200604251615.03991.stratism@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200604251615.03991.stratism@gmail.com>
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
To: Stratos Margaritis <stratism@gmail.com>
Cc: netfilter@lists.netfilter.org

1. You have INPUT rules, but no OUTPUT ones for returning packets.
2. You have a FORWARD rule in one way, but nothing on the other.


-- 
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

