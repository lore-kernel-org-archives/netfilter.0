From: Michael Atighetchi <matighet@bbn.com>
Subject: forcefully closing TCP connections
Date: Mon, 16 Sep 2002 16:19:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20020916201911.GU3540@bbn.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

I'd like to forcefully close TCP connections out of band under Linux
2.4 - does anyone know how to do this ?

Imagine:

 Client <ip1, p1> -----> Server <ip2,pX>
 Client <ip1, p2> -----> Server <ip2,pX>
     ...
 Client <ip1, p100> ---> Server <ip2,pX>


I'm looking for an easy way to close (TCP RST?) all hundred
connections without touching client / server code. Assume that I have
sudo permissions to any command on Server.




-- 
matighet@bbn.com   BBN Technologies

