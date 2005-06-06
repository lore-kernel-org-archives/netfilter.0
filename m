From: Lucky Leavell <netfilter@UniXpress.com>
Subject: Detecting/Defeating Spambots
Date: Mon, 6 Jun 2005 12:49:53 -0400 (EDT)
Message-ID: <Pine.LNX.4.61.0506061244340.1874@UniXpress93.unixpress.com>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

OS: SuSE 9.3 Pro

I work with a small ISP and we are encountering with increasing frequency 
Windows machines which have been compromised and apparently being used as 
spambots based on their attempted connection to port 25 of foreign hosts 
instead on using our mail server for outgoing mail.

With allowance for legitimate exceptions, could we simply disallow port 25 
connections from within our networks to any but our mail servers? (We run 
all outgoing -as well as incoming- mail thru amavis/clamav/spamassassin.)

Any other thoughts or links to resources?

Thank you,
Lucky

