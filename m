From: ads nat <adsnat@yahoo.com>
Subject: problem using MAC address.
Date: Wed, 27 Oct 2004 02:50:16 -0700 (PDT)
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <20041027095016.39480.qmail@web60408.mail.yahoo.com>
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

Hi,
I want block forwarding as follows :

"iptables -I INPUT 1 -i eth1 -p tcp -m tcp --dport 25
-m mac --mac-source 00:08:A1:53:BE:71 -d ! 10.0.0.2 -j
DROP"

it does not work but when I try to do same thing with
rule 
"iptables -D FORWARD -i eth1 -p tcp -m tcp --dport 25
-s 192.168.0.42 -d ! 10.0.0.2 -j DROP"

Is there any sytax error.

Or Do I have to installed any additional module of
iptables.
I am using Redhat 9.0 Linux.
Please guide me.

Thanks for support.



		
__________________________________
Do you Yahoo!?
Take Yahoo! Mail with you! Get it on your mobile phone.
http://mobile.yahoo.com/maildemo 

