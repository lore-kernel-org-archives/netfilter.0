From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: open ports 25/tcp and 110/tcp
Date: Thu, 4 Dec 2003 00:08:05 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031203230801.40CDE9A9@sterenborg.info>
References: <002101c3b9ef$53e5d780$0201a8c0@OurPC>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002101c3b9ef$53e5d780$0201a8c0@OurPC>
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

> Although my script seems to be correct namp is finding ports 25/tcp
> and 110/tcp open.  To start troubleshooting this problem I've
> commented everything out and stripped down the ruleset to just the
> default DROP policy.  Yet nmap -sT -F -P0 -0 xx.xx.xx.xx still
> returns 25/tcp and 110/tcp as open!

Did you check the PC from another host ? If you do that, the ports 
will show open even if they are closed.
Check from another host and it should show closed or filtered.


Gr,
Rob


