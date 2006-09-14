From: "=?ISO-8859-1?Q?Jo=E3o_Fernandes_Simpl=EDcio?=" <jfsimplicio@gmail.com>
Subject: --to-destination of DNAT issue -- or my misinterpretation?
Date: Thu, 14 Sep 2006 13:46:39 +0100
Message-ID: <c6c65ec80609140546w1089a228j6031fa049e4bd5d6@mail.gmail.com>
References: <c6c65ec80609131835l7d586b6r29e8226a93db7bab@mail.gmail.com>
	<c6c65ec80609131838x35b95470m42a61c6d6f27ec9f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <c6c65ec80609131838x35b95470m42a61c6d6f27ec9f@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

 It seems I can't specify several --to-destination (like the man page
tells), and iptables doesn't spit any errors.

 iptables -t nat -A PREROUTING -p tcp --dport 12345 -d dest-host -s
source-host -j DNAT --to-destination dest-host:12346 --to-destination
dest-host:12347 --to-destination dest-host:12348

 Am I doing something wrong?

 Could you give me an example of how to do this properly?

 I'm assuming that the normal behavior is: When I'm connecting from
source-host to dest-host:12345, the dest-host does load balancing and
randomly chooses one of the three --to-destination parameters. Is this
right?

Thanks in advanced.

     -- jfs

