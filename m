From: vwf <vwf@vulkor.net>
Subject: will --cmd-owner ever return?
Date: Tue, 27 Mar 2007 20:45:26 +0200
Message-ID: <20070327184526.GA5168@trane.vulkor.net>
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

Since kernel 2.6.15, command owner matching is gone (-m owner
--cmd-owner). I consider this match vital for securing a workstation.
Programs are calling home (including well known very free source ones),
emails contain all kinds of tricks to report back (some of them I cannot
delete unseen), some programs are simply too insecure to be alowed to
connect to some server (e.g. media players), and often I simply want my
workstation to be absolutely quiet (except when I specificly ask for
something).

How can I lock my workstation down on application level?
Please tell me Netfilter can do this. Or can't it?



