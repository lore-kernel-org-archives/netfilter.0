From: "Alexander Newald" <alexander@newald.de>
Subject: NAT & forwarding
Date: Tue, 15 Mar 2005 07:35:33 +0100
Message-ID: <002701c52929$30fc82a0$6300a8c0@arbeitszimmer>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

Hello,

I have some problems with the fullowing:

I have one box (123.123.123.123) from with I would like to forward all 
traffic comeing to this box to another (12.12.12.12). This should be 
transparent for the clients. So if I do a http or ftp request to 
123.123.123.123 the answer (webpage, ftp login) comes from 12.12.12.12.

I like to have this but not for ssh (so I can login to 123.123.123.123).

I thought that I should do

iptables -t nat -I PREROUTING -d 123.123.123.123 -s 0/0 -j DNAT --to 
12.12.12.12

on 123.123.123.123

But it dosn't work. Do I need to setup something on 12.12.12.12?

Thanks,

Alexander Newald 


