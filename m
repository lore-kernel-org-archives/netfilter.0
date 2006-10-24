From: vwf <vwf@vulkor.net>
Subject: how to filter on application? (cmd-owner)
Date: Tue, 24 Oct 2006 09:46:55 +0200
Message-ID: <20061024074655.GA4996@trane.vulkor.net>
Reply-To: vwf <vwf@vulkor.net>
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

Hello,

Some time ago --cmd-owner went silently. I think a firewall must be able
to filter on the originating application: I do not want an application
running on Wine to connect to an unknown server somewhere.

I disallow all outgoing connections by default and only allow connections 
for some selected application. Now --cmd-owner has gone, can anyone tell me 
how to do this? (in detail, please)

Thank you

