From: "Dharmendra T." <dharmu@nsecure.net>
Subject: (no subject)
Date: 23 Jun 2004 10:29:41 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1087966805.2320.14.camel@dharmu.nsecure.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: manikandan@manikandan.org
Cc: netfilter@lists.netfilter.org



Hi Mani,
 
 Hope some Messaging and Conferencing tool is running! You have to check
on your machine is there anything running on that port, It is very
dangerous if some process opening a port and you are unaware of it.

 Make sure everything in your system is ok.

        I did not see any error in ifconfig.


Regards
Dharmendra T.


On Mon, 2004-06-21 at 11:58, Manikandan wrote:
> Hi friends,
> 
>         I am running RedHat linux 9 with iptables 1.2.7a. This box
acts as a
> gateway/firewall for my network. I am seeing lots of packets getting
dropped
> as well as ifconfig reports error.
> 
> [root@javagreen RPMS]# tail /var/log/messages/
> 
> Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
> DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=17638
PROTO=ICMP
> TYPE=8 CODE=0 ID=20225 SEQ=61833
> Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=64.0.96.12
> DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=45 ID=17638
PROTO=ICMP
> TYPE=8 CODE=0 ID=20225 SEQ=61833
> Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
> DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF
PROTO=ICMP
> TYPE=8 CODE=0 ID=52234 SEQ=19095
> Jun 21 11:50:50 javagreen kernel: IN=eth0 OUT=
> MAC=00:09:6b:19:b4:24:00:0e:83:f6:19:9f:08:00 SRC=210.224.186.4
> DST=202.138.202.218 LEN=84 TOS=0x00 PREC=0x00 TTL=42 ID=0 DF
PROTO=ICMP
> TYPE=8 CODE=0 ID=52234 SEQ=19095
> Jun 21 11:50:54 javagreen named[3251]: client 1
-- 
Dharmendra T.
Linux Security and Admin,
www.nsecure.net

This message is intended for the addressee only. It may contain
privileged or confidential information. If you have received
 this message in error, please notify the sender and destroy the message
immediately. Unauthorised use or reproduction of 
this message is strictly prohibited.


