From: John Mok <jmok@attglobal.net>
Subject: iptables + PPPoE routing problem
Date: Thu, 19 Jan 2006 11:34:36 +0800
Message-ID: <43CF08CC.1090401@attglobal.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi,

I would like to install a Linux firewall connecting to ISP using PPPoE. 
The following are the software installed on the Linux box :-

Linux kernel 2.4.21 (SuSE distribution)
iptables 1.3.1
Roaring Penguin PPPoE 3.7
pppd 2.4.1

I have successfully connect to the ISP, and I could NAT'd through the 
ppp0 interface. On the Linux box, I could ping anywhere. However, on the 
DMZ, I could only ping the ppp0 interface and failed to ping ISP side of 
the point-to-point connection. It still failed even I make all the 
iptables rules with "ACCEPT".

What went wrong? I hope someone could help me to how to setup the PPPoE 
properly to make the DMZ work.

Thanks a lot.

John Mok


