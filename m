From: David Cary Hart <DCH@TQMcube.com>
Subject: Performance vs. Rule Set Size
Date: Tue, 27 Jul 2004 22:11:28 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090980688.22783.8.camel@dchws.tqmcube.com>
Reply-To: NetFilter List <netfilter@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@lists.netfilter.org>

I realize that there are too many variables to answer this question with
great precision so consider this a reality check.

Our server has been under very heavy attack over the last few weeks. I
have been adding individual hosts who try to exploit either httpd or
smtp. I now have an input rule set of several hundred lines. Does that
seem terribly over-sized or is that fairly common?



