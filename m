From: Nils Juergens <ju@isf.rwth-aachen.de>
Subject: Re: what is the relationship between Netfilter & iptables.
Date: Wed, 20 Aug 2003 15:35:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030820133550.GA1149@koala7>
References: <001001c36635$4e476ef0$da836bd2@kylee>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <001001c36635$4e476ef0$da836bd2@kylee>
Content-Disposition: inline
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

On Tue, 19.08.03, Kyoungyong Lee <leeky@icu.ac.kr> wrote:

> 
> I'd like to know the relationship between Netfilter and iptables.

If i'm not mistaken, netfilter is the linux kernel module itself, while
iptables is "just" the programm to control netfilter.

So you use iptables to modify netfilter rules.

hope that helps,

Nils
-- 
Nils Juergens  | ju@isf.rwth-aachen.de
Having problems sending big files over the net?
Try out Efisto (http://efisto.rnbhq.org).


