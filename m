From: surf3r <surf3r@pop.com.br>
Subject: Re: ICMP and state/conntrack
Date: 28 Feb 2003 08:48:42 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1046432923.5076.7.camel@rodrigo.prc>
References: <20030228103743.GA31779@ok.is>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030228103743.GA31779@ok.is>
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
Cc: netfilter@tommi.org

Hellow :)


> iptables -A FORWARD -m state --state NEW,INVALID -j REJECT

You must be especify the protocol on this rule: 

iptables -A FORWARD -p icmp -m state --state NEW,INVALID -j REJECT

You has that to understand tables with independent rules 


Brazil rules : carnaval 2003 :)


-- 


surf3r  -o)
        /\\
       _\_V
--   --------



On Fri, 2003-02-28 at 07:37, netfilter@tommi.org wrote:
> Hello
> 
> I'm wondering if state doesn't apply to ICMP packets.
> 
> iptables -A FORWARD -p icmp -m state -d 1.2.3.4 --state NEW -j ACCEPT
> iptables -A FORWARD -m state --state NEW,INVALID -j REJECT
> 
> if I ping 1.2.3.4 the echo-reply is blocked from 1.2.3.4. Is this normal, I
> thought that the echo-reply should be marked RELATED and therefore not
> blocked?
> 
> 
> ====
> Tomas Edwardsson
> HP Technical Support      \  HP Certified System Administrator
> Red Hat Technical Support  \  Red Hat Certified Engineer.
> Opin Kerfi
> 
> 
> 



