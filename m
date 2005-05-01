From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?=
	<leolistas@solutti.com.br>
Subject: Re: rules for skype
Date: Sun, 01 May 2005 19:35:56 -0300
Message-ID: <427559CC.9050108@solutti.com.br>
References: <20050501223241.CF7E4103130@correio.solutti.com.br>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050501223241.CF7E4103130@correio.solutti.com.br>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: edvin.seferovic@kolp.at
Cc: netfilter@lists.netfilter.org


    Skype is able of connect using squid throw HTTPS connections, which 
makes it harder to block using squid ACLs, as when HTTPS is used, squid 
sees nothing only the hostname that you're connecting and NOT the whole URL.


    Sincerily,
    Leonardo Rodrigues


Seferovic Edvin escreveu:

>DEVIL_MODE = 1;
>You can stop it by blocking incoming high ports ;) 
>
>DEVIL_MODE = 0;
>Why should you block all incoming high ports? Hm.. maybe you want to allow
>only web traffic that comes and goes through a squid proxy ;)
>
>Regards,
>
>Edvin Seferovic
>
>-----Original Message-----
>From: netfilter-bounces@lists.netfilter.org
>[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Taylor, Grant
>Sent: Montag, 02. Mai 2005 00:00
>To: netfilter@lists.netfilter.org
>Subject: Re: rules for skype
>
>  
>
>>iptables -A FORWARD -p tcp --dport SKYPEPORT -j ACCEPT
>>    
>>
>
><devilish @^*% eating grin> He, Skype does not have a port (per say).
></devilish @^*% eating grin>
>
>Skype will use just about any port that it can use (all the standards you
>would think for internet traffic) to connect to any ""super node that it can
>connect to.  unfortunately what qualifies as a Super Node is any node /
>computer that is running Skype that is directly connected to the internet
>with out a firewall that would inhibit other systems from connecting
>directly to it.  Do a Google for "Skype Protocol" and see what you find.  I
>have a PDF on it at the office that I'd be happy to send you.  (If you want
>this PDF I'll find the URL to it and post it to the list or email
>individually as I don't think the list would like a PDF sent to it.)  The
>only way that I've heard to even slow down Skype is to force it to pass
>through a proxy, beyond that nothing, that I have heard of or read about,
>will stop it.
>
>
>
>Grant. . . .
>
>
>
>
>  
>
