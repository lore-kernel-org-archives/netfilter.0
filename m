From: txemi <txemi2@euskalnet.net>
Subject: Re: netfilter promiscuous and connection tracking for IDS
Date: 20 Jun 2003 11:50:53 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1056102653.32294.4.camel@leela>
References: <5c69c60fab.60fab5c69c@euskaltel.es>
Reply-To: txemi2@euskalnet.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5c69c60fab.60fab5c69c@euskaltel.es>
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
To: JOSE MIGUEL MARTINEZ <txemi2@clientes.euskaltel.es>
Cc: netfilter@lists.netfilter.org, Fernando =?ISO-8859-1?Q?Migu=E9lez?= Palomo <f.miguelez@captiva-sys.es>

Hi, I am working on IDS and I am trying to use netfilter 
conntrack on promiscuous mode. I want to track status of connections 
not intended for localhost. I have been using Sebastian Zander's patch 
 
web:http://www.fokus.gmd.de/research/cc/glone/employees/sebastian.zander/private/netfilter.html 
patch:netfilter-prom-patch.tgz 
Sebastian's mail:zander@fokus.gmd.de 
 
It adds a new table called meter that handle promiscuous packages. It 
works, but I was not able to track connection status using conntrack. 
 
Could anybody advise me on this? I need to make a decission, keep 
trying or 
go to user space to mangle all this through libpcap as snort or ntop. 
 
thanks, 
txemi. 

-- 
 ______________________________
< hola, soy una firma horrible >
 ------------------------------
        \   ^__^
         \  (oo)\_______
            (__)\       )\/\
                ||----w |
                ||     ||

mail: txemi <txemi2@euskalnet.net>
web: http://txemi.webhop.org
mirror: http://txemi2.webhop.org

