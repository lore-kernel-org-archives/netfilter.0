From: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Subject: Re: nat and dns
Date: Thu, 23 Sep 2004 10:09:57 -0500
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4152E745.1010503@pbl.ca>
References: <415290B1.5030401@imag.fr>	<20040923103428.GK27327@metastasis.org.uk>	<20040923110943.14715.qmail@arcoscom.com>	<20040923112331.GL27327@metastasis.org.uk>	<1095948833.1750.9.camel@wolfpack.ljm.dom>
	<4152DEE3.6010007@pbl.ca>
	<1095950647.1750.30.camel@wolfpack.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1095950647.1750.30.camel@wolfpack.ljm.dom>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Jason Opperisano wrote:
> it comes from the days of BIND offering up remote root exploits more
> often that i care to remember.  not allowing TCP 53 through the firewall
> allowed one to get a least a couple of winks over the course of a night.

Well, those days are hopefully over.  Modern BIND is just as secure as 
any other service (hm, thinking about it, this isn't much of an argument 
;-) ).  Plus, it runs as unpriviledged user in chrooted jail just fine 
(this one is an argument).

> just adding layers to the onion.

Let me guess, you named your firewall shrek.817west.com?

-- 
Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
Systems Administrator                           1499 Buffalo Place
Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7

