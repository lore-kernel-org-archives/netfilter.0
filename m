From: Gavin Hamill <gdh@acentral.co.uk>
Subject: Allow only SMTP 'callback'
Date: Mon, 10 Jan 2005 10:30:59 +0000
Message-ID: <200501101030.59086.gdh@acentral.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Hello :)

Normally I permit only port 80 incoming to our webservers, but since each 
webserver also sends out booking-complete confirmation emails, I would like 
to also enable incoming port 25 for those remote mail servers who 'call back' 
to check that the envelope sender  / HELO address is truly a reachable mail 
server.

I don't particularly want to leave port 25 simply open, but only for those 
hosts with whom an outgoing port 25 connection is already established with.

Is this possible?

Cheers,
Gavin.

