From: Julian Gomez <kluivert@tm.net.my>
Subject: Re: Skipping connection tracking for certain traffic types?
Date: Sat, 31 May 2003 15:18:43 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030531071843.GA1765@floyd>
References: <20030527192155.V20519@poliisi.iki.fi>
Reply-To: kluivert@tm.net.my
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030527192155.V20519@poliisi.iki.fi>
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

On Tue, May 27, 2003 at 10:49:56PM +0300, Ville Mattila spoke thusly:
>Correct me on this if I'm wrong: It is a feature of Netfilter that
>whenever conntrack is registered in kernel, then for example any UDP
>packet passing through the firewall causes the state table to be consulted
>resulting in either update of an old state entry if found or creation of a
>new state.

I think there is a NOTRACK patch in p-o-m, but haven't checked really. I
kind of remember Henrik Nordstrom talking about it before, but a quick
websearch only turns up this.

http://lists.netfilter.org/pipermail/netfilter-devel/2001-September/
005541.html

