From: Michael Gale <michael.gale@utilitran.com>
Subject: TCP timeout
Date: Thu, 21 Oct 2004 13:48:45 -0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <4178129D.7030706@utilitran.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

	This is not a iptables question, but I am not sure where else to ask.

I need to find out that the RFC specification timeout is under the 
following condition, and google is not helping.

1. Client makes ftp connection to server
2. Server response with initial syn and ack

3. Server does a reverse dns / ident look on the client IP before 
providing a FTP login prompt.

Our developers created a Java app that makes FTP connection to a server, 
that some times takes 30 seconds to reply with a login prompt.

In the mean time the Java app has exited because of the 30 second delay. 
I want to get the app changed to refect the standard, as 30 seconds does 
  seem very short.


-- 
Michael Gale
Lan Administrator
Utilitran Corp.

The best part is when the people who know the least are the ones ranting 
and raving.

