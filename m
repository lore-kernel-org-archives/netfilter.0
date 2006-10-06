From: Adhi Laksono <wingback06@yahoo.com>
Subject: Layer 7 Filter
Date: Thu, 5 Oct 2006 23:30:13 -0700 (PDT)
Message-ID: <20061006063013.80678.qmail@web31010.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Hi all,

I made a script using iptables with layer 7 filter
support... My default policy is :

$IPTABLES -P INPUT DROP
$IPTABLES -P OUTPUT DROP
$IPTABLES -P FORWARD DROP

The rules in the filter table works fine, but the
wierd thing is, how come all the application (ex.
bittorrent) doesn't work?? I haven't written any rules
for the application to DROP yet, and have tried to add

$IPTABLES -A LAN-Internet -s $NET_LAN -d 0/0 -m layer7
--l7proto bittorrent

And still, it wont work...

Any help please???

Regards,

Adhi  

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

