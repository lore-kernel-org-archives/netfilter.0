From: Andreas Czerniak <cognac@toppoint.de>
Subject: Re: mail relay
Date: Thu, 20 Mar 2003 16:33:32 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <106060000.1048174412@[192.168.42.42]>
References: <OFF04453C4.ECF4132D-ONC1256CEF.00548382-C1256CEF.00543F77@LocalDo
 main>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <OFF04453C4.ECF4132D-ONC1256CEF.00548382-C1256CEF.00543F77@LocalDomain>
Content-Disposition: inline
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
To: david@atd.es
Cc: netfilter@lists.netfilter.org


iptables -A INPUT -j DROP -p tcp -m tcp -s ! <isp_ip> --dport 25

Nice day,

Andreas.

-- On 20.03.2003 16:25:01 +0100 david@atd.es wrote:

>
> Hi everybody,
> I would like to know how can I filter the mail relay received in my port 25
> with the firewall,..  I want only accept the packets from only one ip, my
> ISP.  This is possible this rule with iptables ??
>
> Thanks
--
"Ich denke, man hat kein Recht, andere zu kontrollieren oder Ihnen etwas
aufzuzwingen, den eigenen Glauben oder die eigene Art zu leben."
- Dalai Lama "Begegnungen".
-------------------------------------------------------------------
Andreas Czerniak <cognac@toppoint.de>  -  Kiel  -  FRG  -  Fax:+49-431-2000447
PGPkey: http://wwwkeys.nl.pgp.net:11371/pks/lookup?op=get&search=0xEDB224EC


