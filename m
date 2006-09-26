From: "Ranjith Kumar" <ranjitbat@gmail.com>
Subject: Accepting Forwaded Packets
Date: Tue, 26 Sep 2006 22:45:10 +0530
Message-ID: <bd573cf00609261015x676fc64au453fbe6fe9f458a8@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi All,

I have a Windows server 2003 installed, infront of my mail server. The
windows server is connected to internet and this is acting as
relayhost to my Linux mail server. I enabled NAT on the windows
firewall and forwarding pop3 and imap ports to Linux machine. But I am
not able to access pop3 or imap from the internet.

Do I need to add any commands to my iptables to accept the
natted/forwarded packets?

Thanks & Regards
Ranjith Kumar.

