From: Wakko Warner <wakko@animx.eu.org>
Subject: mac match and FORWARD chain
Date: Sun, 22 Oct 2006 21:20:29 -0400
Message-ID: <20061023012029.GA32086@animx.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Keep me in CC.

I'd like to request that the mac match not be allowed in the FORWARD chain
as it does not function the way that some may think.

The tests I've performed indicate that the match will match the MAC address
of the transmitting interface (not what one would expect if attempting to
allow based on the mac address of the sender and blocking all other packets)

I'd like to hear comments about this.  If it is not fesable to do this, I'd
recommend adding text to the man page so that others do not fall into the
same problem I did.

I have already worked around this problem in my setup.

-- 
 Lab tests show that use of micro$oft causes cancer in lab animals
 Got Gas???

