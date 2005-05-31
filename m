From: Chris NoSurname <quizzical73@yahoo.com>
Subject: Port redirection
Date: Tue, 31 May 2005 12:25:03 -0700 (PDT)
Message-ID: <20050531192503.92186.qmail@web51002.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi all.

I've searched and searched and I cannot seem to get
this working.

I'm trying to redirect port 80 to a different port so
that I can run the Resin application server as
non-root user.  I've got the following command..

iptables -t nat -A PREROUTING -p tcp --dport 80 -d
x.x.x.x -j REDIRECT --to-ports 8900

It comes up as 

    0     0 REDIRECT   tcp  --  any    any    
anywhere             www.mydomain.com   tcp dpt:http
redir ports 8900

Yet, if I connect to the http port it is closed.  Port
8900 is open and does accept connections if I specify
it in the address.

I am unclear of why the rules shows up in status, but
does not work.

Thanks for any help you can offer.

David

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

