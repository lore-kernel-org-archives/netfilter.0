From: Roberto Nibali <ratz@tac.ch>
Subject: Re: firewall failover / cluster
Date: Wed, 08 Jan 2003 14:31:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E1C2822.40200@tac.ch>
References: <000301c2a7df$4d60cb90$0501020a@compname3>
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
To: freedom <freedom10@idemation.com>
Cc: 'Hauser Marcel' <marcel_hauser@gmx.ch>, netfilter@lists.netfilter.org

freedom wrote:
> Partially along this same subject, I am curious what is currently being
> used in a fault tolerant AND load-balanced iptables configuration.
> Perhaps a better question...is anybody using iptables in a HA, Load
> balancing scenario?

http://www.linux-vs.org + http://keepalived.sf.net = load balanced HA nodes

Define iptables in a HA scenario, please. One part that is missing is the 
conntrack state transition synchronisation but this will still not make a packet 
filter HA, only an active/passive system.

Please check recent research papers emerged from symposia on network and 
security topics last year for further reference.

Regards,
Roberto Nibali, ratz
-- 
echo '[q]sa[ln0=aln256%Pln256/snlbx]sb3135071790101768542287578439snlbxq' | dc


