From: "Spiro Azkoul" <spiro@snacorp.net>
Subject: RE: IPs blocked still able to connect
Date: Sun, 13 Jun 2004 16:59:20 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406132359.i5DNx0bJ016290@ylpvm15.prodigy.net>
References: <20040613135859.51704919@mgalepc.utilitran.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20040613135859.51704919@mgalepc.utilitran.com>
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


Hello,

	You should be able to "man iptables"

-> I did, got the info I needed. Thanks.
I also transferred all my -A rules to -I and an iptables -L INPUT now shows
priority to the -I rules, which basically should not block any traffic to my
server. 

On the other hand, I have a couple more questions:

1- If I have 2 Nic Cards, eth0 and eth1, without any kind of NATing
involved, as I am simply using the private interface for backup jobs, local
SSH and so forth, should I worry about the FORWARD chain? There is no
routing between the 2 interfaces nor do I need there be so I assumed so far
that my INPUT/OUTPUT rules will apply to the public interface without having
to go the extra step of specifying it. 

2- Is there a way to build a text file and have IPTABLES pull from it
periodically? I know this could be done in perl, but has anyone tried to do
it with a simple cron job?

Thanks
 


