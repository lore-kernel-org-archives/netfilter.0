From: "Anthony Sadler" <anthonys@faredge.com.au>
Subject: RE: Port redirection
Date: Wed, 1 Jun 2005 08:42:14 +1000
Message-ID: <22112.960558343$1117579520@news.gmane.org>
References: <20050531192503.92186.qmail@web51002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050531192503.92186.qmail@web51002.mail.yahoo.com>
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
To: 'Chris NoSurname' <quizzical73@yahoo.com>, netfilter@lists.netfilter.org

Hey Chris:

My rule I use for transparent proxy is this:

iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT
--to-port 3128 

I notice you have set "--to-ports" (ie plural). I'm not sure if that will
work. Some others could comment better than I.

Thanks

Anthony

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Chris NoSurname
Sent: Wednesday, 1 June 2005 5:25 AM
To: netfilter@lists.netfilter.org
Subject: Port redirection

Hi all.

I've searched and searched and I cannot seem to get this working.

I'm trying to redirect port 80 to a different port so that I can run the
Resin application server as non-root user.  I've got the following command..

iptables -t nat -A PREROUTING -p tcp --dport 80 -d x.x.x.x -j REDIRECT
--to-ports 8900

It comes up as 

    0     0 REDIRECT   tcp  --  any    any    
anywhere             www.mydomain.com   tcp dpt:http
redir ports 8900

Yet, if I connect to the http port it is closed.  Port 8900 is open and does
accept connections if I specify it in the address.

I am unclear of why the rules shows up in status, but does not work.

Thanks for any help you can offer.

David

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around
http://mail.yahoo.com 



