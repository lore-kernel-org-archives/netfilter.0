From: Linux Query <linux_query@yahoo.com>
Subject: ipt_string
Date: Mon, 20 Sep 2004 11:46:04 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20040920184604.44308.qmail@web90004.mail.scd.yahoo.com>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi !
 
I am new to linux and networking. However I have set up a router on a redhat 9 machine and am using htb.init + squid delay pools for bandwidth limiting. But I would like to do away with squid since I am just using it for the delay pools feature in order to limit downloading based on kewords such as .exe .mp3 .mpeg ..etc. The other day I came to know about the ipt_string module through google search and am wondering if thats what I am looking for. I am looking for something with which i can mark packets based on keywords and then limit the bandwidth for such packets with htb. Is the ipt_string module suitable for this ? If not, then please suggest an alternative.
 
Regards,
Jim.

		
---------------------------------
Do you Yahoo!?
New and Improved Yahoo! Mail - 100MB free storage!
