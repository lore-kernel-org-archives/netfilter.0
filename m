From: "Joel Lindsay" <joel@waveteq.com>
Subject: Can't get --dport to work
Date: Tue, 1 May 2007 11:27:04 -0700
Message-ID: <006b01c78c1e$515f5c20$aa64a8c0@JOELDESKTOP>
References: <4635EC8E.4090905@saudi.net.sa><Pine.LNX.4.61.0704301547010.29151@yvahk01.tjqt.qr><4636DE7E.80600@saudi.net.sa>
	<Pine.LNX.4.61.0705011030220.18504@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi,

At one time I had this working.  I could match on the ports and deny http 
traffic from certain interfaces.

Now I get an error message and I am not sure what is causing it.  Can anyone 
help?

# iptables -A OUTPUT -i ath0 -p tcp --dport 80 -j ACCEPT
iptables v1.3.6-20061129: Unknown arg `--dport'
Try `iptables -h' or 'iptables --help' for more information.


Thanks,

Joel Lindsay, B.Eng
Project Engineer 


