From: "IT Clown" <iptables@mailbox.co.za>
Subject: network range
Date: Sat, 03 Apr 2004 21:35:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <web-275892654@mail01.infosat.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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
To: netfilter@lists.netfilter.org

Hi

How do you specifiy more than one netwrk range in a rule,
is it possible? 

i want to do the following:
iptables -A INPUT -s 10.0.0.0/8 169.254.0.0/16 -j DROP

Regards
_______________________________________________________
Herbalife Independent Distributor www.healthiest.co.za

