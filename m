From: ip tables <iptables_help@yahoo.com>
Subject: wired route entry
Date: Tue, 3 Feb 2004 13:19:46 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040203211946.23417.qmail__29101.08152214$1075852258@web20725.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: redhat-list@redhat.com

hello group(S)

I have installed redhat 9 (2.4.20 - 8) on an i686 with
3 network cards fixed. When i start network services
it puts in an entry 

169.254.0.0 255.255.0.0 eth2

why does this happen. This happen on boot also but i
managed to remove it with a route del in the rc.local.
What is the reason for this and how can i prevent
this.

Thanks and regards

__________________________________
Do you Yahoo!?
Yahoo! SiteBuilder - Free web site building tool. Try it!
http://webhosting.yahoo.com/ps/sb/

