From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Problem seperating FTP & ms-streaming traffic
Date: Sun, 14 Mar 2004 22:21:55 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200403142221.55622.Antony@Soft-Solutions.co.uk>
References: <000d01c40a0e$450f0a50$de0aa8c0@comp>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000d01c40a0e$450f0a50$de0aa8c0@comp>
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

On Sunday 14 March 2004 9:49 pm, Bo Jacobsen wrote:

> I have a problem allowing forwarding of passive internal ftp traffic and,
> at the same time disallowing ms-streaming (port 1755).
>
> Whenever I allow the passive ftp, it also allows ms-streaming going
> through.
>
> My rules are:
>
> iptables -A FORWARD -m state --state NEW,ESTABLISHED -s local_lan --sport
> highports --dport ftp -j ACCEPT
> iptables -A FORWARD -m state --state ESTABLISHED,RELATED -s local_lan
> --sport highports --dport highports -j ACCEPT

Those cannot be all of your rules.

Show us the rest of the rules and we might be able to suggest something.

Antony.

-- 
Normal people think "If it ain't broke, don't fix it".
Engineers think "If it ain't broke, it doesn't have enough features yet".

                                                     Please reply to the list;
                                                           please don't CC me.


