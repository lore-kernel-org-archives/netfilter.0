From: Sven Schuster <schuster.sven@gmx.de>
Subject: Re: --sport
Date: Wed, 05 Mar 2003 17:36:15 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3E66277F.3090001@gmx.de>
References: <ABEKJILKOKKGGDJKHKDFGEALCAAA.patrick@vikus.com>
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
To: Patrick Ahler <patrick@vikus.com>, netfilter@lists.netfilter.org


What you need is the mport-match:

iptables -A FORWARD -p tcp -m mport --sport 5000:5020 -m state ...

Sven


Patrick Ahler wrote:

>1. Is there a way to specify a range of source ports when setting a rule. My
>ftp server uses ports 5000-5020 for passive but I don't want to have to
>write a rule for each port. (For a network firewall). The ftp server is
>behind the firewall.
>
>
>iptables -A FORWARD -p tcp --sport 5000 -m state --state
>NEW,ESTABLISHED,RELATED -j ACCEPT
>
>
>
>  
>


