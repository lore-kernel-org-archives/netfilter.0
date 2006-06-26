From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: repeated failed logons and ignoring them
Date: Mon, 26 Jun 2006 22:57:45 +0200
Message-ID: <002501c69963$2cdd4af0$0101000a@sterenborg.info>
References: <200606261544.09465.tyche@ica.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200606261544.09465.tyche@ica.net>
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

>> What type of logon? SSH, telnet, ...?
> 
> sorry, what comes from typing email when your still asleep.
> most seem to be hitting my sshd, tho the username/password
> combo leads me to believe that the person is using a database
> to try to overload the server.
> 
> killed some pids that where owned by sshd and they kept
> cropping up faster than i could kill them.

You may want to use SSH public/private-key auth, not password auth. It's
not really hard to implement and you wouldn'd be bothered by
user/pass-guessing as any attempt to logon that way will just be denied.


Gr,
Rob


