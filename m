From: Thomas Braun <tb@westend.com>
Subject: iplimit
Date: Mon, 09 Sep 2002 09:51:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D7C52EF.5000806@westend.com>
Reply-To: Thomas Braun <tb@westend.com>
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

Hi Group,

i trying to use the iplimit module and typed:

iptables -A INPUT -i eth0 -p tcp --syn --dport 25 -m iplimit 
--iplimit-above 2 -j DROP


than get this error message:
iptables: No chain/target/match by that name


can someone tell me what i do wrong?
without the iplimit modules all is working.

my Kernel Version 2.4.19, my iptables version is v1.2.6a.
Do i need some  extra Kernel modules for it? I havent seen it in the 
normal  Kernel.

thx for your help.


cu thomas

-- 
Thomas Braun       WESTEND GmbH - Aachen und Dueren     Tel 0241/701333-0
tb@westend.com   Internet & Security for Professionals    Fax 0241/911879
         WESTEND ist CISCO Systems Partner - Authorized Reseller       





