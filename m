From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: port translation on the same network
Date: Mon, 19 Jul 2004 09:55:06 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407190955.06482.Antony@Soft-Solutions.co.uk>
References: <001701c46caa$6d99c290$d802d98a@smaug>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001701c46caa$6d99c290$d802d98a@smaug>
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

On Sunday 18 July 2004 10:34 am, gene bene wrote:

> I have a print job in my network which comes in on port 10001 raw packets
> (from a citrix server)
>
> I need to use iptables to translate the port number to 9100
>
> I have tried to set up a virtual ip (eth0:0) and use DNAT and SNAT to
> translate the port with no success.
>
> Can anyone help me with the correct settings?

Apply this rule on the machine receiving the packets:

iptables -A PREROUTING -t nat -p tcp --dport 10001 -j DNAT --to :9100

(Assuming you meant they are TCP packets; if they're UDP just change the rule 
in the obvious manner).

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


