From: Scott MacKay <scottmackay@yahoo.com>
Subject: MTU vs packet size?
Date: Mon, 23 Jun 2003 08:12:48 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030623151248.81850.qmail@web13904.mail.yahoo.com>
References: <000001c3398d$dcf68020$64a5a8c0@europe.cellnetwork.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c3398d$dcf68020$64a5a8c0@europe.cellnetwork.com>
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
To: netfilter@lists.netfilter.org

Mainly from interest in the size of the buffer in the
ipq_read(), can you receive a packet who's size is
greater than the MTU of the interface?  In example,
with a 1500 mtu interface, can you receive a 2000 byte
packet?


-Scott

__________________________________
Do you Yahoo!?
SBC Yahoo! DSL - Now only $29.95 per month!
http://sbc.yahoo.com

