From: Michael Gale <michael.gale@pason.com>
Subject: Send SYN ACK from server ?
Date: Thu, 19 Jan 2006 13:58:40 -0700
Message-ID: <43CFFD80.3050203@pason.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hello,

    I am seeing a problem where when a linux box from behind a linux 
firewall connects to an external server, the external server is sending 
a second SYN,ACK message:

-> SYN sent
<- SYN,ACK received -- WINDOWS SIZE SET TO 0 ??
-> ACK sent

Then the external server sends:
<-SYN, ACK with same seq numbers ?? and WINDOW SIZE SET TO 16560 ??

Now if the client is windows :( it replies to the second SYN,ACK and 
everything seems to work, however when the client is linux, the second 
SYN,ACK is ignored by the client which I believe causes the connection 
state to be destroyed on the firewall.

Am I corrent is assuming that the window size update packet should NOT 
have the SYN bit set and that this is a problem on the remote server ?

Michael

-- 
Michael Gale

Linux Administrator
Network Administrator
Pason Systems Corp.


