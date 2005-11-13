From: Robby Workman <netfilter@rlworkman.net>
Subject: Identd requests through firewall
Date: Sun, 13 Nov 2005 10:45:41 -0600
Message-ID: <43776DB5.8050702@rlworkman.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Greetings...
IRC servers do an identd lookup when connecting to them, and although 
most of them do not require a response, I'd like to at least have the 
capability to return a response should I need to do so.  I currently 
have all incoming identd requests to the firewall rejected with TCP 
RST, and this is adequate for the time being.

What I would like to do is forward the request to one of the boxes 
behind the firewall (whichever one is attempting a connection with an 
IRC server).  I know how to forward them all to one of the individual 
machines (say box 1), but this does not help if I'm using one of the 
other boxes to connect.

In order for a connection to be considered "RELATED," an helper module 
would have to exist.  In the absence of such a module (the netfilter 
IRC module does not do this iiuc), is there some other way to make 
iptables "know" that box1 has initiated a connection to $IRCSERVER and 
hence forward incoming identd requests from $IRCSERVER to box 1?

It shouldn't matter, but Firewall is Slackware 10.0 +patches, and most 
boxes behind the firewall are Slackware -something...

Thanks in advance...


Network Diagram:

   Dialup
   Internet
      |
      |
------------
| (ppp0)   |
| Firewall |
| (eth0)   |
------------
      |
      |
------------
|          |
|  Switch  |
|          |
------------
      |
      |---------------------------
      |             |            |
      |             |            |
    box 1         box 2        box 3


-- 

http://rlworkman.net

