From: "Svein E. Seldal" <Svein.Seldal@solidas.com>
Subject: Re: Connection opening problem (prev: FTP/auth problems (slooow links))
Date: Tue, 15 Oct 2002 23:21:17 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAC86CD.9030506@solidas.com>
References: <3DA97045.2040803@solidas.com> <20021013235022.ZXXG27697.mta05-svc.ntlworld.com@there> <3DAA80EA.7070106@solidas.com>
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
Cc: netfilter@lists.netfilter.org

Hello,

The root of my problem was this:

 > [0:0] -A SYNFLOOD -m limit --limit 1/s --limit-burst 4 -j RETURN
 > [0:0] -A SYNFLOOD -j DROP
 > [0:0] -A CHECK -p tcp -m tcp --tcp-flags SYN,RST,ACK SYN -j SYNFLOOD

When the HTTP/FTP-clients etc. spawned several connections (in this case 
 >4) to download files, the router blocked them.

I guess that it adds protection to keep the SYNFLOOD check there. What 
are sensible values to use on -m limit, making it work for flooding, yet 
not stopping normal clients?

Thanks guys,
Svein


