From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: MARK and ! question
Date: Thu, 26 Jun 2003 16:51:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EFB0886.9060000@gmx.de>
References: <3EFAF50E.3050200@is.lg.ua>
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
To: Ruslan Spivak <alienoid@is.lg.ua>
Cc: netfilter@lists.netfilter.org


What about using a user-defined chain like this:

iptables -t mangle -N setmark
iptables -t mangle -A setmark -s ! 193.220.70.0/27 -d 193.220.70.32/27 \
         -j RETURN
iptables -t mangle -A setmark -s ! 193.108.240.0/22 -d 193.220.70.32/27 \
         -j RETURN
iptables -t mangle -A setmark -j MARK --set-mark 107
iptables -t mangle -A POSTROUTING -j setmark

Hope this helps

Sven


Ruslan Spivak wrote:

> Hello.
>
> I need to mark with value 107 packets that are going NOT from the 
> 193.220.70.0/27 network and NOT from the 193.108.240.0/22 network.
> Is it possible?
>
> Below two lines seem not to work properly because second rule won't be 
> reached.
>
> iptables -t mangle -A POSTROUTING -s ! 193.220.70.0/27 -d 
> 193.220.70.32/27 -j MARK --set-mark 107
>
> iptables -t mangle -A POSTROUTING -s ! 193.108.240.0/22 -d 
> 193.220.70.32/27 -j MARK --set-mark 107
>
> Your help is very, very appreciated.
>
> Best regards,
> Ruslan
>
>
>


