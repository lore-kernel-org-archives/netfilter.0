From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: newbie question
Date: Thu, 8 Apr 2004 13:41:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404081341.03126.Antony@Soft-Solutions.co.uk>
References: <004601c41d60$9bf1af70$aa47aacb@hacker> <200404081302.49038.Antony@Soft-Solutions.co.uk> <000501c41d65$86446c30$aa47aacb@hacker>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000501c41d65$86446c30$aa47aacb@hacker>
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

On Thursday 08 April 2004 1:32 pm, M. Ahmad Ijaz wrote:

> do i know where to put that "-t nat"
>  iptables -A PREROUTING -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m
> tcp --dport 80 -j REDIRECT --to-ports 8080

I don't know - do you?   I'll assume that you don't, since you've asked us...

My preference is to place it after the chain name:

iptables -A PREROUTING -t nat -s xxx.xxx.xxx.xxx/yyy.yyy.yyy.yyy -p tcp -m
tcp --dport 80 -j REDIRECT --to-ports 8080

However other people sometimes place it before.

Regards,

Antony.

-- 
If you want to be happy for an hour, get drunk.
If you want to be happy for a year, get married.
If you want to be happy for a lifetime, get a garden.

                                                     Please reply to the list;
                                                           please don't CC me.


