From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: IPs blocked still able to connect
Date: Sat, 12 Jun 2004 21:38:44 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406122138.45223.Antony@Soft-Solutions.co.uk>
References: <200406122017.i5CKHpnI030899@ylpvm01.prodigy.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406122017.i5CKHpnI030899@ylpvm01.prodigy.net>
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

On Saturday 12 June 2004 9:18 pm, Spiro Azkoul wrote:

> Hello
>
> I blocked a subnet by using the following command:
> iptables -A INPUT -s 222.0.0.0/8 -j DROP
> I then saved it to file
> iptables-save > /etc/sysconfig/iptables
> and did an iptables -L INPUT to verify that it is in
> DROP       all  --  222.0.0.0/8          anywhere
>
> However, i am still receiving SPAM from IPs within that subnet (and others)
> long after I thought I completely blocked them from connecting to my
> server.

Can you show us the headers of such an email, showing that the server which 
directly sent it to you is in that address range?

Try adding a LOG rule immediately after the above DROP rule:

iptables -A INPUT -s 222.0.0.0/8 -j LOG

After you get some more spam, try "iptables -L INPUT -nvx" and see what the 
packet & byte counts are for the two rules.

What are your other rules (output of "iptables -L -nvx")?

Regards,

Antony.

-- 
Wanted: telepath.   You know where to apply.

                                                     Please reply to the list;
                                                           please don't CC me.


