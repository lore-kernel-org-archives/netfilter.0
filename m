From: "Reckhard, Tobias" <tobias.reckhard@secunet.com>
Subject: RE: portfw on iptables 2.4 kernel problem.
Date: Thu, 12 Dec 2002 09:09:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <96C102324EF9D411A49500306E06C8D1021AE462@eketsv02.cubis.de>
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

Following up to myself...

> Then that's where our impression differs. I have thought up 
> to now that
> INPUT is hit before PREROUTING before FORWARD before 
> POSTROUTING before
> OUTPUT. And that a packet may stop being processed between 
> PREROUTING and
> FORWARD as well as between POSTROUTING and OUTPUT.
> 
> I may check the one NATing firewall I have running.. later.

I just did check that machine and you're right, I was wrong. So INPUT and
OUTPUT rules shouldn't be required in the case we're discussing.

Cheers,
Tobias

