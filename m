From: "Amy" <amyyang@w-ibeda.com>
Subject: connection track logging
Date: Mon, 28 Oct 2002 14:58:54 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001901c27e4f$7d4e8810$0814a8c0@yy>
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: gandalf@wlug.westbo.se
Cc: netfilter@lists.netfilter.org

I read the post about connection track logging posted on Apr. I'm a newer in
netfilter. And I want to use this function. So I'd like to post my step to
achieve  this function to you. If there's wrong, pls let me know.
ctrace-1.04, oidentd-2.0.4, oidentd-2.0.1-ctnetlink.diff,
ctnetlink.patch,linux-2.4.14.
1. patch ctnetlink.patch to linux-2.4.14;
2. compile ctrace-1.04;
3. modify the path of the libctnetlink; patch oidentd-2.0.4 with
oidentd-2.0.1-ctnetlink.diff;
4. make and install oidentd;
Then I start oidentd. How can I implement the iptables to relate to oidentd?
And if the info about oidentd is saved in /var/log/secure? Would you pls
show the step more detailedly? Thanks a lot.



Regards,
Amy




