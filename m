From: Jonathan G - Mailing List <email-lists@surestorm.com>
Subject: Newbie :: Block IP Range seems not to work
Date: Sun, 05 Oct 2003 15:05:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F801725.6050207@surestorm.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

i'm a newbie in iptables (i have only used commercial products but never 
tried to  write my own rules step by step).

I have read the iptables manual, and other related to server 
configuration but in my case it seems not to work. I'm sure i'm doing 
somrething wrong but i don't know what exactly.

I want to learn to do it fine to modify the default rules that comes 
with IPCop fireall to fit my needs at home.

What i need is to block an ip range completely. I have a internal web 
server. Over my firewall i make a port forward to send all traffic that 
arrives at the firewall to the web server. The firewall own the public 
ip address of my site.

I have used a syntax like this:

iptables -A CUSTOMINPUT -s <RANGE> -j DROP
iptables -A CUSTOMFORWARD -p tcp -s <RANGE> -d <WebSrvIp> --dport 80
iptables -A PORTFWACCESS -p tcp -s <RANGE> -d <WebSrvIp> --dport 80 -j DROP

CUSTOMINPUT is a chain of INPUT type
     - CUSTOMINPUT  all  --  0.0.0.0/0            0.0.0.0/0
CUSTOMFORWARD is a chain of FORWARD type
     - CUSTOMFORWARD  all  --  0.0.0.0/0          0.0.0.0/0
PORTFWACCESS is a chain of FORWARD type
     - PORTFWACCESS  all  --  0.0.0.0/0           0.0.0.0/0

TIA

jonathan

-- 
___________________________________________________________________
  Jonathan Gonzalez - SureStorm.com Security Site - Madrid/MA/SPAIN
  http://www.surestorm.com - GnuPG Key ID = 0xAA3EAC08

  /"\
  \ /  ASCII RIBBON CAMPAIGN
   X   Against HTML mail & Microsoft attachments
  / \


