From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: Where is ip6tables?
Date: Tue, 28 Mar 2006 18:56:00 +0200
Message-ID: <000101c65288$7e120d60$0101000a@sterenborg.info>
References: <859616420603280835rc24974dw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <859616420603280835rc24974dw@mail.gmail.com>
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

> Dear all,
> 
> just a quick question. I am running Fedora Core 3 (2.6.11-1.35_FC3)
> with iptables v1.2.11 installed. I know this is not brand new stuff,
> but as far as I conclude from the Changelog, ip6tables should already
> be part of this release. Nontheless, it is simply not there.
> 
> I know the solution is simple, but I have been sitting here for quite
> some time now. I should seiously consider going home now.

It may be part of the release, but the question is : did you install it
? (That said, I'm not sure if there's a separate ip6tables package.)

You could also try to find it using "locate ip6tables | grep bin" or
"whereis ip6tables".


Gr,
Rob


