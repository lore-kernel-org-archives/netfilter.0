From: "Robert Schimansky" <cms_project_hs_zigr@yahoo.de>
Subject: Re: Weird routing problem?
Date: Wed, 1 Dec 2004 14:30:34 +0100
Message-ID: <002101c4d7a9$f00c4f80$e167aec1@wsidipl05>
References: <200412010418.41288.hancock@anansispaceworks.com>
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
To: netfilter@lists.netfilter.org

hello,

when using an ethernet-dsl-modem - and maybe with some other devices too - 
you have to set the MTU of your NAT-ed computers. see 
http://www.annoyances.org/exec/show/article04-107

I would appreciate if somebody could tell how I could solve this on the 
router insteasd of reconfiguring the "clients"

greetings
Robert

> Hi,
> I have set up a Debian Woody system as a dialup gateway
> system using iptables. This mostly works, but for a fairly
> large number of internet sites, I get hang-ups when trying
> to access them from the client machines on my LAN. (Not sure
> about the statistics, but it's enough that it could be, for
> example, any site runnning IIS or some other lesser-used HTTP server).
>
> For example, if I use a simple console web-browser like
> w3m, I can access:
>
> w3m http://www.poalo.com
>
> from the console of my router, BUT the same command from
> the console of a client machine on the LAN results in no
> reply! 


