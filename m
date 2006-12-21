From: Carl-Daniel Hailfinger <c-d.hailfinger.devel.2006@gmx.net>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Thu, 21 Dec 2006 08:57:29 +0100
Message-ID: <458A3E69.50600@gmx.net>
References: <45860240.2040102@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-bounces@mailman.ds9a.nl>
In-Reply-To: <45860240.2040102@riverviewtech.net>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Linux Advanced Routing and Traffic Control <lartc@mailman.ds9a.nl>, Mail List - Netfilter <netfilter@lists.netfilter.org>

Grant Taylor wrote:
> I ran across an interesting article
> (http://www.heise-security.co.uk/articles/print/82481) (1) that I think
> any and all firewall administrators should take a few moments to read.

The article only reiterates the same old stories and FUD which have been
known for years.

> I personally have known that using "-m state --state
> ESTABLISHED,RELATED" was not the most secure thing to use for returning
> traffic.  Namely this will allow you to make a valid connection to a web
> server, say to retrieve a picture.  Then said web server could send
> malicious traffic back to your computer and pass through your firewall.
>  This is because the traffic coming from the web server to your computer
> is now deemed as RELATED.  Previously I have written this off as not

This is wrong on so many levels. Please reread the article. Then read
the source code of your favourite firewalling system. All of those
"attacks" require cooperation from your side. And if you (or someone
using the computer you try to protect) are actively cooperating with
the attacker, "fixing" the firewall should be the least important of
your problems.
A small hint about the most obvious problem in your web server example:
HTTP does not have any concept of RELATED connections. You could claim
FTP was used to download the image, but then your scenario would require
a FTP server instead of a web (HTTP(S)) server.
I'm still seeing people who absolutely want to deploy the iptables
UNCLEAN match to "make their network more secure".


Regards,
Carl-Daniel
-- 
http://www.hailfinger.org/
