From: =?iso-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: ipt_string and Kernel 2.6 !!URGENT!!
Date: Wed, 12 Jan 2005 13:52:03 -0300
Message-ID: <005c01c4f8c7$0b352870$8b00000a@casa>
References: <1105537635.3751.22.camel@hubcap.ljm.dom><20050112151142.79460.qmail@web26102.mail.ukl.yahoo.com>
	<20050112152437.GA17646@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

>
> any proxy worth a "crap" can do more than the string match, so i fail
> to see your point.  maybe your proxy is "crap."  maybe the skill set of
> your proxy administrator is "crap."
>

    I agree completly with you. But I still use string in some rare 
situations. Here's one example.

    A network with +500 machines and squid with authentication enabled, so 
users must authenticate for browsing the web. Transparent proxy is also 
enabled. I know transparent+authentication doesnt work. But I use to permit 
antivirus/windowsupdate updates WITHOUT authentication, so machines can stay 
updated with no problems. http NAT is DISABLED, http can only be accessed 
throw squid. This setup can be used for any kind of http filtering, ok ?? 
Yes, it's OK. It works VERY fine.

    But in a +500 machines network, you'll surely have some 
virus/spyware/adware running in some machines. And some virus/spyware/adware 
use to make some http requests for getting data. These softwares usually 
gets Internet Explorer proxy configuration, but they dont know how to 
authenticate, as well they dont use to deal with DENIED/407 (you need to 
authenticate yourself) squid return codes. Some of these softwares make http 
requests and in case of getting ANYTHING different than the answer expected, 
the request is done again, with absolutely no delay. I've seen, for example, 
some virus making +90 requests/second in this environment.

    Well, OK, squid is blocking them. But squid has a 2Gb log file 
limitation which, in some cases I experienced, was enough for only 5 hours 
of network traffic loaded with some of these virus/adware/spywares. After 
2Gb of logs, squid dies and there it goes http browsing.

    In this kind of situation, during some virus/adware/spyware outbreak, i 
use to use the string module for blocking some requests even BEFORE they 
reach to squid. So I avoid squid dying because of log getting full.

    I know this is a 'complex' environment as well as a complex example. But 
it's, at least i think, a valid example of where the string module is VERY 
useful. As recommended, i do NOT use string module in normal situations, but 
in some outbreak situations, sometimes i get some string rules running for 
fast-blocking it and having time for studying and fixing the problem.

    I also would like to see string module in kernel 2.6 ...... basically 
it's the only netfilter patch that I use that have not being migrated to 2.6 
yet ...


    Sincerily,
    Leonardo Rodrigues



