From: Varun Pabrai <varunsaa@gmail.com>
Subject: mails not coming thru'
Date: Sun, 5 Dec 2004 15:18:14 +0530
Message-ID: <f02e560404120501483864a165@mail.gmail.com>
Reply-To: Varun Pabrai <varunsaa@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,
       My server is on Mandrake 10.1 off.
eth0 is gateway with static IP connected to 512Kbps DSL.
eth1 is LAN.

I went to webmin ->networking -> linux firewall.
I did a NAT on eth0.

Then I added rules using packet filtering for 
sending and recieving mails as follows :

accept if network protocol is TCP and destination port is 110

accept if network protocol is TCP and destination port is 25

saved and applied configuration and rebooted.

But I am not able to send or recieve mails on client 
machines. Why ?

Anybody has any idea please help.

Thanks

Varun

