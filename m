From: Leonardo Bruno <leonardo@cefetmg.br>
Subject: Re: [Fwd: How to enable Xen VM traffic using nft]
Date: Fri, 17 Nov 2017 18:30:37 -0200
Message-ID: <1510950637.25976.2.camel@cefetmg.br>
References: <1509137741.13003.0.camel@cefetmg.br>
         <1510179317.5175.1.camel@cefetmg.br>
         <CAOkSjBhTxijtCRh7PK=Pw_RYwPOnbY2ZeeQP7DhEoRoWYWEtRQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAOkSjBhTxijtCRh7PK=Pw_RYwPOnbY2ZeeQP7DhEoRoWYWEtRQ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter <netfilter@vger.kernel.org>

Em qui, 2017-11-09 às 12:51 +0100, Arturo Borrero Gonzalez escreveu:
> On 8 November 2017 at 23:15, Leonardo Bruno <leonardo@cefetmg.br>
> wrote:
> > Hi guys.
> > 
> > Any clue on this subject?
> > 
> > Hope someone can help.
> > 
> 
> Try using nftables in the bridge family.
> 
> I see we lack some information here so I added a new wiki page:
> 
> https://wiki.nftables.org/wiki-nftables/index.php/Nftables_families
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter"
> in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

Thank you guys.

I am a little frustrated. I can not match the virtual bridged interface
in any way either using bridge or inet families.

To make myself more clear, I used to configure iptables default chain
policies as 'drop' and then added the exceptions. So considering you
have a virtual interface vif0 bridged 'under' bridge br0, all you have
to do is to accept packages going in and out through vif0 using the
chain FORWARD of table filter.

So all my tries were guided by this objective: to match the virtual
interface and accept the packages. First I used the chains in
inet/filter table, and so I did the same using bridge/filter table

I tried rules like:

table inet tb_filter {
	chain ch_forward {
		type filter hook forward priority 0; policy drop;
		iifname "vif3.0" log prefix "VIF3_FW_IN_" accept
		oifname "vif3.0" log prefix "VIF3_FW_OUT_" accept
	}

	chain ch_input {
		type filter hook input priority 0; policy drop;
		iifname "vif3.0" log prefix "VIF3_IN_" accept
	}

	chain ch_output {
		type filter hook output priority 0; policy drop;
		oifname "vif3.0" log prefix "VIF3_OUT_"  accept
	}
}

I watched syslog to see which rule really matches, but I could only see
broadcast/multicast packages. Sometimes I could see that a rule
matches, but when I switched the chain default policy to drop, it
didn't work.

I tried similar rules using bridge family and prerouting/postrouting
chains and nothing.

Maybe you can spot what I am missing. Thank you so much.

Regards,
Leonardo Lopes

-- 
Esta mensagem foi verificada pelo sistema de antivírus e
 acredita-se estar livre de perigo.

