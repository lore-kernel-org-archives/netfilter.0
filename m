From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem seperating FTP & ms-streaming traffic
Date: Mon, 15 Mar 2004 07:26:16 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403150726.16952.Antony@Soft-Solutions.co.uk>
References: <000d01c40a0e$450f0a50$de0aa8c0@comp> <200403142221.55622.Antony@Soft-Solutions.co.uk> <004801c40a28$7a8a2560$de0aa8c0@comp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <004801c40a28$7a8a2560$de0aa8c0@comp>
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

On Monday 15 March 2004 12:57 am, Bo Jacobsen wrote:

> Well, the complete set of rules I use for passive ftp is actually:
>
> # Accept port 21 out
> iptables -A FORWARD -p tcp -m state --state NEW,ESTABLISHED -s local_lan
> --sport highports -d all_hosts --dport ftp -j ACCEPT -i eth1
>
> #Accept reply on port 21 in
> iptables -A FORWARD -p tcp -m state --state ESTABLISHED -d local_lan
> --dport highports -s all_hosts --sport ftp -j ACCEPT -i eth0
>
> # Accept high-port to high-port out
> iptables -A FORWARD -p tcp -m state --state ESTABLISHED,RELATED -s
> local_lan --sport highports -d all_hosts --dport highports -j ACCEPT -i
> eth1
>
> # Accept high-port to high-port reply in
> iptables -A FORWARD -p tcp -m state --state ESTABLISHED -d local_lan
> --dport highports -s all_hosts --sport highports -j ACCEPT -i eth0

I suggest you replace all the above rules with:

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -p tcp -s local_lan --dport 21 -j ACCEPT

and let us know how you get on.

If that doesn't solve the problem then please (a) post your complete ruleset 
(note the word 'complete'), and (b) include all variables etc (such as 
'local_lan') so that we know how you've defined things.   The output from 
"iptables -L -nvx; iptables -L -t nat -nvx" would be good.

Regards,

Antony.

-- 
The idea that Bill Gates appeared like a knight in shining armour to lead all 
customers out of a mire of technological chaos neatly ignores the fact that 
it was he who, by peddling second-rate technology, led them into it in the 
first place.

 - Douglas Adams in The Guardian, 25th August 1995

                                                     Please reply to the list;
                                                           please don't CC me.


