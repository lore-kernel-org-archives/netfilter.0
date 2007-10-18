From: Tiaan Wessels <tiaan@netsys.co.za>
Subject: ROUTE module problem
Date: Thu, 18 Oct 2007 07:07:27 +0000
Message-ID: <4717062F.6030907@netsys.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hi,

I have the need to duplicate UDP packets arriving at a machine. They 
need to be duplicated and sent of to both the original recipient and a 
new recipient.
After some reading I came to the conclusion the     -j ROUTE --tee    
option to iptables is the way to go. Getting this to work for a novice 
like me seems to be impossible.
Doing a man on my FC5 system shows --tee to be there under the ROUTE 
extension and I quote from the man page
'iptables can use extended target modules: the following are included in 
the standard distribution'
however using iptables results in

[root@nst2 ~]# /sbin/iptables -A PREROUTING -t mangle -p udp -d 
192.168.3.77 --dport 9090 -j ROUTE --tee
iptables v1.3.5: Unknown arg `--tee'

locate libipt_ROUTE.so yields nothing which makes me believe the man 
page was talking bollocks when claiming the extensions to be part of the 
'standard distribution'

After further reading I came to the conclusion patch-o-matic needed to 
be used to install the ROUTE module. going to netfilter extensions HOWTO 
I see I have to get the latest update from CVS like in so

cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login


but when I do this I get

[root@nst2 ~]# cvs -d :pserver:cvs@pserver.netfilter.org:/cvspublic login
Logging in to :pserver:cvs@pserver.netfilter.org:2401/cvspublic
CVS password:
cvs [login aborted]: connect to 
pserver.netfilter.org(213.95.27.115):2401 failed: Connection refused

so I really am giving up now after waisting enough time ... so any 
experts out there willing to take me by the hand ??????

thanks

