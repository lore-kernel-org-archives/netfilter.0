From: Arindam Haldar <arindamhaldar@inbox.lv>
Subject: Re: owner based policy routing
Date: Mon, 14 Oct 2002 17:51:37 +0530
Sender: lartc-admin@mailman.ds9a.nl
Message-ID: <3DAAB6D1.2000100@inbox.lv>
References: <Pine.LNX.4.44.0210120056220.1206-100000@u.domain.uli>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <lartc-admin@mailman.ds9a.nl>
Errors-To: lartc-admin@mailman.ds9a.nl
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Subscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Julian Anastasov <ja@ssi.bg>
Cc: LARTC <lartc@mailman.ds9a.nl>, NETFILTER <netfilter@lists.netfilter.org>

ok, i have tried applying the ip rule fwmark in hex but dont see any 
difference !..

The routing decission is take be4 the packets comes to OUTPUT table, if 
thats true then it will be not possible to route **owner** as per policy 
routing--am i right ??
if ys then how can one achieve **owner** based policy routing in linux 
box ??

Julian Anastasov wrote:
> 	Hello,
> 
> On Fri, 11 Oct 2002, Arindam Haldar wrote:
> 
> 
>>50:     from all fwmark       50 lookup ispA
> 
> 
> 	fwmark in ip rule is 0x50 (it is defined and printed in hex)
> 
> 
>>iptables -I OUTPUT -t mangle -m owner --uid-owner <squid> -d 202.0.0.0/8
>>  -j MARK --set-mark 50
> 
> 
> 	and here 50 is 0x32 (not 0x50). Is that the problem?
> 
> Regards
> 
> --
> Julian Anastasov <ja@ssi.bg>
> 
> 
> 


_______________________________________________
LARTC mailing list / LARTC@mailman.ds9a.nl
http://mailman.ds9a.nl/mailman/listinfo/lartc HOWTO: http://lartc.org/
