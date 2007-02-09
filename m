From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Iptables proxy to a different network
Date: Fri, 9 Feb 2007 18:49:09 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702091848340.31955@yvahk01.tjqt.qr>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
	<45CC5A91.4090200@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
	<45CC919C.7030104@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45CC919C.7030104@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org


On Feb 9 2007 16:22, Pascal Hambourg wrote:
>> On Feb 9 2007 12:27, Pascal Hambourg wrote:
>> For example, by setting up
>> your proxy box as a router or bridge (both approaches work) in the middle.
>
> I may be wrong, but doing IP NAT on a bridge seems to me quite unnatural and
> troublesome.

A bridge is like a 'direct connection' so you cannot use NAT. In fact, you
don't need, the next router will have to do it instread.

>
>

Jan
-- 
ft: http://freshmeat.net/p/chaostables/

