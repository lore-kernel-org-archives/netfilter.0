From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: how to allow multiple -d flags?
Date: Wed, 25 Feb 2004 23:01:19 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200402252301.19692.Antony@Soft-Solutions.co.uk>
References: <66425557D80D6448A99C4BAFFE9874030CA661@icptex02.corp.icpt.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <66425557D80D6448A99C4BAFFE9874030CA661@icptex02.corp.icpt.net>
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

On Wednesday 25 February 2004 10:40 pm, Michael Brown wrote:

> How can I specify a SNAT rule to exclude multiple destination networks?

Create a user-defined list which checks for the excluded networks, and then 
does the SNAT at the end (for all addresses which didn't match).

> Is there a way to do something like
>
> /sbin/iptables -t nat -A POSTROUTING -o eth0 -s
> 172.28.22.0/255.255.255.0 -d ! 172.0.0.0/8,10.0.0.0/8,192.168.0.0/16 -j
> SNAT --to-source 64.243.144.209
>
> I 've tried spaces between the networks, commas, semi-colon, nada

No; as you've discovered, you can't have multiple matches (either with or 
without the !).

Try:

iptables -N MYSNAT -t nat
iptables -A POSTROUTING -s 172.28.22.0/24 -j MYSNAT

iptables -A MYSNAT -t nat -d 10.0.0.0/8 -j RETURN
iptables -A MYSNAT -t nat -d 172.16.0.0/12 -j RETURN
iptables -A MYSNAT -t nat -d 192.168.0.0/16 -j RETURN
iptables -A MYSNAT -t nat -j SNAT --to 64.243.144.209

Antony.

-- 
"The joy of X!!??  I've always hated compiling graphical shite.  You have a 10 
line program, and it ends up depending on the entire known universe."

 - Philip Hands

                                                     Please reply to the list;
                                                           please don't CC me.


