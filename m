From: Michael Renzmann <mrenzmann@otaku42.de>
Subject: "selective" connection tracking?
Date: Tue, 28 Oct 2003 18:29:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F9EA786.5060401@otaku42.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all.

I digged the mailing list archive as well as the documentation for an 
answer and found some hints, but no clear statement.

Is it possible to use connection tracking only for specified 
connections, but not for all? Or would it be possible to "disable" 
connection tracking for connections that go through the forward chain, 
and using it only for connections that from/to the machine itself?

As far as I could find out: when starting to use stateful inspection 
features connection tracking is loaded (as module), which then is 
applied to ALL the connections that are comming into / going out of the 
machine and are passed through it (where the machine acts as router). Is 
that correct?

Any help appreciated.

Bye, Mike


