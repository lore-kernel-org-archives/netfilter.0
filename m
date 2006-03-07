From: Aleksander <aleksander@krediidiinfo.ee>
Subject: Re: FTP through Firewall
Date: Tue, 07 Mar 2006 17:01:20 +0200
Message-ID: <440DA040.2010700@krediidiinfo.ee>
References: <20060304184727.92357.qmail@web54708.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060304184727.92357.qmail@web54708.mail.yahoo.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Davis Sylvester wrote:
> iptables -A FORWARD -m state --state
> RELATED,ESTABLISHED -j ACCEPT
> iptables -A FORWARD -m state --state NEW -i eth4 -o
> eth5 -d 1.1.1.2 -p tcp --dport ftp -j ACCEPT
> iptables -t nat -A PREROUTING -i eth1 -d 208.1.1.1 -p
> tcp --dport ftp -j DNAT --to 1.1.1.2

Shouldn't the PREROUTING rule's interface option (-i) match the one in 
the FORWARD rule?

You're doing DNAT for packets from eth1, but allowing packets to the ftp 
box that come from eth4.

Right now the packets are DROPped/REJECTed depending on your filter 
FORWARD policy.

HTH,
	Alex

