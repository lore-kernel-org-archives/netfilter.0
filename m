From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Iptables proxy to a different network
Date: Tue, 13 Feb 2007 21:53:45 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702132152410.1592@yvahk01.tjqt.qr>
References: <D392D4803D14354CBC49D772E19DD0CD45660A@zeus.w2k.nrlmry.navy.mil>
	<45CC5A91.4090200@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091338030.31955@yvahk01.tjqt.qr>
	<45CC919C.7030104@plouf.fr.eu.org>
	<Pine.LNX.4.61.0702091848340.31955@yvahk01.tjqt.qr>
	<45CCE9D0.6080808@plouf.fr.eu.org>
	<Pine.LNX.4.64.0702131541560.9124@darkstar.sysinfo.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.64.0702131541560.9124@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org, Pascal Hambourg <pascal.mail@plouf.fr.eu.org>


On Feb 13 2007 15:44, R. DuFresne wrote:
>> > > I may be wrong, but doing IP NAT on a bridge seems to me quite
>> > > unnatural and
>> > > troublesome.
>> > 
>> > A bridge is like a 'direct connection' so you cannot use NAT.
>> 
>> My idea of a bridge is a kind of software switch.
>> Then why did you mention "setting up your proxy box as bridge" ?
>
> My understanding of a bridge, is that it is a transparent connector of two
> distinct broadcast domains.

...making it one broadcast domain.

> At least in their earlier and older first
> implementations.
>
> Perhaps I'm showing my age?!...

Everything is alright. Just see  
http://lists.netfilter.org/pipermail/netfilter/2007-February/068001.html


Jan
-- 
ft: http://freshmeat.net/p/chaostables/

