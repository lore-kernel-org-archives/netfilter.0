From: "Dan Bogda" <dan.bogda@kintera.com>
Subject: DNS Manipulation via IPTables?
Date: Wed, 8 Nov 2006 12:06:16 -0800
Message-ID: <9685603FA2D84E48A85D428D36ED23332BEEB8@clavin.kintera.int>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
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

Guys,
I'm looking to see if an IPTables solution exists for NATing DNS
responses? I am already using multiple views within Bind to address this
and I would like to find a way to alter just the records I need, rather
than deploy duplicate zones. I thought I could alter DNS responses with
IPTables, but I can't find any reference to this. Does this
functionality exist natively or via a plug-in module or not at all?

Thanks,
Dan


