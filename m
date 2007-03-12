From: "Bc. Miroslav Kopecek" <kopecek@email.cz>
Subject: RE: Connlimit problem k2.6.18.2 , ipt1.3.7
Date: Mon, 12 Mar 2007 08:42:39 +0100
Message-ID: <012501c7647a$029e8780$3464000a@oksystem.local>
References: <00fd01c76274$a089c3e0$3464000a@oksystem.local>
	<20070309194013.GA23835@toystory.lan>
Reply-To: kopecek@email.cz
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070309194013.GA23835@toystory.lan>
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

ipp2p is only for limiting p2p trafic. I don't want to limit trafic and do
trafic shaping for p2p (or block p2p).

I want only to solve problem with ip_conntrack. I need any solution to limit
connections per IP address.

Mirek
 

>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org 
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of 
>Franck Joncourt
>Sent: Friday, March 09, 2007 8:40 PM
>To: netfilter@lists.netfilter.org
>Subject: Re: Connlimit problem k2.6.18.2 , ipt1.3.7
>
>On Fri, Mar 09, 2007 at 06:59:05PM +0100, Bc. Miroslav Kopecek wrote:
>> Hi,
>
>Hi,
>
>>    I have Debian Sarge 3.1 testing, compiled kernel 2.6.18.2 
>and actual
>> iptables 1.3.7 compiled and installed
>> 
>> I need to solve problem with full ip_conntrack on my router. 
>One client with
>> some agressive P2P makes ip_conntack full. So I need to 
>limit connections
>> per that IP address
>
>Have you tried that :
>
>http://www.ipp2p.org/docu_en.html
>
>-- 
>Franck Joncourt
>http://www.debian.org
>http://smhteam.info/wiki/
>GPG server : pgpkeys.mit.edu
>Fingerprint : C10E D1D0 EF70 0A2A CACF  9A3C C490 534E 75C0 89FE
>



