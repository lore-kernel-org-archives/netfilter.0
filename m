From: dhiraj.2.bhuyan@bt.com
Subject: Connection tracking - CLOSE_WAIT and FIN_WAIT
Date: Thu, 10 Apr 2003 14:54:26 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7497DCA1C240C042B28F6657ADFD8E09268779@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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

Hello list,

I just carried out a couple of tests to see how conntrack changes the state
of a TCP stream -

----------- test 1 -------------------------------------------------
1. (A) ---->SYN----->(B)  FW state = SYN_SEND
2. (A) <---SYN+ACK-- (B)  FW state = SYN_RECV
3. (A) -----ACK----->(B)  FW state = ESTABLISHED (ASSURED)

4. (A) --->FIN+ACK-->(B)  FW state = FIN_WAIT
5. (B) <-----ACK---- (B)  FW state = TIME_WAIT (times out after 2 mins)

----------- test 2 -------------------------------------------------
1. (A) ---->SYN----->(B)  FW state = SYN_SEND
2. (A) <---SYN+ACK-- (B)  FW state = SYN_RECV
3. (A) -----ACK----->(B)  FW state = ESTABLISHED (ASSURED)

4. (A) <---FIN+ACK-- (B)  FW state = CLOSE_WAIT
5. (B) -----ACK----> (B)  FW state = TIME_WAIT (times out after 2 mins)



Now step (4) of test 1 leads to FIN_WAIT state, but step (4) of test 2 leads
to CLOSE_WAIT.
The only difference between the two is the direction of packet flow. So the
question - is this the expected behaviour? If yes, what is the purpose?


dhiraj

