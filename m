From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: Port forward
Date: Tue, 04 Feb 2003 12:53:49 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E3FA9CD.3030607@gmx.de>
References: <D007132BBC42D5118FD20002A52844414BCF2F@ASC01>
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

ASC - Ronald Roeleveld wrote:

 > Thanks a lot the error message is gone now,
 > after I changed the line to:
 > iptables -t nat -A PREROUTING -p tcp --destination-port 25 -i eth0 -j
 > DNAT --to-destination 192.168.22.6:25
 >
 > But when I do iptables --list
 > I dont see any entrys in the chain for PREROUTING
 >
You need to put in the "-t nat" here too to show the nat table:

iptables -t nat --list

Sven



