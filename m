From: Jason Opperisano <opie@817west.com>
Subject: Re: --limit 5/m doesn't work
Date: Wed, 23 Mar 2005 08:44:44 -0500
Message-ID: <1111585483.4513.12.camel@hubcap.ljm.dom>
References: <000001c52f53$ed3f3220$1500a8c0@itasam>
	<558224e30503222255158832bc@mail.gmail.com>
	<558224e305032300217c4772c9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <558224e305032300217c4772c9@mail.gmail.com>
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

On Wed, 2005-03-23 at 03:21, ASHISH wrote:
> The rule that you have mentioned will "Accept" the first five matches.

to split hairs here--the way the OP has the rule written:

iptables -A INPUT -i eth0 -m limit --limit 5/m --limit-burst 5 -j ACCEPT

it will actually accept the first 10 packets, the limit of 5 + the burst
of 5--then the limit will enforce for 5 minutes.

-j

--
"Have you ever been in a police car?
 Not in the front..."
	--The Simpsons


