From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: PREROUTING exclude
Date: Thu, 5 Sep 2002 14:01:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200209051301.g85D1Av00511@vulcan.rissington.net>
References: <F16XvpFVjCRGryWtIIZ000009c9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F16XvpFVjCRGryWtIIZ000009c9@hotmail.com>
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

On Thursday 05 September 2002 1:50 pm, Scott Ainslie wrote:

> I want the following rule to work for all machines on my subnet except for
> 192.168.0.4. How do I exclude this single machine from this rule?
>
> /sbin/iptables -t nat -A PREROUTING -i eth0 -p tcp \
> -s 192.168.0.0/24 \
> -d 0/0 --dport 80 \
> -j DNAT --to 192.168.0.4:3128

Put the following rule before the one above:

iptables -A PREROUTING -t nat -i eth0 -p tcp --dport 80 -s 192.168.0.4 -j 
ACCEPT

In other words, match the machine you do not want to be translated, and use 
the ACCEPT target to stop processing further rules for this machine.

Antony.

-- 

If at first you don't succeed, destroy all the evidence that you tried.

