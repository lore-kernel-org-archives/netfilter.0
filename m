From: "Franck" <franck@zoccolo.com>
Subject: RE : Port forward
Date: Tue, 4 Feb 2003 12:17:14 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2cc3e$f9c04040$29a2a8c0@dev.gcf.fr>
References: <D007132BBC42D5118FD20002A52844414BCF2F@ASC01>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <D007132BBC42D5118FD20002A52844414BCF2F@ASC01>
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

> Thanks a lot the error message is gone now,
> after I changed the line to:
> iptables -t nat -A PREROUTING -p tcp --destination-port 25 -i eth0 -j
DNAT --to-destination 192.168.22.6:25

> But when I do iptables --list
> I dont see any entrys in the chain for PREROUTING

You must specify that you want to list the content of the nat table....

iptables -t nat --list



