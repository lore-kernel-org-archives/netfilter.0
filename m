From: "Seferovic Edvin" <edvin.seferovic@kolp.at>
Subject: RE: HowTo connect a Cisco 2950 switch behind iptables?
Date: Thu, 13 Oct 2005 23:09:14 +0200
Message-ID: <17090.8581851565$1129237994@news.gmane.org>
References: <434ECB83.80800@hosttuls.com>
Reply-To: edvin.seferovic@kolp.at
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <434ECB83.80800@hosttuls.com>
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

Maybe you have forgotten to configure your cisco switch? Wrong VLAN maybe? 

Regards,

Edvin Seferovic

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Brandon Evans
Sent: Donnerstag, 13. Oktober 2005 23:03
To: netfilter@lists.netfilter.org
Subject: HowTo connect a Cisco 2950 switch behind iptables?

Hi all,
	I have a Fedora 3 Box with 2 nics setup up as a firewall.
I can connect another server to the firewall and get connected to the 
Net just fine.  This doesnt work when I connect the switch to the 
iptables box.  Obvysly I am missing something - can someone point me in 
the right direction?

Here is my setup

---WAN-->[iptables box]---->[cisco switch]--->[servers]


-- 

Thanks,
     Brandon Evans

  "I wouldn't recommend sex, drugs or insanity for everyone, but they've 
always worked for me."
-Hunter S. Thompson



