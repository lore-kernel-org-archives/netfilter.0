From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: MSN Messenger and HTTPS
Date: Tue, 2 Sep 2003 22:03:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006201c3718d$53d2fed0$0401000a@sterenborg.info>
References: <001b01c36dff$401175c0$3b00a8c0@sturlaws>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001b01c36dff$401175c0$3b00a8c0@sturlaws>
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
To: netfilter@lists.netfilter.org

> But...Clients on the LAN cannot log on to MSN Messenger, and 
> they can't
> browse https-webpages like to do their banking. MSN is not the most
> important issue, though i suspect these two issues are related to
> eachother through som kind of https-problem. The thing is, 
> the user can
> log on to their MSN-accounts through clients like Trillian, but not
> through MSN Messenger. If anyone out there has a solution to 
> this, i'll
> be most grateful. And if possible, a solution for file-transfers an
> audio/video through MSN Messenger 6.0.

MSN 6 and https shouldn't be a problem.
Since you didn't show any rules that you're using for NAT it's hard to
tell what's wrong.

Did you compile your own iptables and support modules ?
Do you load any netfilter modules ?


Rob


